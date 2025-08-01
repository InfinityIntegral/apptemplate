#include "sgxidentifier.h"
#include <QRandomGenerator>
#include <QSet>
#include <QString>

QSet<SGXIdentifier> SGXIdentifier::identifiersList = QSet<SGXIdentifier>();
const SGXIdentifier SGXIdentifier::nullIdentifier = SGXIdentifier(0);

SGXIdentifier::SGXIdentifier(bool ifValid){ // NOLINT(misc-no-recursion)
    if(ifValid == false){
        (*this).a = static_cast<unsigned int>((*QRandomGenerator::global()).generate());
        (*this).b = static_cast<unsigned int>((*QRandomGenerator::global()).generate());
        (*this).c = static_cast<unsigned int>((*QRandomGenerator::global()).generate());
        (*this).d = static_cast<unsigned int>((*QRandomGenerator::global()).generate());
    }
    else{
        SGXIdentifier t = SGXIdentifier(false);
        while(t.exists()){
            t = SGXIdentifier(false);
        }
        (*this) = t;
    }
}

SGXIdentifier::SGXIdentifier(int /*placeholder*/){
    (*this).a = 0u;
    (*this).b = 0u;
    (*this).c = 0u;
    (*this).d = 0u;
}

SGXIdentifier::SGXIdentifier(unsigned int a, unsigned int b, unsigned int c, unsigned int d, bool ifValid, int &errCode){
    (*this).a = a;
    (*this).b = b;
    (*this).c = c;
    (*this).d = d;
    if((*this) == SGXIdentifier::nullIdentifier){errCode = 2;}
    else if(ifValid == true && (*this).exists() == true){errCode = 1;}
}

SGXIdentifier::SGXIdentifier(const QString &s, bool ifValid, int &errCode){
    unsigned int a = 0u;
    unsigned int b = 0u;
    unsigned int c = 0u;
    unsigned int d = 0u;
    if(s.length() == 32){
        bool x = true;
        bool x0 = true;
        a = s.mid(0, 8).toUInt(&x, 16);
        if(x == false){x0 = false;}
        b = s.mid(8, 8).toUInt(&x, 16);
        if(x == false){x0 = false;}
        c = s.mid(16, 8).toUInt(&x, 16);
        if(x == false){x0 = false;}
        d = s.mid(24, 8).toUInt(&x, 16);
        if(x == false){x0 = false;}
        if(x0 == false){
            a = 0u;
            b = 0u;
            c = 0u;
            d = 0u;
        }
    }
    (*this).a = a;
    (*this).b = b;
    (*this).c = c;
    (*this).d = d;
    if((*this) == SGXIdentifier::nullIdentifier){errCode = 2;}
    else if(ifValid == true && (*this).exists() == true){errCode = 1;}
}

int SGXIdentifier::registerIdentifier() const {
    if(SGXIdentifier::identifiersList.contains((*this))){return 1;}
    SGXIdentifier::identifiersList.insert((*this));
    return 0;
}

int SGXIdentifier::unregisterIdentifier() const {
    if(SGXIdentifier::identifiersList.contains((*this)) == false){return 1;}
    SGXIdentifier::identifiersList.remove((*this));
    return 0;
}

bool SGXIdentifier::exists() const {
    return SGXIdentifier::identifiersList.contains((*this));
}

bool SGXIdentifier::operator==(SGXIdentifier x) const {
    return ((a == x.a) && (b == x.b) && (c == x.c) && (d == x.d));
}

bool SGXIdentifier::operator<(SGXIdentifier x) const {
    if(a != x.a){return (a < x.a);}
    if(b != x.b){return (b < x.b);}
    if(c != x.c){return (c < x.c);}
    return (d < x.d);
}

bool SGXIdentifier::operator!=(SGXIdentifier x) const {
    return ((a != x.a) || (b != x.b) || (c != x.c) || (d != x.d));
}

QString SGXIdentifier::getStringForPrinting() const {
    return (QString::number(a, 16).toUpper().rightJustified(8, '0')  + QString::number(b, 16).toUpper().rightJustified(8, '0') + QString::number(c, 16).toUpper().rightJustified(8, '0') + QString::number(d, 16).toUpper().rightJustified(8, '0'));
}
