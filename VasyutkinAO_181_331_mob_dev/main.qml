﻿import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtMultimedia 5.14 //для камеры
import QtQuick 2.0
import QtQuick 2.14
import QtMultimedia 5.4
import QtGraphicalEffects 1.14
import QtQuick.Window 2.12

ApplicationWindow {
    id:mainWindow   //если к объекту не планиуется обращаться, то id можно не задавать, название должно начинаться с маленькой буквы
    visible: true
    width: 375
    height: 667
    title: qsTr("MainWindow")   //qsTr - функция для перключения языка строки
    Material.background: "white"
    font.capitalization: Font.MixedCase
    Material.accent: "#007DFA"



    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        /*Page {
            Button {
                id: button1
                text: "Button"
                font.family: ""
                font.bold: true
                font.pixelSize: 30
                font.italic: true

            }

            Button {   //страница демонстрации anchor
                text: "Button"
                anchors.right: parent.right
                anchors.left: button1.right
                anchors.margins: 10
                anchors.top: button1.bottom
                font.pixelSize: 30
            }

            Button {
                text: "Button"
                width: 100
                height: 100
                anchors.centerIn: parent
                font.pixelSize: 30
            }

        }

        Page {   //страница демонстрации layout

            GridLayout {
            anchors.fill: parent   //привязываем по всем фронтам
            columns: 3

            Button {
                id: button2
                text: "Button"
                font.family: ""
                font.bold: true
                font.pixelSize: 30
                font.italic: true

            }

            Button {
                text: "Button"
                anchors.right: parent.right
                anchors.left: button1.right
                anchors.margins: 10
                anchors.top: button1.bottom
                font.pixelSize: 30
            }

            Button {
                text: "Button"
                width: 100
                height: 100
                font.pixelSize: 30
                Layout.row: 2   //напрямую объявляем для кнопки строку
                Layout.column: 2   //напрямую объявляем для кнопки столбец
                Layout.preferredHeight: 200   //настраиваем предпочтительную высоту
                Layout.preferredWidth: 200   //настраиваем предпочтительную ширину
            }

            }
            //anchors запрещены
        }*/
        Page{
            id: page01
            scale: 1
            header: ToolBar {
                id: toolbar
                anchors.leftMargin: 10
                anchors.left: parent.left;
                layer.enabled: true
                Material.background: "white"
                Text {
                    font.family: "SF UI Display Bold"
                    text: "Элементы GUI"
                    font.pointSize: 23
                    color: "black"
                    anchors.bottom: parent.bottom


                }
            }
            /*Button {
                id: button1
                text: "Привет"
                font.family: "SF UI Display Regular"
                font.pixelSize: 15

            }*/

            BusyIndicator {
                id: busyindicator
                scale: 0.5
                anchors.leftMargin: 10
                anchors.topMargin: 20
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                layer.enabled: true
                running: image.status === Image.Loading
                Material.accent: "#f9cf47"
            }

            Image{
                id: logoyandex
                source: "/image/1200px-Яндекс.svg.png"
                width: 105
                height: 58
                anchors.leftMargin: 10
                anchors.top: busyindicator.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle{
                anchors.leftMargin: 10
                anchors.topMargin: 10
                anchors.top: logoyandex.bottom
                anchors.left: parent.left
                anchors.horizontalCenter: parent.horizontalCenter
                border.width: {
                    if(textarea.activeFocus)
                        0
                    else
                        2
                }

                border.color: "#f9cf47"
                width: 100
                height: 36
                radius: 1

                TextArea {
                    id: textarea
                    color: "#000"
                    wrapMode: Text.WrapAnywhere
                    placeholderText: qsTr("Найдется всё!")
                    placeholderTextColor: "#99999b"
                    font.family: "SF UI Text Regular"
                    font.pointSize: 12
                    Material.accent: "#f9cf47"
                    anchors.leftMargin: 10
                    anchors.left: parent.left
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Dial {
                id: dial
                to: 100
                anchors.leftMargin: 10
                anchors.topMargin: 50
                anchors.top: slider.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.centerIn: parent
                value: slider.value
                Material.accent: "#f9cf47"
            }

            Slider {
                id:slider
                value: dial.value
                from: 1
                to: 100
                anchors.top: dial.bottom
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.left: parent.left
                Material.accent: "#f9cf47"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ColumnLayout {
                anchors.leftMargin: 10
                anchors.topMargin: 50
                anchors.top: slider.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                Material.accent: "#ff0000"

                Switch {
                    text: qsTr("Включить VPN")
                    Material.foreground: "#000"
                    font.family: "SF UI Text Regular"
                }
            }

            Text {
                text: "© Moscow Polytech"
                font.family: "SF UI Text Regular"
                font.pointSize: 10
                color: "#000"
                anchors.leftMargin: 10
                anchors.bottomMargin: 20
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Page{
            id: page02
            scale: 1
            header: ToolBar {
                anchors.leftMargin: 10
                anchors.left: parent.left;
                layer.enabled: true
                Material.background: "black"
                Text {
                    font.family: "SF UI Display Bold"
                    text: "Камера. Фото и видео"
                    font.pointSize: 23
                    color: "white"
                    anchors.bottom: parent.bottom
                }
            }

            Material.background: "black"

            RowLayout{
                id: rowforradio
                RadioButton{

                    id: radio1
                    text: "Видео"
                    checked: true
                    onClicked: {
                        page1.visible = true
                        page2.visible = false

                    }
                }

                RadioButton{
                    id: radio2
                    text: "камера"
                    onClicked: {
                        page1.visible = false
                        page2.visible = true

                    }
                }
            }

            Item {
                id: page1
                width: 375
                height: 470

                Camera {
                    id: camera
                    videoRecorder.mediaContainer: "mp4"
                    imageCapture {
                        onImageCaptured: {
                            photoPreview.source = preview

                        }
                    }
                }


                VideoOutput {
                    id: photocam
                    source: camera //показывает на экарне во время записи
                    width: 375
                    height: 200
                    anchors.bottom: capturebutton.top
                    anchors.bottomMargin: 50

                    Image {
                        id: photoPreview
                        height: 40
                        width: 75
                        anchors.right: parent.right
                        MouseArea {
                            anchors.fill: parent;
                            onClicked: photoPreview.width = 375, photoPreview.height = 200
                            onDoubleClicked: photoPreview.width = 75, photoPreview.height = 40
                        }
                        }
                        }

                            RoundButton {
                                id: capturebutton
                                Material.background: "white"
                                height: 65
                                width: 65
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.bottom
                                onClicked: camera.imageCapture.capture()
                            }
                            /*RoundButton {
                    Material.background: "white"
                    anchors.bottom: camera.top
                    anchors.right: parent.right
                    height: 65
                    width: 200
                    onClicked: camera.videoRecorder.record()
                }*/
                        }
                        /*RoundButton {
                Material.background: "white"
                anchors.top: camera.bottom
                height: 65
                width: 65
                onClicked: camera.videoRecorder.record()
                onDoubleClicked: camera.videoRecorder.stop()
            }*/

                        Item{
                            visible: false
                            width: 375
                            height: 470
                            id: page2
                            Rectangle {

                                width: 320
                                height: 240
                                color: "black"
                                //anchors.centerIn: parent.Center
                                anchors.bottom: parent.bottom
                                MediaPlayer {
                                    id: player
                                    source: "/video/sample (1).avi"
                                    autoPlay: true
                                    volume: 0
                                }

                                VideoOutput {
                                    id: videoOutput
                                    source: player
                                    anchors.bottom: parent.bottom
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                            Slider {
                                id:sliderforvideo
                                from: 1
                                to: 100
                                anchors.topMargin: 10
                                anchors.top: parent.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Button{
                                id: buttonplay
                                text: "плей"
                                onClicked: player.play(), this.visible = false, buttonpause.visible = true
                                anchors.right: sliderforvideo.left
                                anchors.top: parent.bottom
                                anchors.topMargin: 10
                            }

                            Button{
                                id: buttonpause
                                text: "пауза"
                                onClicked: player.pause(), this.visible = false, buttonplay.visible = true
                                anchors.right: sliderforvideo.left
                                anchors.top: parent.bottom
                                anchors.topMargin: 10
                            }
                        }
                    }

                    Page{
                        id: page03
                        header: ToolBar {
                            anchors.leftMargin: 10
                            anchors.left: parent.left;
                            layer.enabled: true
                            Material.background: "white"
                            Text {
                                font.family: "SF UI Display Bold"
                                text: "Графические эффекты"
                                font.pointSize: 23
                                color: "black"
                                anchors.bottom: parent.bottom
                            }
                        }

                        Image {
                            source: "/image/p4ZBKSVeTFY.jpg"
                        }


                    }

                    Page{

                    }
                }

                Drawer{
                    id: drawer
                    width: 0.80 * parent.width
                    height: parent.height
                    dragMargin: 20 * Screen.pixelDensity
                    GridLayout{
                        //anchors.fill: parent
                        width: parent.width
                        columns: 1
                        Button{
                            text: "Элементы GUI"
                            flat: true
                            onClicked: {swipeView.currentIndex = 0
                                drawer.close()}


                        }
                        Button{
                            text: "Камера. Фото и видео"
                            flat: true
                            onClicked: {swipeView.currentIndex = 1
                                drawer.close()}
                        }
                        Button{
                            text: "Графические эффекты"
                            flat: true
                            onClicked: {swipeView.currentIndex = 2
                                drawer.close()}
                        }

                    }
                }

                /* footer: TabBar {
                    id: tabBar
                    currentIndex: swipeView.currentIndex
                    font.family: "SF UI Display Light"

                    TabButton {
                        text: qsTr("Lab_1")
                    }
                    TabButton {
                        text: qsTr("Lab_2")
                    }
                    TabButton {
                        text: qsTr("Page 3")
                    }
                }*/
            }