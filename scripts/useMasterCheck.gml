///auto-resets player's master mode
if instance_exists(objPlayer){//Master mode check
	var checkKey;
	if objPlayer.masterCycle == 1 {
		checkKey = key_MASTER;
	} else if objPlayer.masterCycle == 2 {
		checkKey = key_SILVER;
	}
    if objPlayer.masterMode == 1 && global.key[checkKey] <= 0{
        objPlayer.masterMode = 0;
		objPlayer.masterCycle = 0;
    }
    if objPlayer.masterMode == -1 && global.key[checkKey] >= 0{
        objPlayer.masterMode = 0;
		objPlayer.masterCycle = 0;
    }
    if objPlayer.masterMode == 2 && global.ikey[checkKey] <= 0{
        objPlayer.masterMode = 0;
		objPlayer.masterCycle = 0;
    }
    if objPlayer.masterMode == -2 && global.ikey[checkKey] >= 0{
        objPlayer.masterMode = 0;
		objPlayer.masterCycle = 0;
    }
}
