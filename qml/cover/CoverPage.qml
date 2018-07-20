import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {

    Label {
        id: label
        anchors.centerIn: parent
        font.pixelSize: Theme.fontSizeExtraLarge
        color: "White"
        text: qsTr("Image\nPicker")
    }
}
