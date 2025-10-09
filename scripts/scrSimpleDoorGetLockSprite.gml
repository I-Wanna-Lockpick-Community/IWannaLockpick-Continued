///scrSimpleDoorGetLockSprite();
// gets the lock sprite to use for simple door

// predefined sprites
switch type {
    case lock_NORMAL:
        if count != 0 && icount == 0 {
            switch abs(count) {
                case 1: return sprLock1A;
                case 2: return sprLock2V;
                case 3: return sprLock3V;
                case 4: return sprLock4B;
                case 5: return sprLock5B;
                case 6: return sprLock6B;
                case 8: return sprLock8A;
                case 12: return sprLock12A;
                case 24: return sprLock24A;
            }
        } else if icount != 0 {
            switch abs(count) {
                case 1: return sprLock1A;
                case 2: return sprLock2V;
                case 3: return sprLock3V;
                // you can add more if you want; yes, these are really the only ones in vanilla
            }
        }
    break;
}

// otherwise, get sprite from the size of the door
if w == 1 && h == 1 { return sprLockAnyS; }
else if w == 1 && h == 2 { return sprLockAnyV }
else if w == 2 && h == 1 { return sprLockAnyH }
else if w == 2 && h == 2 { return sprLockAnyL }
else if w == 3 && h == 3 { return sprLockAnyXL }
else {
    // if youre triggering this you should probably make it a combo door
    return sprLockAnyS;
}
