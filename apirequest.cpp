#include "apirequest.h"

ApiRequest::ApiRequest(QObject *parent)
    : QObject{parent}, m_requestURL("http://dataservice.accuweather.com/forecasts/v1/daily/5day/353412?apikey=1aM0jMtV6150kFG2ogodO1vNnfbN7Gr4"), m_apiKey("1aM0jMtV6150kFG2ogodO1vNnfbN7Gr4")
{
    m_query.addQueryItem("apikey", m_apiKey);
    m_requestURL.setQuery(m_query);
    m_request.setUrl(m_requestURL);
    m_request.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("application/json"));
}

QJsonObject ApiRequest::JsonData() const
{
    return m_JsonData;
}

void ApiRequest::setJsonData(const QJsonObject &newJsonData)
{
    if (m_JsonData == newJsonData)
        return;
    m_JsonData = newJsonData;
    emit JsonDataChanged();
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
    QJsonObject dayOne = responseArray.at(0).toObject();
    qInfo()<<"Date: "<<dayOne["Date"].toString();
}
