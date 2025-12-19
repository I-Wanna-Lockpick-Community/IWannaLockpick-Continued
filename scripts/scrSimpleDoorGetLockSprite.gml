///scrSimpleDoorGetLockSprite(ipow);
// gets the lock sprite to use for simple door

var size;
if w == 1 && h == 1 { size = sprLockAnyS; }
else if w == 1 && h == 2 { size = sprLockAnyV }
else if w == 2 && h == 1 { size = sprLockAnyH }
else if w == 2 && h == 2 { size = sprLockAnyL }
else if w == 3 && h == 3 { size = sprLockAnyXL }
else {
    // note: doesnt yet work with glitch
    return sprLockAny;
}

// predefined sprites
var r = rotateR(count,icount,iPow);
var i = rotateI(count,icount,iPow);
switch type {
    case lock_NORMAL:
    case lock_EXACT:
        if r != 0 && i == 0 {
            switch abs(r) {
                case 1:
                    if size == sprLockAnyS { return sprLock1A; }; break;
                case 2:
                    if size == sprLockAnyV { return sprLock2V; }
                    else if size == sprLockAnyH { return sprLock2H; }; break;
                case 3:
                    if size == sprLockAnyV { return sprLock3V; }
                    else if size == sprLockAnyH { return sprLock3H; }; break;
                case 4: if size == sprLockAnyL { return sprLock4B; }; break;
                case 5: if size == sprLockAnyL { return sprLock5B; }; break;
                case 6: if size == sprLockAnyL { return sprLock6B; }; break;
                case 8: if size == sprLockAnyL { return sprLock8A; }; break;
                case 12: if size == sprLockAnyL { return sprLock12A; }; break;
                case 24: if size == sprLockAnyXL { return sprLock24A; }; break;
            }
        } else if i != 0 {
            switch abs(i) {
                case 1: return sprLock1A;
                case 2: return sprLock2V;
                case 3: return sprLock3V;
                // you can add more if you want; yes, these are really the only ones in vanilla
            }
        }
    break;
}

// otherwise, get sprite from the size of the door
return size;
