#ifndef MAIN_HPP
#define MAIN_HPP

#include <QObject>
#include <QVariant>

class MyClass : public QObject
{
Q_OBJECT
public:
    explicit MyClass(QObject *parent = 0){}

signals:

public slots:
Q_INVOKABLE void loadPreviousSlot(/*const QString &v*/);
Q_INVOKABLE void playPauseSlot(/*const QString &v*/);
Q_INVOKABLE void exitSlot(/*const QString &v*/);
Q_INVOKABLE void sliderSlot(const QString& msg, const QVariant& value);
};

#endif // MAIN_HPP
