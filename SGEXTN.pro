QT = core gui qml quick quickcontrols2
QMAKE_CXXFLAGS_RELEASE += -O3 -flto -ffunction-sections -fdata-sections -std=c++20
QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_DEBUG += -std=c++20
QMAKE_LFLAGS = -flto -Wl,--gc-sections
DISTFILES = .gitignore LICENSE.txt README.md \
    SGEXTN/colourbackground/colourbackground.frag \
    SGEXTN/colourbackground/colourbackground.vert \
    SGEXTN/colourpickerrendering/huechoice/huechoice.frag \
    SGEXTN/colourpickerrendering/huechoice/huechoice.vert \
    SGEXTN/colourpickerrendering/lightnesschoice/lightnesschoice.frag \
    SGEXTN/colourpickerrendering/lightnesschoice/lightnesschoice.vert \
    SGEXTN/colourpickerrendering/saturationchoice/saturationchoice.frag \
    SGEXTN/colourpickerrendering/saturationchoice/saturationchoice.vert \
    SGEXTN/colourpickerrendering/transparencychoice/transparencychoice.frag \
    SGEXTN/colourpickerrendering/transparencychoice/transparencychoice.vert \
    SGEXTN/filesystem/bin.sgfile \
    SGEXTN/filesystem/singzip.sgfile \
    compilecommands.txt
SOURCES = SGEXTN/misc/main.cpp \
    SGEXTN/SingCorrect/sgxsingcorrectconfigspage.cpp \
    SGEXTN/SingCorrect/sgxsingcorrectcore.cpp \
    SGEXTN/SingCorrect/sgxsingcorrectcustomisation.cpp \
    SGEXTN/SingCorrect/sgxsingcorrectquickinterface.cpp \
    SGEXTN/colourbackground/sgxrendercolourbackgroundmaterial.cpp \
    SGEXTN/colourbackground/sgxrendercolourbackgroundquickuielement.cpp \
    SGEXTN/colourbackground/sgxrendercolourbackgroundshader.cpp \
    SGEXTN/colourpickerrendering/huechoice/sgxrendercolourpickerhuechoicematerial.cpp \
    SGEXTN/colourpickerrendering/huechoice/sgxrendercolourpickerhuechoicequickuielement.cpp \
    SGEXTN/colourpickerrendering/huechoice/sgxrendercolourpickerhuechoiceshader.cpp \
    SGEXTN/colourpickerrendering/lightnesschoice/sgxrendercolourpickerlightnesschoicematerial.cpp \
    SGEXTN/colourpickerrendering/lightnesschoice/sgxrendercolourpickerlightnesschoicequickuielement.cpp \
    SGEXTN/colourpickerrendering/lightnesschoice/sgxrendercolourpickerlightnesschoiceshader.cpp \
    SGEXTN/colourpickerrendering/saturationchoice/sgxrendercolourpickersaturationchoicematerial.cpp \
    SGEXTN/colourpickerrendering/saturationchoice/sgxrendercolourpickersaturationchoicequickuielement.cpp \
    SGEXTN/colourpickerrendering/saturationchoice/sgxrendercolourpickersaturationchoiceshader.cpp \
    SGEXTN/colourpickerrendering/transparencychoice/sgxrendercolourpickertransparencychoicematerial.cpp \
    SGEXTN/colourpickerrendering/transparencychoice/sgxrendercolourpickertransparencychoicequickuielement.cpp \
    SGEXTN/colourpickerrendering/transparencychoice/sgxrendercolourpickertransparencychoiceshader.cpp \
    SGEXTN/customisation/sgxthemecolourscustomisation.cpp \
    SGEXTN/customisation/sgxvesiclespropertiescustomisation.cpp \
    SGEXTN/cutevesicles/sgxrendercutevesiclesmaterial.cpp \
    SGEXTN/cutevesicles/sgxrendercutevesiclesquickuielement.cpp \
    SGEXTN/cutevesicles/sgxrendercutevesiclesshader.cpp \
    SGEXTN/filesystem/sgxfilebinutilities.cpp \
    SGEXTN/filesystem/sgxfiledownloader.cpp \
    SGEXTN/filesystem/sgxfilereader.cpp \
    SGEXTN/filesystem/sgxfilesystem.cpp \
    SGEXTN/filesystem/sgxfileuploader.cpp \
    SGEXTN/filesystem/sgxfilewriter.cpp \
    SGEXTN/filesystem/sgxfilezip.cpp \
    SGEXTN/misc/sgxcentral.cpp \
    SGEXTN/primitives/sgxcolourhsla.cpp \
    SGEXTN/primitives/sgxcolourrgba.cpp \
    SGEXTN/primitives/sgxidentifier.cpp \
    SGEXTN/primitives/sgxtimestamp.cpp \
    SGEXTN/primitives/sgxtouchevent.cpp \
    SGEXTN/primitives/sgxvector2.cpp \
    SGEXTN/quickui/sgxquickinterface.cpp \
    SGEXTN/quickui/sgxquickresizer.cpp \
    SGEXTN/quickui/sgxquickuiinterface.cpp \
    SGEXTN/quickui/sgxthemecoloursetting.cpp \
    SGEXTN/template/sgxcolourpicker.cpp \
    SGEXTN/template/sgxcutevesicles.cpp \
    SGEXTN/template/sgxstatusbar.cpp \
    SGEXTN/template/sgxthemecolourspage.cpp \
    SGEXTN/template/sgxvesiclepropertiespage.cpp \
    SGEXTN/userDefinedClasses/sgucentralmanagement.cpp \
    SGEXTN/widgets/sgwparent.cpp \
    SGEXTN/widgets/sgwroot.cpp \
    SGEXTN/widgets/sgwtype.cpp \
    SGEXTN/widgets/sgwwidget.cpp
RESOURCES = SGEXTN/assets.qrc
HEADERS += \
    SGEXTN/SingCorrect/sgxsingcorrectconfigspage.h \
    SGEXTN/SingCorrect/sgxsingcorrectcore.h \
    SGEXTN/SingCorrect/sgxsingcorrectcustomisation.h \
    SGEXTN/SingCorrect/sgxsingcorrectquickinterface.h \
    SGEXTN/colourbackground/sgxrendercolourbackgroundmaterial.h \
    SGEXTN/colourbackground/sgxrendercolourbackgroundquickuielement.h \
    SGEXTN/colourbackground/sgxrendercolourbackgroundshader.h \
    SGEXTN/colourpickerrendering/huechoice/sgxrendercolourpickerhuechoicematerial.h \
    SGEXTN/colourpickerrendering/huechoice/sgxrendercolourpickerhuechoicequickuielement.h \
    SGEXTN/colourpickerrendering/huechoice/sgxrendercolourpickerhuechoiceshader.h \
    SGEXTN/colourpickerrendering/lightnesschoice/sgxrendercolourpickerlightnesschoicematerial.h \
    SGEXTN/colourpickerrendering/lightnesschoice/sgxrendercolourpickerlightnesschoicequickuielement.h \
    SGEXTN/colourpickerrendering/lightnesschoice/sgxrendercolourpickerlightnesschoiceshader.h \
    SGEXTN/colourpickerrendering/saturationchoice/sgxrendercolourpickersaturationchoicematerial.h \
    SGEXTN/colourpickerrendering/saturationchoice/sgxrendercolourpickersaturationchoicequickuielement.h \
    SGEXTN/colourpickerrendering/saturationchoice/sgxrendercolourpickersaturationchoiceshader.h \
    SGEXTN/colourpickerrendering/transparencychoice/sgxrendercolourpickertransparencychoicematerial.h \
    SGEXTN/colourpickerrendering/transparencychoice/sgxrendercolourpickertransparencychoicequickuielement.h \
    SGEXTN/colourpickerrendering/transparencychoice/sgxrendercolourpickertransparencychoiceshader.h \
    SGEXTN/customisation/sgxthemecolourscustomisation.h \
    SGEXTN/customisation/sgxvesiclespropertiescustomisation.h \
    SGEXTN/cutevesicles/sgxrendercutevesiclesmaterial.h \
    SGEXTN/cutevesicles/sgxrendercutevesiclesquickuielement.h \
    SGEXTN/cutevesicles/sgxrendercutevesiclesshader.h \
    SGEXTN/filesystem/sgxfilebinutilities.h \
    SGEXTN/filesystem/sgxfiledownloader.h \
    SGEXTN/filesystem/sgxfilereader.h \
    SGEXTN/filesystem/sgxfilesystem.h \
    SGEXTN/filesystem/sgxfileuploader.h \
    SGEXTN/filesystem/sgxfilewriter.h \
    SGEXTN/filesystem/sgxfilezip.h \
    SGEXTN/misc/sgxcentral.h \
    SGEXTN/primitives/sgxcolourhsla.h \
    SGEXTN/primitives/sgxcolourrgba.h \
    SGEXTN/primitives/sgxidentifier.h \
    SGEXTN/primitives/sgxtimestamp.h \
    SGEXTN/primitives/sgxtouchevent.h \
    SGEXTN/primitives/sgxvector2.h \
    SGEXTN/quickui/sgxquickinterface.h \
    SGEXTN/quickui/sgxquickresizer.h \
    SGEXTN/quickui/sgxquickuiinterface.h \
    SGEXTN/quickui/sgxthemecoloursetting.h \
    SGEXTN/template/sgxcolourpicker.h \
    SGEXTN/template/sgxcutevesicles.h \
    SGEXTN/template/sgxstatusbar.h \
    SGEXTN/template/sgxthemecolourspage.h \
    SGEXTN/template/sgxvesiclepropertiespage.h \
    SGEXTN/userDefinedClasses/sgucentralmanagement.h \
    SGEXTN/widgets/sgwparent.h \
    SGEXTN/widgets/sgwroot.h \
    SGEXTN/widgets/sgwtype.h \
    SGEXTN/widgets/sgwwidget.h
