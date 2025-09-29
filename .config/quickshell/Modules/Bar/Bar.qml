import Quickshell

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.Modules.Bar.Components

PanelWindow {
	anchors {
		top: true
	}

	margins {
		top: 5
	}

	implicitWidth: 500
	implicitHeight: 30

	color: "transparent"

	Rectangle {
		anchors.fill: parent
		color: "black"
		radius: 10
	}

	RowLayout {
		anchors.fill: parent
		anchors.leftMargin: 10
		anchors.rightMargin: 10

		spacing: 0

		Item {
			Layout.fillWidth: true
			Layout.fillHeight: true

			Row {
				anchors.verticalCenter: parent.verticalCenter
				anchors.left: parent.left
				spacing: 10

				Workspaces {}
			}
		}

		Item {
			Layout.fillWidth: true
			Layout.fillHeight: true

			Row {
				anchors.verticalCenter: parent.verticalCenter
				anchors.right: parent.right
				spacing: 10

				Clock {}
			}
		}
	}
}
