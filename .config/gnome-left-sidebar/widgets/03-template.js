import St from 'gi://St';
import Clutter from 'gi://Clutter';

/**
 * SHAXSIY VIDJET YARATISH BO'YICHA ANDOZA (TEMPLATE)
 * 
 * Ushbu faylni o'zingiz xohlagancha tahrirlashingiz yoki nusxasini olib
 * "04-mening-vidjetim.js" kabi yangi nom bilan saqlashingiz mumkin.
 * Faylni saqlashingiz bilan panelda darhol yangilanadi!
 */
export default class CustomTemplateWidget {
    constructor(context) {
        // context obyekti ichida:
        // - this._context.sidebar      -> Sidebar obyekti
        // - this._context.closeSidebar -> Panelni yopish funksiyasi
        // - this._context.reload       -> Barcha vidjetlarni qayta yuklash funksiyasi
        this._context = context;
    }

    /**
     * createActor():
     * Ushbu funksiya Clutter yoki St elementini qaytarishi SHART.
     * Bu element panel ichiga joylashtiriladi.
     */
    createActor() {
        const card = new St.BoxLayout({
            style_class: 'left-sidebar-card my-custom-card',
            vertical: true,
        });

        const title = new St.Label({
            text: 'Mening Shaxsiy Vidjetim test',
            style_class: 'left-sidebar-section-title',
        });

        const desc = new St.Label({
            text: 'Fayl: ~/.config/gnome-left-sidebar/widgets/03-template.js\nBu yerga istalgan St yoki Clutter elementlarini joylashtirishingiz mumkin.',
            style_class: 'left-sidebar-card-text',
        });

        // Misol uchun oddiy chertiladigan tugma:
        const btn = new St.Button({
            label: 'Menga cherting!',
            style_class: 'button',
            can_focus: true,
            x_align: Clutter.ActorAlign.CENTER,
        });

        btn.connect('clicked', () => {
            btn.label = 'Ajoyib! Kod ishlayapti!';
        });

        card.add_child(title);
        card.add_child(desc);
        card.add_child(btn);

        return card;
    }

    /**
     * (Ixtiyoriy) Panel har ochilganda chaqiriladi
     */
    onOpen() {
        // Masalan: ma'lumotlarni yangilash
    }

    /**
     * (Ixtiyoriy) Panel har yopilganda chaqiriladi
     */
    onClose() {
        // Masalan: pauza qilish
    }

    /**
     * destroy():
     * Vidjet o'chirilganda yoki qayta yuklanganda xotirani tozalash uchun chaqiriladi.
     * O'zingiz ochgan taymerlarni (GLib.timeout_add) va signallarni shu yerda tozalang!
     */
    destroy() {
        // Resurslarni tozalash
    }
}
