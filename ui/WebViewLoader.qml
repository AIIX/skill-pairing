/*
 * Copyright 2018 Marco Martin <mart@kde.org>
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

import QtQuick 2.4
import QtQuick.Controls 2.2
import QtWebEngine 1.8
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

Item {
    id: root
    
    WebEngineView {
        id: webview
        url: "https://home.mycroft.ai"
        anchors.fill: parent
        settings.autoLoadImages: true
        settings.javascriptEnabled: true
        settings.errorPageEnabled: true
        settings.pluginsEnabled: true
        settings.allowWindowActivationFromJavaScript: true
        settings.javascriptCanOpenWindows: true
        settings.fullScreenSupportEnabled: true
        settings.autoLoadIconsForPage: true
        settings.touchIconsEnabled: true
        settings.webRTCPublicInterfacesOnly: true
        
        onNewViewRequested: function(request) {
            if (!request.userInitiated) {
                console.log("Warning: Blocked a popup window.");
            } else if (request.destination === WebEngineView.NewViewInDialog) {
                popuproot.open()
                request.openIn(popupwebview);
            } else {
                request.openIn(webview);
            }
        }
        
        onJavaScriptDialogRequested: function(request) {
            request.accepted = true;
        }
    }
    
    Popup {
        id: popuproot
        modal: true
        focus: true
        width: root.width - Kirigami.Units.largeSpacing
        height: root.height - Kirigami.Units.largeSpacing
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        anchors.centerIn: parent
        
        WebEngineView {
            id: popupwebview
            anchors.fill: parent
            url: "about:blank"
            settings.autoLoadImages: true
            settings.javascriptEnabled: true
            settings.errorPageEnabled: true
            settings.pluginsEnabled: true
            settings.allowWindowActivationFromJavaScript: true
            settings.javascriptCanOpenWindows: true
            settings.fullScreenSupportEnabled: true
            settings.autoLoadIconsForPage: true
            settings.touchIconsEnabled: true
            settings.webRTCPublicInterfacesOnly: true
            property string urlalias: popupwebview.url
            
            onNewViewRequested: function(request) {
                console.log(request.destination)
            }
            
            onLoadingChanged: {
                if(urlalias.indexOf("https://home.mycroft.ai/?data=") != -1) {
                    popuproot.close()
                }
            }
        }
    }
}
