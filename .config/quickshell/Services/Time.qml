pragma Singleton

import Quickshell

Singleton {
	function format(fmt: string): string {
		return Qt.formatDateTime(clock.date, fmt);
	}

	SystemClock {
		id: clock
		precision: SystemClock.Seconds
	}
}
