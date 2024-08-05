import QtQuick 2.11
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.4

Rectangle{
    id: root
    layer.enabled: shadowEnabled
    layer.effect: DropShadow{
        id: shadowEnabled
        cached: true
        radius: 8.0
        samples: 1+radius*2
        color: shadowColor
        spread: root.spread
        verticalOffset: root.verticalOffset
        horizontalOffset: root.horizontalOffset
    }

    property bool shadowEnabled: true
    property color shadowColor

    property real spread: 0.0
    property real verticalOffset: 0
    property real horizontalOffset: 0

}
