import St from 'gi://St';
import Clutter from 'gi://Clutter';
import Gio from 'gi://Gio';

export default class QuickAppsWidget {
    constructor(context) {
        this._context = context;
    }

    createActor() {
        const container = new St.BoxLayout({
            style_class: 'left-sidebar-card quick-apps-card',
            vertical: true,
        });

        const title = new St.Label({
            text: 'Tezkor Ilovalar',
            style_class: 'left-sidebar-section-title',
        });
        container.add_child(title);

        const grid = new St.BoxLayout({
            vertical: false,
            style_class: 'quick-apps-grid',
            x_align: Clutter.ActorAlign.CENTER,
        });

        const apps = [
            { icon: 'utilities-terminal-symbolic', tooltip: 'Terminal', cmd: 'x-terminal-emulator || gnome-terminal || ptyxis || alacritty || kitty || xterm' },
            { icon: 'system-file-manager-symbolic', tooltip: 'Fayllar', cmd: 'nautilus || thunar || dolphin || pcmanfm' },
            { icon: 'web-browser-symbolic', tooltip: 'Brauzer', uriScheme: 'https' },
            { icon: 'preferences-system-symbolic', tooltip: 'Sozlamalar', cmd: 'gnome-control-center' },
        ];

        for (const app of apps) {
            const btn = new St.Button({
                style_class: 'quick-app-btn',
                can_focus: true,
                child: new St.Icon({
                    icon_name: app.icon,
                    icon_size: 22,
                }),
            });

            btn.connect('clicked', () => {
                this._launch(app);
                if (this._context && this._context.closeSidebar) {
                    this._context.closeSidebar();
                }
            });

            grid.add_child(btn);
        }

        container.add_child(grid);
        return container;
    }

    _launch(app) {
        try {
            if (app.uriScheme) {
                // Tizimdagi standart ilovani (masalan, brauzerni) ochish
                const appInfo = Gio.AppInfo.get_default_for_uri_scheme(app.uriScheme);
                if (!appInfo) {
                    throw new Error(`"${app.uriScheme}" uchun standart ilova topilmadi`);
                }
                appInfo.launch([], global.create_app_launch_context(0, -1));
                return;
            }
            Gio.Subprocess.new(['/bin/sh', '-c', app.cmd], Gio.SubprocessFlags.NONE);
        } catch (e) {
            console.error(`[LeftSidebar] Ilovani ochishda xatolik: ${e.message}`);
        }
    }

    destroy() {
        // Tozalash kerak bo'lgan resurslar
    }
}
