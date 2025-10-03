switch masterCycle {
	case 0:
	if global.key[color_MASTER] != 0 && global.complexMode == 0 {
		masterCycle = 1;
		if global.key[color_MASTER] > 0 {
			masterMode = 1;
			scrPlaySoundExt(sndMasterEquip,1,1,false);
		} else {
			masterMode = -1;
			scrPlaySoundExt(sndMasterAnti,1,1,false);
		}
		break;
	} if global.ikey[color_MASTER] != 0 && global.complexMode == 1 {
		masterCycle = 1;
		if global.ikey[color_MASTER] > 0 {
			masterMode = 2;
			scrPlaySoundExt(sndMasterEquip,1,1,false);
		} else {
			masterMode = -2;
			scrPlaySoundExt(sndMasterAnti,1,1,false);
		}
		break;
	}
	// conditional fallthrough!
	case 1:
	if global.key[color_SILVER] != 0 && global.complexMode == 0 {
		masterCycle = 2;
		if global.key[color_SILVER] > 0 {
			masterMode = 1;
			scrPlaySoundExt(sndMasterEquip,1,1,false);
		} else {
			masterMode = -1;
			scrPlaySoundExt(sndMasterAnti,1,1,false);
		}
		break;
	} if global.ikey[color_SILVER] != 0 && global.complexMode == 1 {
		masterCycle = 2;
		if global.ikey[color_SILVER] > 0 {
			masterMode = 2;
			scrPlaySoundExt(sndMasterEquip,1,1,false);
		} else {
			masterMode = -2;
			scrPlaySoundExt(sndMasterAnti,1,1,false);
		}
		break;
	}
	case 2:
	if masterCycle != 0 {
		scrPlaySoundExt(sndMasterUnequip,1,1,false);
	}
	masterMode = 0;
	masterCycle = 0;
	break;
}
