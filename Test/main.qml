import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.VirtualKeyboard 2.4

ApplicationWindow {
    id: window
    visible: true
    width: 1280
    height: 800
    title: qsTr("Scroll")

    Image {
        anchors.fill: parent
        source: "image/bg.jpg"
    }

    Flickable {
          id: left_flickable
          width: 150
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 0
          anchors.top: parent.top
          anchors.left: parent.left
          flickableDirection: Flickable.VerticalFlick
          contentWidth: child_column.width
          contentHeight: child_column.height
          clip: true

          ButtonGroup {
              id: button_set_group
              buttons: child_column.children
          }

          Column {
              id: child_column
              OptionButton {
                  checkable: true
                  checked: true
                  text: "常用图标"

                  onCheckedChanged: {
                      if(checked){
                          //changeStackView("OsdSetting.qml", PageNoTypeQML.Setting_PageNo_OSD);
                      }
                  }
              }

              OptionButton {
                  checkable: true
                  text: "仪表控件"

                  onCheckedChanged: {
                      if(checked){
                          //changeStackView("CustomKeys.qml", PageNoTypeQML.Setting_PageNo_CustomKeys);
                      }
                  }
              }

              OptionButton {
                  checkable: true
                  text: "图表"

                  onCheckedChanged: {
                      if(checked){
                          //changeStackView("ColorSetting.qml", PageNoTypeQML.Setting_PageNo_Color);
                      }
                  }
              }

              OptionButton {
                  checkable: true
                  text: "电子罗盘"

                  onCheckedChanged: {
                      if(checked){
                          //changeStackView("ColorSetting.qml", PageNoTypeQML.Setting_PageNo_Color);
                      }
                  }
              }
          }
      }

      StackView {
          id : child_stackview
          anchors.left: left_flickable.right
          anchors.right: parent.right
          anchors.top: parent.top
          anchors.bottom: parent.bottom
          //initialItem: "OsdSetting.qml"
          clip: true
      }


    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
