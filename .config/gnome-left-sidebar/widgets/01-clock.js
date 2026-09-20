import St from 'gi://St';
import Clutter from 'gi://Clutter';
import GLib from 'gi://GLib';

export default class ClockWidget {
    constructor(context) {
        this._context = context;
        this._timerId = 0;
    }

    createActor() {
        this._container = new St.BoxLayout({
            style_class: 'left-sidebar-card clock-widget-card',
            vertical: true,
            x_align: Clutter.ActorAlign.FILL,
        });

        this._timeLabel = new St.Label({
            style_class: 'clock-widget-time',
            x_align: Clutter.ActorAlign.CENTER,
            text: '--:--',
        });

        this._dateLabel = new St.Label({
            style_class: 'clock-widget-date',
            x_align: Clutter.ActorAlign.CENTER,
            text: 'Yuklanmoqda...',
        });

        this._container.add_child(this._timeLabel);
        this._container.add_child(this._dateLabel);

        this._updateTime();
        this._startTimer();

        return this._container;
    }

    _updateTime() {
        const now = GLib.DateTime.new_now_local();
        if (this._timeLabel) {
            this._timeLabel.text = now.format('%H:%M');
        }
        if (this._dateLabel) {
            this._dateLabel.text = now.format('%A, %d-%B');
        }
    }

    _startTimer() {
        this._stopTimer();
        // Har 1 soniyada tekshirish
        this._timerId = GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, 1, () => {
            this._updateTime();
            return GLib.SOURCE_CONTINUE;
        });
    }

    _stopTimer() {
        if (this._timerId) {
            GLib.Source.remove(this._timerId);
            this._timerId = 0;
        }
    }

    onOpen() {
        this._updateTime();
    }

    destroy() {
        this._stopTimer();
        this._container = null;
        this._timeLabel = null;
        this._dateLabel = null;
    }
}
