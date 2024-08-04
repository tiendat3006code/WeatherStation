pragma Singleton

import QtQuick 2.15
import QtQuick.Controls 2.15

QtObject{
    property QtObject fontNunito: FontLoader{
        source: "qrc:/font/Nunito/Nunito-Medium.ttf"
    }
    property QtObject fontNunitoBold: FontLoader{
        source: "qrc:/font/Nunito/Nunito-ExtraBold.ttf"
    }
    property QtObject fontNunitoSemiBold: FontLoader{
        source: "qrc:/font/Nunito/Nunito-SemiBold.ttf"
    }
}
