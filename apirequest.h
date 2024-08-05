#ifndef APIREQUEST_H
#define APIREQUEST_H

#include <QObject>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QUrl>
#include <QUrlQuery>
#include <QString>

class ApiRequest : public QObject
{
    Q_OBJECT
public:
    explicit ApiRequest(QObject *parent = nullptr);
    Q_PROPERTY(QJsonObject dayOne READ dayOne WRITE setDayOne NOTIFY dayOneChanged FINAL)
    Q_PROPERTY(QJsonObject dayTwo READ dayTwo WRITE setDayTwo NOTIFY dayTwoChanged FINAL)
    Q_PROPERTY(QJsonObject dayThree READ dayThree WRITE setDayThree NOTIFY dayThreeChanged FINAL)
    Q_PROPERTY(QJsonObject dayFour READ dayFour WRITE setDayFour NOTIFY dayFourChanged FINAL)
    Q_PROPERTY(QJsonObject dayFive READ dayFive WRITE setDayFive NOTIFY dayFiveChanged FINAL)

    QJsonObject dayOne() const;
    void setDayOne(const QJsonObject &newDayOne);

    QJsonObject dayTwo() const;
    void setDayTwo(const QJsonObject &newDayTwo);

    QJsonObject dayThree() const;
    void setDayThree(const QJsonObject &newDayThree);

    QJsonObject dayFour() const;
    void setDayFour(const QJsonObject &newDayFour);

    QJsonObject dayFive() const;
    void setDayFive(const QJsonObject &newDayFive);

public slots:
    void requestAPI();

private:
    QUrl m_requestURL;
    const QString m_apiKey;
    QUrlQuery m_query;
    QNetworkRequest m_request;
    QNetworkAccessManager m_manager;
    QNetworkReply* m_reply;

signals:

    void dayOneChanged();

    void dayTwoChanged();

    void dayThreeChanged();

    void dayFourChanged();

    void dayFiveChanged();

private:

    QJsonObject m_dayOne;

    QJsonObject m_dayTwo;

    QJsonObject m_dayThree;

    QJsonObject m_dayFour;

    QJsonObject m_dayFive;

private slots:
    void apiFinished();
    void apiRead();
};

#endif // APIREQUEST_H
