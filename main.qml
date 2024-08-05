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
    color: "#66FFFF"

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
        width: 180

        anchors{
            horizontalCenter: parent.horizontalCenter
            top: time.bottom
            topMargin: 20
        }
    }
}
