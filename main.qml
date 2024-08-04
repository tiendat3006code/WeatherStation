import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import AppUtil 1.0

ApplicationWindow {
    width: 800
    height: 480
    visible: true
    title: qsTr("Weather Station")
    color: "#66FFFF"

    Rectangle{
        width: 280
        height: 30
        radius: 15
        color: Qt.rgba(0, 0, 0, 0.5)
        anchors{
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: timeDate
            font.family: AppUtil.fontNunitoBold.name
            text: Date().toLocaleString()
            color: "white"
            anchors.centerIn: parent
        }

        Timer{
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                timeDate.text = Date().toLocaleString()
            }
        }
    }


}
