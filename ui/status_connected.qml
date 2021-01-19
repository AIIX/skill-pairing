import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0

Mycroft.Delegate {
    id: root
    leftPadding: 0
    rightPadding: 0
    topPadding: 0
    bottomPadding: 0
    
    Timer {
        interval: 6000
        running: true
        repeat: false
        onTriggered: {
            triggerGuiEvent("mycroft.pairing.completed.connected", {})
        }
    }
    
    Rectangle {
        id: statusBG
        anchors.fill: parent
        color: "#40DBB0"
        
        ColumnLayout {
            id: grid
            anchors.fill: parent
            anchors.margins: Kirigami.Units.largeSpacing

            Image {
                id: statusIcon
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter
                fillMode: Image.PreserveAspectFit
                source: Qt.resolvedUrl("icons/check-circle.svg")
            }

            Label {
                id: statusLabel
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: parent.height * 0.095
                wrapMode: Text.WordWrap
                renderType: Text.NativeRendering
                font.family: "Noto Sans Display"
                font.styleName: "Black"
                color: "white"
                text: "Connected"
            }
        }
    }
}
