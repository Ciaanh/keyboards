Pallas: one of the names of Athena, goddess of wisdom, war and craftsmanship.

This keyboard was inspired by the famous Alice keyboard.
The main issue I found with the layout of the Alice keyboard is that despite being "ergonomic" the two halves were too close for me. The result is the twelve keys pad at the center which filled the gap between the left and right part while providing function keys, num pad or macro keys.

While working on the PCB I found out the work of @tomsaleeba with the Ergoslab [https://github.com/tomsaleeba/ergoslab] and especially his idea of using one PCB file in Kicad with a Python script to generate the bas, middle and top PCBs for a complete PCB case design.


# Layout

![Layout](https://github.com/Ciaanh/keyboards/blob/main/Pallas/Layout.png?raw=true)

![PCB](https://github.com/Ciaanh/keyboards/blob/main/Pallas/PCB.png?raw=true)

# Build guide

I am still working on the prototype but rev 0.3 should be really close to a final version.

Minimum required components

- 75 switch MX compatible
- 75 1N4148 diodes (through hole or SMD)
- 1 Elite-C  ( [US](https://keeb.io/collections/frontpage/products/elite-c-low-profile-version-usb-c-pro-micro-replacement-atmega32u4) [EU](https://splitkb.com/products/elite-c-low-profile-rev4-microcontroller) )

Optional

- 1 switch for reset ([MJTP1117](https://fr.farnell.com/apem/mjtp1117/tactile-sw-spst-0-05a-12vdc-th/dp/2858318?ost=mjtp1117))

For RGB

- 4 WS2812B RGB LEDs
OR
- 1 RGB LEDs Strip ( SK6812/WS2812B compatible )

For switch LED

- 75 3mm LED
- 75 470 Ω resistors
- 1 1 kΩ resistor
- 1 mosfet SOT-23 ([IRLML6344TRPBF](https://fr.farnell.com/infineon/irlml6344trpbf/mosfet-canal-n-30v-6-3a-sot23/dp/1857299))

For OLED

- 1 128x64 4 pins OLED Display [SSD1306](https://splitkb.com/products/oled-display)
- 2 4.7 kΩ resistors


# Script

Some changes were made to @tomsaleeba's script.

Affect module to a PCB:
I decided to use another solution to define to which PCB a module should be drawn, for a given module we can set is its reference the PCB layer "Base", "Middle" or "Top".
This allow us to place elements on top and base PCB and not on the middle layer for example.

Back plate design:
It happens that we want to have a special design for the backplate of the board.
To ease this I decided to use the "Eco2.User" in wich all segment will better rendered on the "B.SilkS" of the "Base" PCB.

Self defined footprints:
One the main issue I had was that on the Ergoslab the cutout for the switch were drawn on the board "Eco1.User". But I have a lot of switch, some have stabilizer, and if I ever wanted to move switchs I would have to move all the corresponding cutout.
The solution I found was to draw the cutout directly in the "Eco1.User" of the switch footprint and then move them to the "Edge.Cuts" layer of the "Top" PCB. Check the *extract_module_cutout* and *clone_edge_to_board* to find how it works.

I'm working on Windows using Windows terminal and WSL so the command looks like :
    ``python3 ./generate_pcbs.py``