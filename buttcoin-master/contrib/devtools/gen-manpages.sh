#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

buttcoinD=${buttcoinD:-$SRCDIR/buttcoind}
buttcoinCLI=${buttcoinCLI:-$SRCDIR/buttcoin-cli}
buttcoinTX=${buttcoinTX:-$SRCDIR/buttcoin-tx}
buttcoinQT=${buttcoinQT:-$SRCDIR/qt/buttcoin-qt}

[ ! -x $buttcoinD ] && echo "$buttcoinD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($buttcoinCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for buttcoind if --version-string is not set,
# but has different outcomes for buttcoin-qt and buttcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$buttcoinD --version | sed -n '1!p' >> footer.h2m

for cmd in $buttcoinD $buttcoinCLI $buttcoinTX $buttcoinQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
