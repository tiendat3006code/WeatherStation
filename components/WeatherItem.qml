import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle{
    property string imageDayPath: "1"
    property string imageNightPath: "2"
    property string date
    property string minTemp
    property string maxTemp
    property alias wW: width / 180

    height: width
    color: "transparent"

    RowLayout{
        width: parent.width
        height: 60
        spacing: 10
        anchors{
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: dayWeather
            source: "qrc:/image/"+ imageDayPath + "-s.png"
            width: 60
            height: width
            sourceSize: Qt.size(width, width)
        }

        Image {
            id: dayNight
            source: "qrc:/image/day-and-night.png"
            width: 40
            height: width
            sourceSize: Qt.size(width, width)
        }

        Image {
            id: nightWeather
            source: "qrc:/image/"+ imageNightPath + "-s.png"
            width: 60
            height: width
            sourceSize: Qt.size(width, width)
        }
    }
}
