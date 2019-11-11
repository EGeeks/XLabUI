import QtQuick 2.11
import QtQuick.Controls 2.4


Button {
    id: button
    width: 150
    height: 86
    checked: false
    checkable: true

    contentItem: Text {
        text: parent.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: button.horizontalCenter
        anchors.verticalCenter: button.verticalCenter
        color: "#FFFFFF"
        font.pixelSize: 26
    }

    background: Rectangle {
        width: button.width
        height: button.height
        color: "#4a148c"

        opacity: {
            if(button.checkable)
                button.checked ? 0.4 : 0.2
            else
                button.down ? 0.4 : 0.2
        }
    }
}
