/*
 * Copyright 2018 by Aditya Mehra <aix.m@outlook.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft

Mycroft.Delegate {
    id: root
    leftPadding: 0
    rightPadding: 0
    bottomPadding: 0
    topPadding: 0
    
    Timer {
        interval: 8000
        running: true
        repeat: false
        onTriggered: {
            pairBtn.visible = true
        }
    }
    
    Rectangle {
        color: "#22a7f0"
        width: parent.width
        height: parent.height
        
        Item {
            anchors.fill: parent
            anchors.margins: Kirigami.Units.largeSpacing
            
            Item {
                id: ist1
                anchors.left: parent.left
                anchors.right: parent.right
                height: instruction.paintedHeight
                anchors.top: parent.top
                
                Text {
                    id: instruction
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                    font.family: "Noto Sans"
                    font.bold: true
                    font.weight: Font.Bold
                    fontSizeMode: Text.HorizontalFit
                    minimumPixelSize: 55
                    font.pixelSize: Math.max(root.height * 0.25, minimumPixelSize)
                    color: "white"
                    text: "Create a Mycroft account"
                }
            }
            
            Item {
                id: ist2
                anchors.left: parent.left
                anchors.right: parent.right
                height: instruction2.paintedHeight
                anchors.top: ist1.bottom
                anchors.topMargin: Kirigami.Units.smallSpacing

                Text {
                    id: instruction2
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                    width: parent.width
                    elide: Text.ElideRight
                    font.family: "Noto Sans"
                    font.bold: true
                    font.weight: Font.Bold
                    fontSizeMode: Text.HorizontalFit
                    font.pixelSize: root.height * 0.10
                    color: "#032437"
                    text: "account.mycroft.ai"
                }
            }
            
            Item {
                anchors.top: ist2.bottom
                anchors.topMargin: Kirigami.Units.largeSpacing
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                
                Button {
                    id: pairBtn
                    visible: false
                    anchors.centerIn: parent
                    width: Kirigami.Units.gridUnit * 8
                    height: Kirigami.Units.gridUnit * 3
                    
                    background: Rectangle {
                        color: pairBtn.down ? "#021824" : "#032437"
                        radius: 5
                    }
                    
                    contentItem: Label {
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: "white"
                        text: "PAIR THIS DEVICE"
                    }
                    
                    onClicked: {
                        triggerGuiEvent("mycroft.pairing.kickoff", {})
                    }
                }
            }
        }
    }
}
