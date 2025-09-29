pragma Singleton

import Quickshell
import Quickshell.Hyprland

import QtQuick

Singleton {
	readonly property var workspaces: Hyprland.workspaces

	Connections {
		target: Hyprland

		function onRawEvent(event: HyprlandEvent): void {
			if (event.name.endsWith("v2")) return;
			Hyprland.refreshWorkspaces();
		}
	}
}
