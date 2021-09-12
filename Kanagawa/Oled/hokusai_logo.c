
static void render_hokusai(void) {
    static const char PROGMEM raw_logo[] = {
        0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,192,192, 96, 96,112,120, 56, 28,156,156, 14, 14,  6,  6,135,135,135,199,195,199,255,251,255,255,255,255,190,126,252,252,252,248,248,240,224,224,192,128,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
        0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,192,224,240,112, 56, 60, 28, 14,  7,  7,  3,  1,192,192,248,252,248,254,255,255,255,255,255,255,254,255,255,127,255,127,127, 31, 15,127,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,126,240,240,240,224,224,224,224,192,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
        0,  0,  0,  0,  0,128,192,192,224,112, 56, 60, 30, 15,135,131,129,192,192,192,224,224,  0,  0,  0,  0,  0,  7,223,255,191,191, 63,255,255,240,255,255,255,255,241,254,255,143,243,248,255,254,255,255,255,243,251,255,127,127,127, 63,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,191, 60, 56,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
        0, 56, 56,124,252,251,249,253,252,240,240,240,254,255,255,255,255,239,255,255,255,255,252,252,254,254,254,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,252,255,255,255,191,  1,  0,  0,  0,  0,  0,  0,  7,  3,  7,  7,  7,  3,  3, 31, 31, 63, 63, 63, 63, 63, 15, 15,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 96,  0,  0,  0,
        62,255,254,254,243,255,255,207,251,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,127,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,127,127,255,255,255,255,255,255,255,255,240,224,128,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,192,192,224,112,  0,  0,128,128,192,192,224,224,224, 96,
        0,  0, 31,127,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,191,255,255,255,255,255,255,255,255,255,255,255,255,255,127, 63, 31, 15, 15,  7,  3,128,192,240,240,225,  1,  1,  1,  3,  7, 15,127,255,255,255,252,248,192,  0,192,192,192,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,128,192,224,224,240,240,240,224,192,128,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,128,192,192,224,224,112,248,248,252,238,239,231,225,225,248,248,252, 63,191,255,255,255,191,239,198,
        0,  0,  0,  0,  3,  7,  7,  3,  3,  3,  3,  7,  7,  7, 31,239,207,143, 15, 15, 31, 15,252,255,255,247,243,227,227,129,225,225,224,240,252,252,252,252,252,255,255,255,255,255,255,254,252,252,252,248,248,252,252,248,251,247,143,159,255,255,255,255,255,239,254,252,248,248,248,248,252,254,254,255,255,239,239,239,231,239,255,255,255,239,239,239,255,255,254,254,252,252,248,240,248,252,252,252,254,254,254,255,255,255,251,255,254,254,254,255,255,255,255,255,255,255,255,255,255,255,255,255, 63,127,  7,113, 63, 15,
        0,  0,  0,112,240,240,240,192,128,  0,  0,  0,  0,128,248,241, 51,  3,230,254,252,126,127,127,255,255,255,127,255,255,249,251,251,251,243,251,255,255,255,255,255,254,252,255,255,255,255,255,251,223,255,255,255,255,255,223,255,255,255,255,253,251,255,255,255,255,255,255,255,247,247,239,255,255,255,247,255,159,191,191,255,255,255,255,225,225,255,255,255,255,111,255,255,255,255,255,255,127,127,255,255,255,255,255,255,255,255,127, 63, 31,255,255,255,255,123,127,255,195,131,  3,193,224,224,224,224,192,  0,  0,
    };
    oled_write_raw_P(raw_logo, sizeof(raw_logo));
}