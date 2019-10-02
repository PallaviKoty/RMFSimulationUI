import QtQuick 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

GroupBox {
    id: controlBox
    Layout.topMargin: 40                    //distance between 2 items. Eg: Humans and AGV item
    Layout.fillWidth: true
    property var fromVal: 0
    property var toVal: 70
    property var heading: "Heading"
    property var stepSizeVal: 1

    background: Rectangle {
        width: controlBox.width
        height: controlBox.height
        border.color: "#106cc8"
        color: "white"
    }

    label: Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.top
        anchors.bottomMargin: height/20     //set distance between heading and slider content
        color: "lightgray"                  //set this to the background color
        border.color: "#106cc8"
        width: parent.width
        height: title.font.pixelSize + 10
        Text {
            id: title
            text: heading
            anchors.centerIn: parent
            font.pixelSize: 18
            font.family: "SourceSansPro"
            font.bold: true
            color: "#106cc8"
        }
    }

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        TextField {
            placeholderText: slider.value
            Layout.fillWidth: true
        }
        Slider {
            id: slider
            objectName: heading
            signal sliderValue(string msg, var value)
            onValueChanged: sliderValue(title.text, slider.value)
            width: 200
            from: controlBox.fromVal
            to: controlBox.toVal
            value: 0
            stepSize: controlBox.stepSizeVal
        }
    }
}
