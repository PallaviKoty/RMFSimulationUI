import QtQuick 2.2
import QtQuick.Controls 2.5
import QtCharts 2.3
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

    RowLayout {
        id: mainLayout
        anchors.top: fileButton.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.margins: margin

        ColumnLayout {
            id: mainLeftLayout
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.margins: margin

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

            GroupBox {
                id: radioButtonBox
                Layout.topMargin: 40 //distance between 2 items. Eg: Humans and AGV item
                Layout.fillWidth: true

                background: Rectangle {
                    width: radioButtonBox.width
                    height: radioButtonBox.height
                    border.color: "#106cc8"
                    color: "white"
                }

                label: Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.top
                    anchors.bottomMargin: height
                                          / 20 //set distance between heading and slider content
                    color: "lightgray" //set this to the background color
                    border.color: "#106cc8"
                    width: parent.width
                    height: title.font.pixelSize + 10
                    Text {
                        id: title
                        text: "Task Creation"
                        anchors.centerIn: parent
                        font.pixelSize: 18
                        font.family: "SourceSansPro"
                        font.bold: true
                        color: "#106cc8"
                    }
                }

                RowLayout {
                    RadioButton {
                        checked: true
                        text: qsTr("Scheduled               ")
                    }
                    RadioButton {
                        text: qsTr("Adhoc")
                    }
                }
            }
            GroupBox {
                id: dropdown
                Layout.topMargin: 40 //distance between 2 items. Eg: Humans and AGV item
                Layout.fillWidth: true

                background: Rectangle {
                    width: dropdown.width
                    height: dropdown.height
                    border.color: "#106cc8"
                    color: "white"
                }

                label: Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.top
                    anchors.bottomMargin: height
                                          / 20 //set distance between heading and slider content
                    color: "lightgray" //set this to the background color
                    border.color: "#106cc8"
                    width: parent.width
                    height: startpoint.font.pixelSize + 10
                    Text {
                        id: startpoint
                        text: "AGV Start Point"
                        anchors.centerIn: parent
                        font.pixelSize: 18
                        font.family: "SourceSansPro"
                        font.bold: true
                        color: "#106cc8"
                    }
                }
                ColumnLayout {
                    id:dropdownColumn

                    RowLayout {
                        id: agvNumberLayout
                        anchors.topMargin: 20
                        anchors.left: parent.left
                        anchors.margins: margin
                        TextArea {
                            text: "AGV Number"
                            font.bold: true
                            color: "#106cc8"
                        }
                        ComboBox {
                            model: ["1", "2", "3"]
                        }
                    }

                    RowLayout {
                        id: agvPositionLayout
                        anchors.topMargin: 20
                        anchors.left: parent.left
                        anchors.margins: margin
                        TextArea {
                            text: "AGV Position"
                            font.bold: true
                            color: "#106cc8"
                        }
                        ComboBox {
                            model: ["1", "2", "3"]
                        }
                    }
                }
            }
        }
        ColumnLayout
        {
//            id: chartMapSection
//            ChartView {
//                title: "Line"
////                anchors.fill: parent
////                antialiasing: true

//                LineSeries {
//                    name: "LineSeries"
//                    XYPoint { x: 0; y: 0 }
//                    XYPoint { x: 1.1; y: 2.1 }
//                    XYPoint { x: 1.9; y: 3.3 }
//                    XYPoint { x: 2.1; y: 2.1 }
//                    XYPoint { x: 2.9; y: 4.9 }
//                    XYPoint { x: 3.4; y: 3.0 }
//                    XYPoint { x: 4.1; y: 3.3 }
//                }
//            }
        }
    }
}
