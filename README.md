# ButtCoin
Buttcoin Core integration/staging tree https://tinyurl.com/ButtCoinFeedback

# This is somewhat a parody, but also a functioning currency. Made of Butts.

Biuttoin Core integration/staging tree
=====================================

[![Build Status](https://travis-ci.org/buttcoin/buttcoin.svg?branch=master)](https://travis-ci.org/buttcoin/buttcoin)

https://buttcoincore.org

What is Buttcoin?
----------------

Buttcoin is an experimental digital currency that enables instant payments to
anyone, anywhere in the world. Buttcoin uses peer-to-peer technology to operate
with no central authority: managing transactions and issuing money are carried
out collectively by the network. Buttcoin Core is the name of open source
software which enables the use of this currency. Buttcoin was founded by Jack Gilmore,
Justin Barry, Derek B0tt0mer and Hideki Nakamura.

Honestly, if you know how to mine this, you can probably get a bunch of ButtCoin really easily.

For more information, as well as an immediately useable, binary version of
the Buttcoin Core software, see https://buttcoin.xyz/cz/download, or read the
[original whitepaper](https://buttcoincore.org/buttcoin.pdf).

License
-------

Buttcoin Core is released under the terms of the MIT license. See [COPYING](COPYING) for more
information or see https://opensource.org/licenses/MIT.

Development Process
-------------------

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/buttcoin/buttcoin/tags) are created
regularly to indicate new official, stable release versions of Buttcoin Core.

The contribution workflow is described in [CONTRIBUTING.md](CONTRIBUTING.md).

The developer [mailing list](https://lists.linuxfoundation.org/mailman/listinfo/buttcoin-dev)
should be used to discuss complicated or controversial changes before working
on a patch set.

Developer IRC can be found on Freenode at #buttcoin-core-dev.

Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test on short notice. Please be patient and help out by testing
other people's pull requests, and remember this is a security-critical project where any mistake might cost people
lots of money.

### Automated Testing

Developers are strongly encouraged to write [unit tests](src/test/README.md) for new code, and to
submit new unit tests for old code. Unit tests can be compiled and run
(assuming they weren't disabled in configure) with: `make check`. Further details on running
and extending unit tests can be found in [/src/test/README.md](/src/test/README.md).

There are also [regression and integration tests](/test), written
in Python, that are run automatically on the build server.
These tests can be run (if the [test dependencies](/test) are installed) with: `test/functional/test_runner.py`

The Travis CI system makes sure that every pull request is built for Windows, Linux, and OS X, and that unit/sanity tests are run automatically.

### Manual Quality Assurance (QA) Testing

Changes should be tested by somebody other than the developer who wrote the
code. This is especially important for large or high-risk changes. It is useful
to add a test plan to the pull request description if testing the changes is
not straightforward.

Translations
------------
Buttcoin is available in English and Pig Latin.

Translators should also subscribe to the [mailing list](https://tinyurl.com/ButtCoinFeedback).
