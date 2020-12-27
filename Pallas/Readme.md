Pallas: one of the names of Athena, goddess of wisdom, war and craftsmanship.

This keyboard was inspired by the famous Alice keyboard.
The main issue I found with the layout of the Alice keyboard is that despite being "ergonomic" the two halves were too close for me. The result is the twelve keys pad at the center which filled the gap between the left and right part while providing function keys, num pad or macro keys.

While working on the PCB I found out the work of @tomsaleeba with the Ergoslab [https://github.com/tomsaleeba/ergoslab] and especially his idea of using one PCB file in Kicad with a Python script to generate the bas, middle and top PCBs for a complete PCB case design.


# Layout

# Build guide

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