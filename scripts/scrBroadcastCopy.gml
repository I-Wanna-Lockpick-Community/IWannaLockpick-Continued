///scrBroadcastCopy(color);
with oKeyGlitch{
    if color == color_GLITCH{
        glitchMimic = argument0;
    }
}
with oDoorSimple{
    if cursed == -1 || cursed == color_PURE {
        if color == color_GLITCH || colorSpend == color_GLITCH{
            glitchMimic = argument0;
        }
    }
}
with oDoorCombo{
    if cursed == -1 || cursed == color_PURE {
        if colorSpend == color_GLITCH{
            glitchMimic = argument0;
        }
        for(var i = 0; i < lockCount; i += 1){
            if lock[i,0] == color_GLITCH{
                glitchMimic = argument0;
            }
        }
    }
}
with oGate{
    glitchMimic = argument0;
}
