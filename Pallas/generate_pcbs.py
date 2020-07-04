#!/usr/bin/env python
# Reads the PCB "master", that we edit by hand, and generates 3 output PCBs for
# each of the layers of the sandwich style case. This helps to keep everything
# in sync between the layers. You must have Kicad installed on your system as
# that installs the `pcbnew` module that we use. AFAIK you can't install pcbnew
# via pip.
# API reference https://docs.kicad-pcb.org/doxygen-python/namespacepcbnew.html
# pcbnew source code https://gitlab.com/kicad/code/kicad/-/tree/master/pcbnew

import sys
import os
import pcbnew

this_dir = os.path.dirname(os.path.realpath(__file__))
master_pcb = os.path.join(this_dir, "pallas.kicad_pcb")
base_pcb = os.path.join(this_dir, "generated_pcbs", "base.kicad_pcb")
middle_pcb = os.path.join(this_dir, "generated_pcbs", "middle.kicad_pcb")
top_pcb = os.path.join(this_dir, "generated_pcbs", "top.kicad_pcb")

ALL_LAYERS_WIDTH = 50000
NOT_TOP_PLATE_WIDTH = 50010
ALL_LAYERS_TEXT_THICKNESS = 150100


def refill_zones(board):
    # thanks https://forum.kicad.info/t/filling-zones-copper-pours-inside-the-python-api/19814/3
    filler = pcbnew.ZONE_FILLER(board)
    zones = board.Zones()
    filler.Fill(zones)


def is_logo(module):
    return module.GetReference().startswith("Logo")


def is_brace(module):
    return module.GetReference().startswith("Brace")


def is_mount(module):
    return module.GetReference().startswith("Mount")


def is_decorationhole(module):
    return module.GetReference().startswith("DecorationHole")


def is_for_base(module):
    index = module.GetReference().find("Base")
    return index > -1


def is_for_middle(module):
    index = module.GetReference().find("Middle")
    return index > -1


def is_for_top(module):
    index = module.GetReference().find("Top")
    return index > -1


def delete_electronics(board):
    for module in board.GetModules():
        if is_mount(module) or is_logo(module) or is_brace(module) or is_decorationhole(module):
            continue
        board.Delete(module)


def extract_module_cutout(board):
    edge_cuts_layer_id = board.GetLayerID("Edge.Cuts")
    for module in board.GetModules():
        for d in module.GraphicalItems():
            if d.GetLayerName() == "Eco1.User":
                if type(d) is pcbnew.EDGE_MODULE:
                    segment = clone_edge_to_board(d, module)
                    segment.SetLayer(edge_cuts_layer_id)
                    board.Add(segment)


def clone_edge_to_board(edge, module):
    position = module.GetPosition()

    edgeStart = edge.GetStart0()
    edgeEnd = edge.GetEnd0()

    edgeStart.x = edgeStart.x + position.x
    edgeStart.y = edgeStart.y + position.y

    edgeEnd.x = edgeEnd.x + position.x
    edgeEnd.y = edgeEnd.y + position.y

    segment = pcbnew.DRAWSEGMENT(module)
    segment.SetWidth(ALL_LAYERS_WIDTH)
    segment.SetStart(edgeStart)
    segment.SetEnd(edgeEnd)
    segment.Rotate(position, module.GetOrientation())

    return segment


def delete_tracks(board):
    for t in board.GetTracks():
        board.Delete(t)


def generate_base_pcb():
    board = pcbnew.LoadBoard(master_pcb)
    b_silk_layer_id = board.GetLayerID("B.SilkS")
    print("Creating base PCB: %s" % base_pcb)

    delete_electronics(board)

    for module in board.GetModules():
        if is_brace(module) or is_mount(module) or is_logo(module) or is_decorationhole(module):
            if not is_for_base(module):
                board.Delete(module)

    delete_tracks(board)

    for d in board.GetDrawings():
        if type(d) is pcbnew.TEXTE_PCB:
            if d.GetThickness() == ALL_LAYERS_TEXT_THICKNESS:
                continue
        if d.GetLayerName() == "Edge.Cuts":
            if type(d) is pcbnew.DRAWSEGMENT:
                if (
                    d.GetWidth() == NOT_TOP_PLATE_WIDTH
                    or d.GetWidth() == ALL_LAYERS_WIDTH
                ):
                    continue
        if d.GetLayerName() == "Eco2.User":
            d.SetLayer(b_silk_layer_id)
            continue
        board.Delete(d)

    refill_zones(board)
    board.Save(base_pcb)


def generate_middle_pcb():
    board = pcbnew.LoadBoard(master_pcb)
    print("Creating middle PCB: %s" % middle_pcb)

    for module in board.GetModules():
        if is_brace(module) or is_mount(module) or is_logo(module) or is_decorationhole(module):
            if not is_for_middle(module):
                board.Delete(module)

    for d in board.GetDrawings():
        if type(d) is pcbnew.TEXTE_PCB:
            continue
        layer_name = d.GetLayerName()
        if layer_name == "F.SilkS" or layer_name == "B.SilkS":
            continue
        if layer_name == "Edge.Cuts":
            if type(d) is pcbnew.DRAWSEGMENT:
                if (
                    d.GetWidth() == NOT_TOP_PLATE_WIDTH
                    or d.GetWidth() == ALL_LAYERS_WIDTH
                ):
                    continue
        board.Delete(d)

    refill_zones(board)
    board.Save(middle_pcb)


def generate_top_pcb():
    board = pcbnew.LoadBoard(master_pcb)
    edge_cuts_layer_id = board.GetLayerID("Edge.Cuts")
    print("Creating top PCB: %s" % top_pcb)

    extract_module_cutout(board)

    delete_electronics(board)

    for module in board.GetModules():
        if is_brace(module) or is_mount(module) or is_logo(module) or is_decorationhole(module):
            if not is_for_top(module):
                board.Delete(module)

    delete_tracks(board)

    for d in board.GetDrawings():
        if type(d) is pcbnew.TEXTE_PCB:
            if d.GetThickness() == ALL_LAYERS_TEXT_THICKNESS:
                continue
        if d.GetLayerName() == "Edge.Cuts":
            if type(d) is pcbnew.DRAWSEGMENT:
                if d.GetWidth() == ALL_LAYERS_WIDTH:
                    continue
        if d.GetLayerName() == "Eco1.User":
            is_for_top_plate = d.GetWidth() != NOT_TOP_PLATE_WIDTH
            if is_for_top_plate:
                d.SetLayer(edge_cuts_layer_id)
                continue
        board.Delete(d)

    refill_zones(board)
    board.Save(top_pcb)


generate_base_pcb()
generate_middle_pcb()
generate_top_pcb()
