import QtQuick

import qs.Services

Row {
	spacing: 5

	Repeater {
		model: Hyprland.workspaces

		delegate: Rectangle {
			antialiasing: false
			color: modelData.focused ? "white" : "#525252"
			radius: 2
			height: 5
			width: modelData.focused ? "20" : "10"

			Behavior on width {
				NumberAnimation {
					duration: 250
					easing.type: Easing.OutBack
				}
			}
		}
	}
}
