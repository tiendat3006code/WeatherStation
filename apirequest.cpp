#include "apirequest.h"

ApiRequest::ApiRequest(QObject *parent)
    : QObject{parent}, m_requestURL("http://dataservice.accuweather.com/forecasts/v1/daily/5day/353412?apikey=1aM0jMtV6150kFG2ogodO1vNnfbN7Gr4"), m_apiKey("1aM0jMtV6150kFG2ogodO1vNnfbN7Gr4")
{
    m_query.addQueryItem("apikey", m_apiKey);
    m_requestURL.setQuery(m_query);
    m_request.setUrl(m_requestURL);
    m_request.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("application/json"));
}

void ApiRequest::requestAPI(){
    qInfo()<<"STARTING REQUEST API";
    m_reply = m_manager.get(m_request);
    connect(m_reply, &QNetworkReply::readyRead, this, &ApiRequest::apiRead);
    connect(m_reply, &QNetworkReply::finished, this, &ApiRequest::apiFinished);
    qInfo()<<"REQUEST FINISHED";
}

void ApiRequest::apiFinished(){
    if(m_reply->error()){
        qInfo()<<"Request error: "<<m_reply->errorString();
    }
    else if(m_reply->error() == QNetworkReply::NoError){
        qInfo()<<"Request API success";
    }
    if(m_reply){
        qInfo()<<"Delete network reply";
        m_reply->deleteLater();
        m_reply = nullptr;
    }
}

void ApiRequest::apiRead(){
    QByteArray dataFromAPI = m_reply->readAll();
    qInfo()<<"Data reply from server: "<<dataFromAPI;
    QJsonDocument responseDoc = QJsonDocument::fromJson(dataFromAPI);
    QJsonObject responseObj = responseDoc.object();
    QJsonArray responseArray = responseObj["DailyForecasts"].toArray();
    setDayOne(responseArray.at(0).toObject());
    setDayTwo(responseArray.at(1).toObject());
    setDayThree(responseArray.at(2).toObject());
    setDayFour(responseArray.at(3).toObject());
    setDayFive(responseArray.at(4).toObject());
}

QJsonObject ApiRequest::dayOne() const
{
    return m_dayOne;
}

void ApiRequest::setDayOne(const QJsonObject &newDayOne)
{
    if (m_dayOne == newDayOne)
        return;
    m_dayOne = newDayOne;
    emit dayOneChanged();
}

QJsonObject ApiRequest::dayTwo() const
{
    return m_dayTwo;
}

void ApiRequest::setDayTwo(const QJsonObject &newDayTwo)
{
    if (m_dayTwo == newDayTwo)
        return;
    m_dayTwo = newDayTwo;
    emit dayTwoChanged();
}

QJsonObject ApiRequest::dayThree() const
{
    return m_dayThree;
}

void ApiRequest::setDayThree(const QJsonObject &newDayThree)
{
    if (m_dayThree == newDayThree)
        return;
    m_dayThree = newDayThree;
    emit dayThreeChanged();
}

QJsonObject ApiRequest::dayFour() const
{
    return m_dayFour;
}

void ApiRequest::setDayFour(const QJsonObject &newDayFour)
{
    if (m_dayFour == newDayFour)
        return;
    m_dayFour = newDayFour;
    emit dayFourChanged();
}

QJsonObject ApiRequest::dayFive() const
{
    return m_dayFive;
}

void ApiRequest::setDayFive(const QJsonObject &newDayFive)
{
    if (m_dayFive == newDayFive)
        return;
    m_dayFive = newDayFive;
    emit dayFiveChanged();
}
