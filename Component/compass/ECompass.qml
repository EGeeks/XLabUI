import QtQuick 2.13

Rectangle {
    id:root
    width: 200
    height: 200
    anchors.centerIn: parent
    color: "transparent"

    property int m_Angle: 0

    Rectangle {
        width: parent.width
        height: parent.height
        color: "transparent"
        rotation: root.m_Angle

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");

                //绘制圆圈
                ctx.lineWidth = 2;
                ctx.strokeStyle = "#FFFFFF";
                ctx.globalAlpha = 1.0;
                ctx.beginPath();
                ctx.arc(width / 2, width / 2, width / 2 - 2, 0, 2 * Math.PI);
                ctx.stroke();
                ctx.restore();

                for(var i = 0;i < 36;i++) {
                    ctx.save();
                    ctx.translate(width / 2, height / 2);
                    ctx.rotate(i * 10 * Math.PI/180);
                    ctx.beginPath();

                    if(i % 9 ==0) {
                        ctx.moveTo(0, -width / 2+12);
                        ctx.lineTo(0, -width / 2+2);
                    } else {
                        ctx.moveTo(0,-width/2+10);
                        ctx.lineTo(0,-width/2+2);
                    }

                    ctx.stroke();
                    ctx.restore();
                }
            }
        }

        Rectangle {
            width: 20
            height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 12
            rotation: -parent.rotation
            color: "#00000000"

            Text {
                anchors.centerIn: parent
                font.family: "微软雅黑"
                font.pixelSize: 14
                color: "#FF0000"
                text: qsTr("N")
            }
        }

        Rectangle {
            width: 20
            height: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 12
            color: "#00000000"
            rotation: -parent.rotation

            Text {
                anchors.centerIn: parent
                font.family: "微软雅黑"
                font.pixelSize: 14
                color: "#FFFFFF"
                text: qsTr("E")
            }
        }

        Rectangle {
            width: 20
            height: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 12
            color: "#00000000"
            rotation: -parent.rotation

            Text {
                anchors.centerIn: parent
                font.family: "微软雅黑"
                font.pixelSize: 14
                color: "#FFFFFF"
                text: qsTr("W")
            }
        }

        Rectangle
        {
            width: 20
            height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 12
            color: "#00000000"
            rotation: -parent.rotation

            Text {
                anchors.centerIn: parent
                font.family: "微软雅黑"
                font.pixelSize: 14
                color: "#FFFFFF"
                text: qsTr("S")
            }
        }

        Rectangle {
            width: 50
            height: 50
            color: "transparent"
            rotation: -parent.rotation
            anchors.centerIn: parent
        }
    }
}
