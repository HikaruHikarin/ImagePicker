import QtQuick 2.0
import Sailfish.Silica 1.0



Page {
    id: page
    property string imageSource

    // Allow all orientations
    allowedOrientations: Orientation.All

    PageHeader {
        id: header
        title: "IMAGE"
    }

    // Frame with selected image
    Image {
        id: imageFrame
        anchors.fill: parent
        anchors.topMargin: header.height
        fillMode: Image.PreserveAspectFit
        source: imageSource

        // Comment the following 4 lines and uncomment the lines below to scale without state saving
        transform: Scale { id: imgScale; xScale: mouseArea.scaleFactor;
                            yScale: mouseArea.scaleFactor;
                            origin.x: mouseArea.initPositionX;
                            origin.y: mouseArea.initPositionY}

//        transform: Scale { id: imgScale}
//        states: State {
//                    name: "active"; when: mouseArea.pressed
//                    PropertyChanges { target: imgScale;
//                        xScale: mouseArea.scaleFactor;
//                        yScale: mouseArea.scaleFactor;
//                        origin.x: mouseArea.initPositionX;
//                        origin.y: mouseArea.initPositionY}
//                }





    // Processes mouse actions, counts scale factor
    MouseArea {
        id: mouseArea
        property bool isScaling: false
        property real initPositionY
        property real initPositionX
        property real currentPosition
        property real scaleFactor: 1
        anchors.fill: parent

        // Remember initial position of mouse
        onPressed: {
            isScaling = true
            initPositionX = mouse.x
            initPositionY = mouse.y
            currentPosition = mouse.y
        }

        // Go back to initial scale
        onReleased: {
            isScaling = false
        }

        // If mouse goes up, scale up, else scale down
        onPositionChanged: {
            if (isScaling) {

                var dPosition = mouse.y - currentPosition
                if(dPosition < 0.0 && scaleFactor < 10) scaleFactor+= 0.1
                else if(scaleFactor > 0.5) scaleFactor-=0.1
                currentPosition = mouse.y
            }
        }

        onCanceled: {
            isScaling = false
        }
    }

    }

}
