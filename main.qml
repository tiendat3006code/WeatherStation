import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import AppUtil 1.0

import "components"

ApplicationWindow {
    width: 800
    height: 480
    visible: true
    title: qsTr("Weather Station")

    background: Image {
        id: background
        source: "qrc:/image/anime-style-scene.jpg"
        fillMode: Image.PreserveAspectCrop
    }


    Rectangle{
        width: 220
        height: 30
        radius: 15
        color: Qt.rgba(0, 0, 0, 0.5)
        anchors{
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: date
            font.family: AppUtil.fontNunitoBold.name
            text: Qt.formatDateTime(new Date(), "dddd dd MMMM")
            color: "white"
            anchors.centerIn: parent
            font.pixelSize: 18
        }
    }

    Text {
        id: time
        font.family: AppUtil.fontNunitoSemiBold.name
        text: Qt.formatDateTime(new Date(), "hh:mm:ss")
        color: "white"
        font.pixelSize: 60
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 60
        }
    }

    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            date.text = Qt.formatDateTime(new Date(), "dddd dd MMMM")
            time.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
        }
    }

    WeatherItem{
        id: dayOneWeather
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: time.bottom
        }
    }

    Rectangle{
        color: "transparent"

        width: parent.width - 20
        height: 180
        radius: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            spacing: 10

            ItemWeather{
                id: dayTwoWeather
            }
            ItemWeather{
                id: dayThreeWeather
            }
            ItemWeather{
                id: dayFourWeather
            }
            ItemWeather{
                id: dayFiveWeather
            }
        }
    }

    function convertEpochToDate(epochDate) {
        var date = new Date(epochDate * 1000);
        var days = ["Chủ nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ bảy"];
        var dayName = days[date.getUTCDay()];
        return dayName;
    }

    function convertCelcius(fahrenheit){
        var celcius = (fahrenheit -32) * 5.0 / 9.0;
        return celcius.toFixed(1);
    }

    Connections{
        target: Request

        onDayOneChanged:{
            dayOneWeather.imageDayPath = Request.dayOne["Day"]["Icon"].toString()
            dayOneWeather.imageNightPath = Request.dayOne["Night"]["Icon"].toString()
            dayOneWeather.minTemp = convertCelcius(Request.dayOne["Temperature"]["Minimum"]["Value"])
            dayOneWeather.maxTemp = convertCelcius(Request.dayOne["Temperature"]["Maximum"]["Value"])
        }

        onDayTwoChanged:{
            dayTwoWeather.imageDayPath = Request.dayTwo["Day"]["Icon"].toString()
            dayTwoWeather.imageNightPath = Request.dayTwo["Night"]["Icon"].toString()
            dayTwoWeather.minTemp = convertCelcius(Request.dayTwo["Temperature"]["Minimum"]["Value"])
            dayTwoWeather.maxTemp = convertCelcius(Request.dayTwo["Temperature"]["Maximum"]["Value"])
            dayTwoWeather.dateDay = convertEpochToDate(Request.dayTwo["EpochDate"])
        }

        onDayThreeChanged:{
            dayThreeWeather.imageDayPath = Request.dayThree["Day"]["Icon"].toString()
            dayThreeWeather.imageNightPath = Request.dayThree["Night"]["Icon"].toString()
            dayThreeWeather.minTemp = convertCelcius(Request.dayThree["Temperature"]["Minimum"]["Value"])
            dayThreeWeather.maxTemp = convertCelcius(Request.dayThree["Temperature"]["Maximum"]["Value"])
            dayThreeWeather.dateDay = convertEpochToDate(Request.dayThree["EpochDate"])
        }

        onDayFourChanged:{
            dayFourWeather.imageDayPath = Request.dayFour["Day"]["Icon"].toString()
            dayFourWeather.imageNightPath = Request.dayFour["Night"]["Icon"].toString()
            dayFourWeather.minTemp = convertCelcius(Request.dayFour["Temperature"]["Minimum"]["Value"])
            dayFourWeather.maxTemp = convertCelcius(Request.dayFour["Temperature"]["Maximum"]["Value"])
            dayFourWeather.dateDay = convertEpochToDate(Request.dayFour["EpochDate"])
        }

        onDayFiveChanged:{
            dayFiveWeather.imageDayPath = Request.dayFive["Day"]["Icon"].toString()
            dayFiveWeather.imageNightPath = Request.dayFive["Night"]["Icon"].toString()
            dayFiveWeather.minTemp = convertCelcius(Request.dayFive["Temperature"]["Minimum"]["Value"])
            dayFiveWeather.maxTemp = convertCelcius(Request.dayFive["Temperature"]["Maximum"]["Value"])
            dayFiveWeather.dateDay = convertEpochToDate(Request.dayFive["EpochDate"])
        }
    }
}
