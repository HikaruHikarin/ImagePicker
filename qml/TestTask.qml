import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Pickers 1.0

ApplicationWindow
{
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations

    initialPage: Component {
        Page {
            id: page
            property string path

            PageHeader {
                id: header
                title: qsTr("Image Picker")
                description: "Click the button to start"
            }

            Button {
                x: Theme.horizontalPageMargin
                anchors.centerIn: parent
                text: ("Click me!")
                color: Theme.secondaryHighlightColor


                onClicked: {
                    pageStack.push(imagePickerPage)
                }
            }

            // Opens image picker and gets a path to selected image
            Component {
                id: imagePickerPage
                ImagePickerPage {
                    onSelectedContentPropertiesChanged: {
                        path = selectedContentProperties.filePath
                    }
                }
            }

            // Opens new page and passes there the path to selected image
            onPathChanged: {
                pageStack.completeAnimation()
                pageStack.push(Qt.resolvedUrl("pages/ImagePage.qml"),
                               {"imageSource": path})
            }

        }
    }

}
