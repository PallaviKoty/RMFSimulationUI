#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQuickView>
#include "main.hpp"


void MyClass::loadPreviousSlot() {
       qInfo() << "Called loadPreviousSlot";
    }

void MyClass::playPauseSlot() {
       qInfo() << "Called playPauseSlot";
    }

void MyClass::exitSlot() {
       qInfo() << "Called exitSlot";
       exit(0);
    }

void MyClass::sliderSlot(const QString &msg, const QVariant &value) {
       qInfo() << "Called sliderSlot: " << value.toInt() << "Heading: " << msg;
    }

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    MyClass myClass;

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    // Load Previous Scenario Button
    QObject* load_previous = engine.rootObjects().first()->findChild<QObject*>("LoadPreviousScenario");
    qDebug() << "load_previous: " << load_previous;
    QObject::connect(load_previous, SIGNAL(loadPreviousScenario()), &myClass, SLOT(loadPreviousSlot()));

    //Play/Pause Button
    QObject* play_pause = engine.rootObjects().first()->findChild<QObject*>("PlayPause");
    qDebug() << "play_pause:  " << play_pause->objectName();
    QObject::connect(play_pause, SIGNAL(playPaused()), &myClass, SLOT(playPauseSlot()));

    //Exit Button
    QObject* exit = engine.rootObjects().first()->findChild<QObject*>("exit");
    qDebug() << "exit:  " << exit->objectName();
    QObject::connect(exit, SIGNAL(exitSignal()), &myClass, SLOT(exitSlot()));

    //Humans Slider
    QObject* slider_humans = engine.rootObjects().first()->findChild<QObject*>("Humans");
    qDebug() << "sliderObject: " << slider_humans;
    QObject::connect(slider_humans, SIGNAL(sliderValue(QString, QVariant)), &myClass, SLOT(sliderSlot(QString, QVariant)));

    //AGV Number Slider
    QObject* slider_object = engine.rootObjects().first()->findChild<QObject*>("AGV number");
    qDebug() << "sliderObject: " << slider_object;
    QObject::connect(slider_object, SIGNAL(sliderValue(QString, QVariant)), &myClass, SLOT(sliderSlot(QString, QVariant)));


    return app.exec();
}
