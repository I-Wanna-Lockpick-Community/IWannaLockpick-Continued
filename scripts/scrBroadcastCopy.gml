///scrBroadcastCopy(color);
with oKeyGlitch{
    if color == color_GLITCH{
        glitchMimic = argument0;
    }
}
with oDoorSimple{
    if cursed == -1 || cursed == color_PURE {
        glitchMimic = argument0;
    } else if cursed == color_GLITCH {
        curseGlitchMimic = argument0;
    }
    if cursed == -1 || cursed == color_PURE || armament {
        lockGlitchMimic = argument0;
    }
}
with oDoorCombo{
    armamentGlitchMimic = argument0;
    if cursed == -1 || cursed == color_PURE {
        glitchMimic = argument0;
    } else if cursed == color_GLITCH {
        curseGlitchMimic = argument0;
    }
}
with oGate{
    glitchMimic = argument0;
    armamentGlitchMimic = argument0;
}
with objPlayer { bufferKeyCheck = true; }
