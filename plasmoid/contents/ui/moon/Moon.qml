import QtQuick 2.7
import QtQuick.Layouts 1.1
import Qt.labs.platform 1.0 as Platform

Item {
    id: moon
    opacity: 0.01
    x: 110 * scaleFactor
    y: 270 * scaleFactor
    Item {
        id: moonVisual
        anchors.centerIn: parent
        scale: 1.0

        Image {
            id: moonImage
            width: 40 * scaleFactor
            height: 40 * scaleFactor
            x: 1
            y: 2
            z: 2
            opacity: 1
            source: "../moon/" + sanitizePhaseName(moonComponent.moonPhase) + ".png"

            MouseArea {
                id: mouseMoon
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    // Cambia el estado de moonData para activar la transición de escala
                    moonData.state = moonData.state === "clicked" ? "" : "clicked";
                }
            }
            Rectangle {
                width: ((moonLabelIlu.width + 20) * scaleFactor) * 0.3
                height: ((moonLabelIlu.height + 16) * scaleFactor) * 0.3
                color: "lightgray"  // Color del fondo del rectángulo
                radius: 2
                x: moonLabelIlu.x - 3 * scaleFactor
                y: moonLabelIlu.y + 36 * scaleFactor
            }
        } // Image
    } // Item

//---------------
        // Content text
Item {
    scale: 0.3
        Column {
            id: moonTexts
            x: 1 * scaleFactor
            y: 126 * scaleFactor
            z: 3

            opacity: moonData.state === "clicked" ? 1 : 0

            Behavior on opacity {
                NumberAnimation {
                    duration: 500
                    easing.type: Easing.InOutQuad
                }
            }

            Text {
                id: moonLabelIlu
                color: "black"  // Color del texto
                font.pixelSize: 12 * scaleFactor // Tamaño de la fuente
                text: {
                    var moonphaseText = "";
                    if (moonComponent.moonPhase !== undefined && moonComponent.moonPhase !== "") {
                        moonphaseText += i18n(moonComponent.moonPhase);
                    }
                    return moonphaseText + "; " + i18n(" Lightning: ") + moonComponent.percentIlu + "%";
                }
            }


            Text {
                id: moonDaysPhase
                color: "black"
                font.pixelSize: 12 * scaleFactor
                text: {
                    var phaseText = moonComponent.daysPhase + i18n(" days for ");
                    if (moonComponent.nextPhase !== undefined && moonComponent.nextPhase !== "") {
                        phaseText += i18n(moonComponent.nextPhase);
                    }
                    return phaseText;
                }
            }
        } // Column
} //Item ---

    // Contenedor para los datos de la luna
    Item {
        id: moonData
        // Define los estados y transiciones para la animación de escala
        states: [
			State {
                name: "clicked"
                PropertyChanges {
                    target: moon
                    scale: 3
                    opacity: 1
                    x: -120 * parentContainer.scaleFactor
                    y: 40 * parentContainer.scaleFactor
                }
            }
        ]

        transitions: [
            Transition {
                from: "clicked"; to: "*"
                NumberAnimation { properties: "scale, opacity"; duration: 2000 }
                NumberAnimation { properties: "x, y "; duration: 700 }
            },
            Transition {
                from: "*"; to: "clicked"
                NumberAnimation { properties: "scale, opacity"; duration: 700 }
                NumberAnimation { properties: "x, y "; duration: 2000 }
            }
        ]
    } // Item

//-------------------------

    Timer {
        id: refreshTimer
        interval: 900000 // Intervalo de actualización en milisegundos (1 minuto = 60000)
        repeat: true
        running: true // Comienza a correr automáticamente
        onTriggered: {
            moonComponent.refresh()
        }
    }

//-------------------------

    // Replace " " by "_"
    function sanitizePhaseName(phaseName) {
        return phaseName.replace(/\s/g, "_");
    }

}

