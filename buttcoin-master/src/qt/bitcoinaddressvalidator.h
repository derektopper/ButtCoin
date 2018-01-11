// Copyright (c) 2011-2014 The buttcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef buttcoin_QT_buttcoinADDRESSVALIDATOR_H
#define buttcoin_QT_buttcoinADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class buttcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit buttcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** buttcoin address widget validator, checks for a valid buttcoin address.
 */
class buttcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit buttcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // buttcoin_QT_buttcoinADDRESSVALIDATOR_H
