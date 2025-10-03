/* Here's how THIS bag of worms will work out.
First, just like with other doors, aura checks happen first, and the door cannot
be opened otherwise. Next, the brown check happens if auras are cleared. Once that
happens, the door is eligible for opening. If the player is within range of the door
the Requirement Heuristic runs, including a master key check. Also note that the Heuristic
won't run if the door is in a certain part of the Adding/Removing Copy Animation.

Requirement Heuristic: First, if the door is not browned and either colorSpend or a
list function on all the locks returns at least one color_MASTER (0), then the door is NOT
gold-openable. The gold-openable code takes precedence over the normal open code.
If the door has a gold key applied to it within that code, then the normal code won't run
for this frame.

Now for the real meat and potatoes: For the door to open normally, every single requirement
on its individual locks must be met. An iterative loop goes through each lock once, grabs
its color (or substitutes brown), and then passes that color, the count, and the type of
lock into a checking function to see if the requirement for that lock is met. If all such
requirements return true, then the door will open normally. If a single one is untrue, how-
ever, then the door is not openable.

Next up, if the door is openable, then we move onto the last phase: Adding up all the
different costs to the Spend Color. It took a while to figure out the logistics, but
essentially, we *then* add the sum total of keys corresponding to each require amount,
using another special function. The only two edge cases to consider right now are for
Rainbow Doors (which is essentially a special type of Combo Door in itself, with the cost
being multiplied by the number of key types you own) and locks with ordinals on them.
So, our special function will receive inputs of the lock color, count, and type, to
determine what variables for the overarching Spend Total to increment. The one important
thing we determined, though, is that ordinal locks (we'll just use omega for now, no fancy
powers or epsilons) are added *after* all lower-ordinal (number) locks. The effect of this
is that the Spend Total immediately drops its numerical part and strictly becomes ordinal
in value. We'll use a tracking bool to determine whether the Spend Total is normal or if
it should be nulled and switch to an Ordinal Total instead. Then, *finally*, we will use
the same ordinal addition script we have on the Keys and apply it to the Spend Color. THEN
THE DOOR WILL BE DESTROYED AND MY LIFE WILL BECOME PEACEFUL AGAIN.*/

if !instance_exists(objPlayer){exit;}
if copyState != 0{exit;}
if !active{brownNearPlayer=0;visible=0;exit;}
brownNearPlayer=0;

var openEligible = false;//Whether or not the door is in a position to be opened
if aura[0] == 1 || aura[1] == 1 || aura[2] == 1 || objPlayer.aura[0] == -1 || objPlayer.aura[1] == -1 || objPlayer.aura[2] == -1{
    if distance_to_object(objPlayer) <= 23{
        removeAurasCombo();
        if aura[0] == 0 && aura[1] == 0 && aura[2] == 0{
            if objPlayer.brownMode != 0{
                enbrownCombo();
            }
        }
    }else{
        brownNearPlayer = 0;
    }
    exit;
}else{
    openEligible = true;
    if objPlayer.brownMode != 0{
        if distance_to_object(objPlayer) <= 23{
            enbrownCombo();
        }else{
            brownNearPlayer = 0;
        }
    }
}

var effectiveColorSpend;
if browned{
    effectiveColorSpend = color_BROWN;
}else{
    effectiveColorSpend = colorSpend;
}

//iPow stuff
if global.complexMode == 0{//Real view
    if copies > 0{iPow = 0;}
    if copies < 0{iPow = 2;}
    if copies == 0{
        if icopies > 0{iPow = 1;}
        if icopies < 0{iPow = 3;}
    }
}else{//Imaginary view
    if icopies > 0{iPow = 1;}
    if icopies < 0{iPow = 3;}
    if icopies == 0{
        if copies > 0{iPow = 0;}
        if copies < 0{iPow = 2;}
    }
}

//Now, the first big calculation is the Gold Eligibility.
var goldEligible = 0;//0 = Don't use gold, 1 = Use gold, -1 = Use negative gold.
if objPlayer.masterCycle == 1 {
    if objPlayer.masterMode == 1 && global.key[color_MASTER] > 0{
        goldEligible = 1;
    }else if objPlayer.masterMode == -1 && global.key[color_MASTER] < 0{
        goldEligible = -1;
    }else if objPlayer.masterMode == 2 && global.ikey[color_MASTER] > 0{
        goldEligible = 2;
    }else if objPlayer.masterMode == -2 && global.ikey[color_MASTER] < 0{
        goldEligible = -2;
    }
}
if !browned && goldEligible != 0{
    if colorSpend == color_MASTER || colorSpend == color_PURE || ((glitchMimic == color_MASTER || glitchMimic == color_PURE) && browned == 0){
        goldEligible = 0;
    }
    for(var i = 0; i < lockCount; i += 1){
        if lock[i,0] == color_MASTER || lock[i,0] == color_PURE{
            goldEligible = 0;
        }
    }
}
var dynamiteEligible = false;
if global.key[color_DYNAMITE] != 0 || global.ikey[color_DYNAMITE] != 0 {
    dynamiteEligible = true;
}
if !browned && dynamiteEligible {
    if colorSpend == color_DYNAMITE || colorSpend == color_PURE || ((glitchMimic == color_DYNAMITE || glitchMimic == color_PURE) && browned == 0){
        dynamiteEligible = false;
    }
    for(var i = 0; i < lockCount; i += 1){
        if lock[i,0] == color_DYNAMITE || lock[i,0] == color_PURE {
            dynamiteEligible = false;
        }
    }
}
var silverEligible = false;
if objPlayer.masterCycle == 2 && objPlayer.masterMode != 0 {
    silverEligible = true;
}
if !browned && silverEligible {
    if colorSpend == color_SILVER || colorSpend == color_PURE || ((glitchMimic == color_SILVER || glitchMimic == color_PURE) && browned == 0){
        silverEligible = false;
    }
    for(var i = 0; i < lockCount; i += 1){
        if lock[i,0] == color_SILVER || lock[i,0] == color_PURE {
            silverEligible = false;
        }
    }
}


//Now, check nearness to player, and house all the main code in different cases depending on gold eligibility.
if distance_to_object(objPlayer) <= 1{
    if dynamiteEligible && scrNormalDynamiteOpen() {
    // i hope this works
    undoBUFFER();
    } else {
        switch goldEligible{
            case 0://MAIN CODE
            var metRequirement = true;//Whether the requirement for every lock has been met
            if browned{//Brown version
                for(var i = 0; i < lockCount; i += 1){
                    if !scrCanOpenFeed(color_BROWN,lock[i,1],lock[i,2],lock[i,3],iPow){
                        metRequirement = false;
                    }
                }
            }else{//Normal
                for(var i = 0; i < lockCount; i += 1){
                    if !scrCanOpenFeed(lock[i,0],lock[i,1],lock[i,2],lock[i,3],iPow){
                        metRequirement = false;
                    }
                }
            }
            spendTotal = 0;//Integer part of cost
            spendITotal = 0;
            var tempIPow = iPow;
            if (silverEligible) {
                switch objPlayer.masterMode {
                    case 1: tempIPow = 0; break;
                    case 2: tempIPow = 1; break;
                    case -1: tempIPow = 2; break;
                    case -2: tempIPow = 3; break;
                }
            }
            if browned{//Door is brown, different spend amount can result from Blast Locks
                for(var i = 0; i < lockCount; i += 1){
                    scrAddSpendAmt(color_BROWN,lock[i,1],lock[i,2],lock[i,3],tempIPow);
                }
            }else{//Normal lock spend summation
                for(var i = 0; i < lockCount; i += 1){
                    scrAddSpendAmt(lock[i,0],lock[i,1],lock[i,2],lock[i,3],tempIPow);
                }
            }
            if (silverEligible) {
                addComplexKeys(effectiveColorSpend,glitchMimic,-spendTotal,-spendITotal,0);
                addComplexKeys(color_SILVER,0,-1,0,tempIPow);
                scrPlaySoundExt(sndMasterUnlock,1,1,false);
                event_user(2);
                objPlayer.masterMode = 0;
                objPlayer.masterCycle = 0;
                undoBUFFER();
                scrBroadcastCopy(effectiveColorSpend,glitchMimic); // should it?
            } else if metRequirement {
                addComplexKeys(effectiveColorSpend,glitchMimic,-spendTotal,-spendITotal,0);
                scrOpenCombo();
                scrBroadcastCopy(effectiveColorSpend,glitchMimic);
            }
            break;
            case 1://Lose a copy
                objPlayer.masterMode = 0;
                objPlayer.masterCycle = 0;
                addComplexKeys(color_MASTER,0,-1,0,0);
                copies -= 1;
                if copies == 0 && icopies == 0{
                    scrPlaySoundExt(sndMasterUnlock,1,1,false);
                    //scrBroadcastCopy(effectiveColorSpend,glitchMimic);
                    if global.salvageActive{
                        event_user(5);
                        scrSaveSalvage(global.salvageID,id);
                    }else{
                        event_user(0);
                    }
                    solid = 0; visible = 0; active = 0;
                }else if copies >= 0{
                    scrPlaySoundExt(sndMasterUnlock,1,1,false);
                    //scrBroadcastCopy(effectiveColorSpend,glitchMimic);
                    event_user(2);
                }else{
                    scrPlaySoundExt(sndMasterRelock,1,1,false);
                    event_user(1);
                }
                undoBUFFER();
            break;
            case -1://Gain a copy
                objPlayer.masterMode = 0;
                objPlayer.masterCycle = 0;
                addComplexKeys(color_MASTER,0,1,0,0);
                copies += 1;
                if copies == 0 && icopies == 0{
                    scrPlaySoundExt(sndMasterUnlock,1,1,false);
                    //scrBroadcastCopy(effectiveColorSpend,glitchMimic);
                    if global.salvageActive{
                        event_user(5);
                        scrSaveSalvage(global.salvageID,id);
                    }else{
                        event_user(0);
                    }
                    solid = 0; visible = 0; active = 0;
                }else if copies <= 0{
                    scrPlaySoundExt(sndMasterUnlock,1,1,false);
                    //scrBroadcastCopy(effectiveColorSpend,glitchMimic);
                    event_user(2);
                }else{
                    scrPlaySoundExt(sndMasterRelock,1,1,false);
                    event_user(1);
                }
                undoBUFFER();
            break;
            case 2://Lose an icopy
                objPlayer.masterMode = 0;
                objPlayer.masterCycle = 0;
                addComplexKeys(color_MASTER,0,0,-1,0);
                icopies -= 1;
                if copies == 0 && icopies == 0{
                    scrPlaySoundExt(sndMasterUnlock,1,1,false);
                    //scrBroadcastCopy(effectiveColorSpend,glitchMimic);
                    if global.salvageActive{
                        event_user(5);
                        scrSaveSalvage(global.salvageID,id);
                    }else{
                        event_user(0);
                    }
                    visible=0;solid=0;active=0;
                }else if icopies >= 0{//Still has + icopies or 0 and real copies
                    scrPlaySoundExt(sndMasterUnlock,1,1,false);
                    //scrBroadcastCopy(effectiveColorSpend,glitchMimic);
                    event_user(2);
                }else{//(Now) has negative icopies
                    scrPlaySoundExt(sndMasterRelock,1,1,false);
                    event_user(1);
                }
                undoBUFFER();
            break;
            case -2://Gain an icopy
                objPlayer.masterMode = 0;
                objPlayer.masterCycle = 0;
                addComplexKeys(color_MASTER,0,0,1,0);
                icopies += 1;
                if copies == 0 && icopies == 0{
                    scrPlaySoundExt(sndMasterUnlock,1,1,false);
                    //scrBroadcastCopy(effectiveColorSpend,glitchMimic);
                    if global.salvageActive{
                        event_user(5);
                        scrSaveSalvage(global.salvageID,id);
                    }else{
                        event_user(0);
                    }
                    visible=0;solid=0;active=0;
                }else if icopies <= 0{//Still has - icopies or 0 and real copies
                    scrPlaySoundExt(sndMasterUnlock,1,1,false);
                    //scrBroadcastCopy(effectiveColorSpend,glitchMimic);
                    event_user(2);
                }else{//(Now) has positive icopies
                    scrPlaySoundExt(sndMasterRelock,1,1,false);
                    event_user(1);
                }
                undoBUFFER();
            break;
        }
    }
}

useMasterCheck();
