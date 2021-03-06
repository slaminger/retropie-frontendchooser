import QtQuick 2.0


Item {
    property bool selected
    property bool autostarting
    property alias itemName: name.text
    property alias itemDesc: desc.text
    property alias itemLogo: logo.source

    Rectangle {
        property int borderWidth: autostarting ? vpx(4) : 0

        width: parent.width - vpx(10)
        height: parent.height - vpx(10)
        anchors.centerIn: parent
        color: selected ? "#569" : autostarting ? "#383848" : "#556"
        border.color: autostarting ? "#e90" : "#112"
        border.width: borderWidth

        Behavior on borderWidth {
            NumberAnimation { duration: 300 }
        }


        Image {
            id: logo
            asynchronous: true
            smooth: true
            height: parent.height - vpx(30)
            width: parent.width * 0.3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: vpx(15)
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: name
            anchors.left: logo.right; anchors.leftMargin: vpx(20)
            anchors.top: parent.top; anchors.topMargin: vpx(20)
            color: "#dde"
            font {
                bold: true
                pixelSize: vpx(20)
            }
        }

        Text {
            id: desc
            anchors {
                left: logo.right; leftMargin: vpx(20)
                top: name.bottom; topMargin: vpx(10)
                bottom: parent.bottom; bottomMargin: vpx(20)
                right: parent.right; rightMargin: vpx(15)
            }
            color: "#dde"
            font {
                pixelSize: vpx(16)
            }
            wrapMode: Text.WordWrap
        }
    }
}
