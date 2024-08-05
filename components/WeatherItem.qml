import QtQuick 2.15
import QtQuick.Controls 2.15
import AppUtil 1.0

ShadowedRectangle {
    property string imageDayPath: ""
    property string imageNightPath: ""
    property string minTemp: "--"
    property string maxTemp: "--"
    property int imageSize: 120

    shadowEnabled: false
    shadowColor: "#CCFFFF"

    width: imageSize*2 + imageSize/2 + weatherIcon.spacing*2
    height: imageSize + celcius.height
    color: "transparent"

    Rectangle{
        id: celcius
        width: parent.width
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        radius: height / 2
        color: Qt.rgba(0,0,0,0.5)

        Text {
            text: maxTemp + qsTr("°C")
            color: "orange"
            font.pixelSize: 25
            font.family: AppUtil.fontNunito.name
            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 20
            }
        }

        Image {
            id: name
            source: "qrc:/image/season.png"
            sourceSize: Qt.size(45,45)
            anchors.centerIn: parent
        }

        Text {
            text: minTemp + qsTr("°C")
            color: "#00FFFF"
            font.pixelSize: 25
            font.family: AppUtil.fontNunito.name
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 20
            }
        }
    }

    Row{
        id: weatherIcon
        width: childrenRect.width
        height: imageSize
        anchors{
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
        }
        spacing: 5

        Image {
            source: "qrc:/image/" + imageDayPath + "-s.png"
            width: imageSize
            height: imageSize
        }

        Image {
            source: "qrc:/image/day-and-night.png"
            sourceSize: Qt.size(imageSize / 1.8, imageSize / 1.8)
            anchors.verticalCenter: parent.verticalCenter
        }

        Image {
            source: "qrc:/image/" + imageNightPath + "-s.png"
            width: imageSize
            height: imageSize
        }
    }
}
