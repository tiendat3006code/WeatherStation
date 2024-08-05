#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "apirequest.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    ApiRequest request;
    engine.rootContext()->setContextProperty("Request", &request);
    qmlRegisterSingletonType(QUrl("qrc:/singletons/AppUtil.qml"), "AppUtil", 1, 0, "AppUtil");
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);
    // request.requestAPI();

    return app.exec();
}
