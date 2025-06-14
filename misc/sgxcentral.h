#ifndef SGXCENTRAL_H
#define SGXCENTRAL_H

#include <QObject>
#include <memory>
#include "../userDefinedClasses/sgusignalemitter.h"

class SGXCentral : public QObject // non instantiable class for essential application data that should not be modified by the user
{
    Q_OBJECT // NOLINT
public:
    SGXCentral() = delete;
    SGXCentral(const SGXCentral&) = delete;
    SGXCentral(SGXCentral&&) = delete;
    SGXCentral& operator=(const SGXCentral&) = delete;
    SGXCentral& operator=(SGXCentral&&) = delete;
    ~SGXCentral() override = default;
    static void initialise(); // initialisation function run when app opens
    static void terminate(); // termination function run when app closes
    static std::unique_ptr<QFont> standardFont; // font used for displaying text, recommended to use SingScript.sg, which is default font file
    static std::unique_ptr<QFont> iconsFont; // font containing icons, SingScript.sg is placeholder, icons font should use Unicode private range to avoid confusion, picture icons are not supported by SGEXTN due to performance reasons
    static std::unique_ptr<SGUSignalEmitter> signalEmitter; // signal emitter allowing UI resizing and refreshing
};

#endif // SGXCENTRAL_H
