import QtQuick

import qs.Services

Text {
	antialiasing: false
	color: "white"
	font.family: "Cozette"
	topPadding: 1

	text: Time.format("hh:mm:ss AP")
}
