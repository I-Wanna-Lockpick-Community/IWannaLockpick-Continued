///scrBroadcastCopy(colorSpend,colorGlitch);
if argument0 != key_GLITCH{
    with oKeyGlitch{
        if color == key_GLITCH{
            colorGlitch = argument0;
        }
    }
    with oDoorSimple{
        if !browned{
            if color == key_GLITCH || colorSpend == key_GLITCH{
                colorGlitch = argument0;
            }
        }
    }
    with oDoorCombo{
        if !browned{
            if colorSpend == key_GLITCH{
                colorGlitch = argument0;
            }
            for(var i = 0; i < lockCount; i += 1){
                if lock[i,0] == key_GLITCH{
                    colorGlitch = argument0;
                }
            }
        }
    }
    with oGate{
        colorGlitch = argument0;
    }
}else{
    with oKeyGlitch{
        if color == key_GLITCH{
            colorGlitch = argument1;
        }
    }
    with oDoorSimple{
        if !browned{
            if color == key_GLITCH || colorSpend == key_GLITCH{
                colorGlitch = argument1;
            }
        }
    }
    with oDoorCombo{
        if !browned{
            if colorSpend == key_GLITCH{
                colorGlitch = argument1;
            }
            for(var i = 0; i < lockCount; i += 1){
                if lock[i,0] == key_GLITCH{
                    colorGlitch = argument1;
                }
            }
        }
    }
    with oGate{
        colorGlitch = argument1;
    }
}
