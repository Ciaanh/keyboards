#!/usr/bin/env python
# Reads the PCB "master", that we edit by hand, and generates 3 output PCBs for
# each of the layers of the sandwich style case. This helps to keep everything
# in sync between the layers. You must have Kicad installed on your system as
# that installs the `pcbnew` module that we use. AFAIK you can't install pcbnew
# via pip.
# API reference https://docs.kicad-pcb.org/doxygen-python/namespacepcbnew.html
# pcbnew source code https://gitlab.com/kicad/code/kicad/-/tree/master/pcbnew

# /!\  this script is updated for Kicad 6

# Board rules
# Logo, Brace, Mount, DecorationHole are keywords for components which can appear on several layer.
# The keywords Top, Middle indicate on which layer the components should appear.
#
# Regarding Edge Cuts
# Edge cuts can be filtered using line width, for the middle layer only (MIDDLE_PLATE_WIDTH) or for all layers (ALL_LAYERS_WIDTH)
# Lines in the User.Eco1 are converted as edge cuts for the Top layer
#
# Regarding Text
# Text with 150100 (0.1501 mm) thickness will be maintained on all layer (ALL_LAYERS_TEXT_THICKNESS)


import sys
import os
from typing import NoReturn
import pcbnew

this_dir = os.path.dirname(os.path.realpath(__file__))
master_pcb = os.path.join(this_dir, "Wonderland.kicad_pcb")

middle_pcb = os.path.join(this_dir, "generated_pcbs", "middle.kicad_pcb")
plate_pcb = os.path.join(this_dir, "generated_pcbs", "plate.kicad_pcb")

ALL_LAYERS_WIDTH          =   50000 # 0.050000 mm
TOP_PLATE_WIDTH           =  250000 # 0.250000 mm
MIDDLE_PLATE_WIDTH        =  200000 # 0.200000 mm
ALL_LAYERS_TEXT_THICKNESS =  150100 # 0.150100 mm

EDGE_CUT = "Edge.Cuts"
ECO1_USER = "User.Eco1"
# ECO2_USER = "User.Eco2"
F_SILKS = "F.SilkS"
B_SILKS = "B.SilkS"

CIRCLE = "Circle"
ARC = "Arc"

def refill_zones(board):
    # thanks https://forum.kicad.info/t/filling-zones-copper-pours-inside-the-python-api/19814/3
    filler = pcbnew.ZONE_FILLER(board)
    zones = board.Zones()
    filler.Fill(zones)

####################################################################################
# keywords for multi layer items
def is_logo(module):
    return module.GetReference().startswith("Logo")

def is_brace(module):
    return module.GetReference().startswith("Brace")


def is_mount(module):
    return module.GetReference().startswith("Mount")


def is_decorationhole(module):
    return module.GetReference().startswith("DecorationHole")


# Layer keywords
def is_for_middle(module):
    index = module.GetReference().find("Middle")
    return index > -1

def is_for_top(module):
    index = module.GetReference().find("Top")
    return index > -1

####################################################################################
# Clean electronics footprints
def delete_electronics(board):
    for footprint in board.GetFootprints():
        if is_mount(footprint) or is_logo(footprint) or is_brace(footprint) or is_decorationhole(footprint):
            continue
        board.Delete(footprint)

####################################################################################
# Get cuts from the footprint User.Eco1 layer and clone to Edge Cuts
def extract_footprints_cutout(board):
    edge_cuts_layer_id = board.GetLayerID(EDGE_CUT)
    for footprint in board.GetFootprints():
        for graphicalItem in footprint.GraphicalItems():
            if graphicalItem.GetLayerName() == ECO1_USER:                
                if type(graphicalItem) is pcbnew.FP_SHAPE:
                    shape = clone_shape_to_board(graphicalItem, footprint)
                    shape.SetLayer(edge_cuts_layer_id)
                    board.Add(shape)


def clone_shape_to_board(graphicalItem, module):
    shape = graphicalItem.ShowShape()
    if(shape == CIRCLE):
        return draw_circle(graphicalItem, module)
    elif(shape == ARC):
        return draw_arc(graphicalItem, module)
    else:
        return draw_line(graphicalItem, module)


def draw_circle(graphicalItem, module):
    circleRadius = graphicalItem.GetRadius()
    circleCenter = graphicalItem.GetCenter()
    shape = pcbnew.PCB_SHAPE(module)
    shape.SetShape(pcbnew.S_CIRCLE)
    shape.SetWidth(ALL_LAYERS_WIDTH)
    shape.SetCenter(circleCenter)
    circleEnd = pcbnew.wxPoint(circleCenter.x + circleRadius,circleCenter.y) 
    shape.SetEndX(circleCenter.x + circleRadius)
    shape.SetEndY(circleCenter.y)
    shape.Rotate(module.GetPosition(), module.GetOrientation())
    return shape


def draw_arc(graphicalItem, module):
    arcStart = graphicalItem.GetStart()
    arcCenter = graphicalItem.GetCenter()
    arcAngle = graphicalItem.GetArcAngle()
    shape = pcbnew.PCB_SHAPE(module)
    shape.SetShape(pcbnew.S_ARC)
    shape.SetWidth(ALL_LAYERS_WIDTH)
    shape.SetStart(arcStart)
    shape.SetCenter(arcCenter)    
    shape.SetArcAngleAndEnd(arcAngle)
    shape.Rotate(module.GetPosition(), module.GetOrientation())
    return shape

def draw_line(graphicalItem, module):
    position = module.GetPosition()
    edgeStart = graphicalItem.GetStart0()
    edgeStart.x = edgeStart.x + position.x
    edgeStart.y = edgeStart.y + position.y
    edgeEnd = graphicalItem.GetEnd0()
    edgeEnd.x = edgeEnd.x + position.x
    edgeEnd.y = edgeEnd.y + position.y
    shape = pcbnew.PCB_SHAPE(module)
    shape.SetWidth(ALL_LAYERS_WIDTH)
    shape.SetStart(edgeStart)
    shape.SetEnd(edgeEnd)
    shape.Rotate(position, module.GetOrientation())
    return shape

# Delete all tracks
def delete_tracks(board):
    for t in board.GetTracks():
        board.Delete(t)


####################################################################################
####################################################################################
####################################################################################

def generate_middle_pcb():
    board = pcbnew.LoadBoard(master_pcb)
    print("Creating middle PCB: %s" % middle_pcb)

    for footprint in board.GetFootprints():
        if is_brace(footprint) or is_mount(footprint) or is_logo(footprint) or is_decorationhole(footprint):
            if not is_for_middle(footprint):
                board.Delete(footprint)

    for d in board.GetDrawings():
        if type(d) is pcbnew.PCB_TEXT:
            continue
        layer_name = d.GetLayerName()
        if layer_name == F_SILKS or layer_name == B_SILKS:
            continue
        if layer_name == EDGE_CUT:
            if type(d) is pcbnew.PCB_SHAPE:
                if (
                    d.GetWidth() == MIDDLE_PLATE_WIDTH
                    or d.GetWidth() == ALL_LAYERS_WIDTH
                ):
                    continue
        board.Delete(d)

    refill_zones(board)
    board.Save(middle_pcb)


def generate_top_pcb(pcb_name):
    board = pcbnew.LoadBoard(master_pcb)
    edge_cuts_layer_id = board.GetLayerID(EDGE_CUT)
    print("Creating top PCB: %s" % pcb_name)

    extract_footprints_cutout(board)

    delete_electronics(board)

    for footprint in board.GetFootprints():
        if is_brace(footprint) or is_mount(footprint) or is_logo(footprint) or is_decorationhole(footprint):
            if not is_for_top(footprint):
                board.Delete(footprint)

    delete_tracks(board)

    for d in board.GetDrawings():
        if type(d) is pcbnew.PCB_TEXT:
            if d.GetTextThickness() == ALL_LAYERS_TEXT_THICKNESS:
                continue
        if d.GetLayerName() == EDGE_CUT:
            if type(d) is pcbnew.PCB_SHAPE:
                if d.GetWidth() == ALL_LAYERS_WIDTH:
                    continue
        if d.GetLayerName() == ECO1_USER:
            element_width = d.GetWidth()
            is_for_top_plate = element_width != MIDDLE_PLATE_WIDTH or element_width == TOP_PLATE_WIDTH
            if is_for_top_plate:
                d.SetLayer(edge_cuts_layer_id)
                continue
        board.Delete(d)

    refill_zones(board)
    board.Save(pcb_name)


generate_middle_pcb()
generate_top_pcb(plate_pcb)

