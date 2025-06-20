QT = core gui qml quick
QMAKE_CXXFLAGS_RELEASE += -O3 -flto -ffunction-sections -fdata-sections -std=c++20
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_DEBUG += -std=c++20
QMAKE_LFLAGS = -flto -Wl,--gc-sections
DISTFILES = .gitignore LICENSE.txt README.md
SOURCES = misc/main.cpp \
    misc/sgxcentral.cpp \
    primitives/sgxcolourhsla.cpp \
    primitives/sgxcolourrgba.cpp \
    primitives/sgxidentifier.cpp \
    primitives/sgxtimestamp.cpp \
    primitives/sgxtouchevent.cpp \
    primitives/sgxvector2.cpp \
    userDefinedClasses/sgucentralmanagement.cpp \
    userDefinedClasses/sgusignalemitter.cpp
RESOURCES = assets.qrc
HEADERS += \
    misc/sgxcentral.h \
    primitives/sgxcolourhsla.h \
    primitives/sgxcolourrgba.h \
    primitives/sgxidentifier.h \
    primitives/sgxtimestamp.h \
    primitives/sgxtouchevent.h \
    primitives/sgxvector2.h \
    userDefinedClasses/sgucentralmanagement.h \
    userDefinedClasses/sgusignalemitter.h
