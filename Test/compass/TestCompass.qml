import QtQuick 2.13
import "../../Component/compass"

Item {
    id: element
    width: 1130
    height: 800

    ECompass {
        anchors.verticalCenterOffset: -87
        anchors.horizontalCenterOffset: 5
    }
}
