import QtQuick 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

ApplicationWindow {
    visible: true
    property int margin: 50
    width: mainLayout.implicitWidth + 2 * margin
    height: mainLayout.implicitHeight + 2 * margin
    minimumWidth: mainLayout.Layout.minimumWidth + 2 * margin
    minimumHeight: mainLayout.Layout.minimumHeight + 2 * margin
    title: qsTr("RMF Simulation UI")

    Button {
        id: fileButton
        text: "Menu"
        onClicked: menu.open()
        Menu {
            id: menu
            y: fileButton.height

            MenuItem {
                text: "Load Previous Scenario"
            }
            MenuItem {
                text: "Play/Pause"
            }
            MenuItem {
                text: "Stop"
            }
        }
    }

    ColumnLayout {
        id: mainLayout
        anchors.top: fileButton.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.margins: margin

//        Rectangle{
//            id: headings
//            width: mainLayout.width
//            height: mainLayout.height
//            color: "lightgray"
//            Text {
//                id: headingsText
//                text: "Humans"
//                y: 30
//                anchors.horizontalCenter: headings.horizontalCenter
//                font.pointSize: 24; font.bold: true
//            }
//        }

        LeftColumn {
            heading: "Humans"
            fromVal: 0
            toVal: 500
            stepSizeVal: 10
        }

        LeftColumn {
            heading: "AGV number"
            fromVal: 0
            toVal: 21
            stepSizeVal: 1
        }
        LeftColumn {
            heading: "AGV Max Speed"
            fromVal: 0
            toVal: 1.5
            stepSizeVal: 0.2
        }
        LeftColumn {
            heading: "Simulation Duration"
            fromVal: 0
            toVal: 72
            stepSizeVal: 0.5
        }
        LeftColumn {
            heading: "Simulation Speed"
            fromVal: 0
            toVal: 1.5
            stepSizeVal: 0.2
        }
}

}
