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
#include <QString>

class ApiRequest : public QObject
{
    Q_OBJECT
public:
    explicit ApiRequest(QObject *parent = nullptr);
    Q_PROPERTY(QJsonObject JsonData READ JsonData WRITE setJsonData NOTIFY JsonDataChanged FINAL)

    QJsonObject JsonData() const;
    void setJsonData(const QJsonObject &newJsonData);
    void requestAPI();

private:
    const QUrl m_requestURL;
    const QString m_apiKey;
    QJsonObject m_JsonData;
    QNetworkRequest m_request;
    QNetworkAccessManager m_manager;
    QNetworkReply* m_reply;

signals:
    void JsonDataChanged();

private:


private slots:
    void apiFinished();
    void apiRead();
};

#endif // APIREQUEST_H
