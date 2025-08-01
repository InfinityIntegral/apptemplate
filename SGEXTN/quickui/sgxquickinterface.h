#ifndef SGXQUICKINTERFACE_H
#define SGXQUICKINTERFACE_H

#include <QObject>
#include <QQmlComponent>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <qtmetamacros.h>
#include "sgxquickresizer.h"
#include "sgxthemecoloursetting.h"

class SGXQuickInterface : public QObject
{
    Q_OBJECT
public:
    SGXQuickInterface() = delete;
    static QQmlApplicationEngine* e;
    static void createTemplates();
    static void buildBase();
    static QQmlComponent* root;
    static QQuickWindow* applicationWindow;
    static QQuickItem* rootWindow;
    static void deleteTemplates();
    static void deleteSingletons();
    static SGXQuickResizer* resizerSingleton;
    static SGXThemeColourSetting* themeColoursSingleton;
    static QQmlComponent* parentWidget;
};

#endif // SGXQUICKINTERFACE_H
