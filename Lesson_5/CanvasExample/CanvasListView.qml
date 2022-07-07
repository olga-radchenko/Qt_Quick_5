import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Window {
    id: root
    width: 320
    height: 480
    visible: true
    title:  qsTr("Canvas Example")

     ColumnLayout {
       id: columnLayout
       anchors.fill: parent

       ComboBox {
           id: comboBox
           Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.fillHeight: false
            Layout.fillWidth: true
            model: ListModel {
                id: model
                ListElement { text: "Star.qml" }
                ListElement { text: "Ring.qml" }
                ListElement { text: "House.qml" }
                ListElement { text: "Hourglass.qml" }
            }
            onCurrentTextChanged: {
                loader.sourceComponent = Qt.createComponent(comboBox.currentText)
            }
        }

        Loader {
            id: loader
            width: 200
            height: 300
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 300
            Layout.preferredWidth: 250
            Layout.leftMargin: 1
        }
     }
}
