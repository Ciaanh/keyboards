static void render_status(void) {
    // 21 characters per line
    // 16 cols / 8 rows

    oled_write_P(PSTR("        Pallas rev0.3"), false);

    // Host Keyboard Layer Status
    oled_write_P(PSTR("Layer: "), false);
    switch (get_highest_layer(layer_state)) {
        case BASE:
            oled_write_P(PSTR("Default\n"), false);
            break;
        case FN:
            oled_write_P(PSTR("[F]\n"), false);
            break;
        case VS:
            oled_write_P(PSTR("Visual Studio\n"), false);
            break;
        case CODE:
            oled_write_P(PSTR("VS Code\n"), false);
            break;
        default:
            oled_write_P(PSTR("Undefined\n"), false);
    }

    // Host Keyboard LED Status
    led_t led_state = host_keyboard_led_state();
    oled_write_P(led_state.num_lock ? PSTR("NUM ") : PSTR("    "), false);
    oled_write_P(led_state.caps_lock ? PSTR("CAP ") : PSTR("    "), false);
    oled_write_P(led_state.scroll_lock ? PSTR("SCR ") : PSTR("    "), false);

    oled_write_ln("", false);
    oled_write_ln("", false);
    oled_write_ln("", false);
    //oled_write_ln("", false);
    //oled_write_ln("", false);

    static const char PROGMEM test_logo[] = {
        0xFF, 0x20, //0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
        // 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
        // 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 
        
        0x00
    };

    //oled_write_P(test_logo, false);
}

static void render_qmk_logo(void) {
    oled_set_cursor(0, 3);

    static const char PROGMEM qmk_logo[] = {
        0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8A, 0x8B, 0x8C, 0x8D, 0x8E, 0x8F, 0x90, 0x91, 0x92, 0x93, 0x94,
        0xA0, 0xA1, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9, 0xAA, 0xAB, 0xAC, 0xAD, 0xAE, 0xAF, 0xB0, 0xB1, 0xB2, 0xB3, 0xB4,
        0xC0, 0xC1, 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xCB, 0xCC, 0xCD, 0xCE, 0xCF, 0xD0, 0xD1, 0xD2, 0xD3, 0xD4, 
        
        0x00
    };

    oled_write_P(qmk_logo, false);
}

void oled_task_user(void) {
    switch (get_highest_layer(layer_state)) {
        case TOOLS:
            //render_pallas_logo();
            render_qmk_logo();
            break;
        default:
            render_status();  // Renders the current keyboard state (layer, lock, caps, scroll, etc)
    }
}