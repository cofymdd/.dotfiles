import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
	id: root

	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	Connections {
		target: Pipewire.defaultAudioSink?.audio

		function onVolumeChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();
		}
	}




	property bool shouldShowOsd: true

	Timer {
		id: hideTimer
		interval: 2000
		onTriggered: root.shouldShowOsd = false
	}

	LazyLoader {
		active: root.shouldShowOsd

		PanelWindow {
			anchors {
				bottom: true
			}

			margins {
				bottom: screen.height / 20
			}

			exclusiveZone: 0

			implicitWidth: 200
			implicitHeight: 30
			color: "transparent"

			mask: Region {}

			Rectangle {
				anchors.fill: parent
				color: '#000000'
				radius: 10

				RowLayout {
					anchors.fill: parent
					anchors.leftMargin: 10
					anchors.rightMargin: 10

					spacing: 10


					Text {
						antialiasing: false
						color: "white"
						font.family: "Cozette"
						topPadding: 1

						property real volumeLevel: Pipewire.defaultAudioSink?.audio.volume ?? 0
						property bool isMuted: Pipewire.defaultAudioSink?.audio.muted ?? false

						text: {
							if (isMuted || volumeLevel === 0) return "婢"; // muted
							if (volumeLevel < 0.33) return "奄"; // low
							if (volumeLevel < 0.66) return "奔"; // medium
							return "墳"; // high
						}
					}

					Rectangle {
						Layout.fillWidth: true

						implicitHeight: 2
						color: "#50ffffff"

						Rectangle {
							anchors {
								left: parent.left
								top: parent.top
								bottom: parent.bottom
							}

							color: '#ffffff'

							property bool isMuted: Pipewire.defaultAudioSink?.audio.muted ?? false
							property real volumeLevel: Pipewire.defaultAudioSink?.audio.volume ?? 0

							implicitWidth: isMuted ? 0 : parent.width * volumeLevel

							Behavior on implicitWidth {
								NumberAnimation {
									duration: 500
									easing.type: Easing.OutBack
								}
							}
						}
					}
				}
			}
		}
	}
}
