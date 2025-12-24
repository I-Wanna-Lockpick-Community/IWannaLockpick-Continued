///gets which song is supposed to be playing for the current room and plays it

var roomSong;
global.oldPitch = global.musicPitch;
global.musicPitch = 1;
var _oldTitle = global.musicTitle;
global.musicTitle = "";
global.musicVol = 1;

switch (room)                       //determines which song to play
{
    case rTitle:                    //add rooms here, if you have several rooms that play the same song they can be put together
    case rMenu:
    case rOptions:
    case rDifficultySelect:
    case rStage01:
    //case rStage02:                //this room has a play music object in it so it doesnt need to be included in this script
        roomSong = -1;
        break;                      //make sure to always put a break after setting the song
    //case rMainHub:
    //    roomSong = musLeaves;
    //    global.musicTitle = "LCDDem - Leaves";
    //    break;
    case rBackHub:
        roomSong = musBackside;
        global.musicTitle = "ZWEI 2 - Floating Island 'Ilvard'";
        global.musicVol = .95;
        break;
    case rWayOut:
    case rEnd2:
        roomSong = musWind;
        global.musicTitle = "LCDDem - BGM047";
        break;
    case rGuestRoom:
        roomSong = musGuestRoom;
        global.musicTitle = "Hazelstorm - Guest Room";
        break;
    case rIntro:
    case rUltraPuzzle:
        roomSong = musFinale;
        global.musicTitle = "Lemanold - The Castle in the Picture";
        break;
    case rHubGB:
        roomSong = musGreatBeyond;
        global.musicTitle = "LCDDem - Lily Gardens";
        break;
    case rMonolith:
        roomSong = musMonolith;
        global.musicTitle = "Onefin + Miyolophone - Ivory Dance";
        global.musicVol = .9;
        break;
    case rTempClear:
        roomSong = musEnding;
        global.musicTitle = "Senses-Circuit - On a Quiet Night";
        break;
    case rHub01:
    case r01:
    case r02:
    case r03:
    case r04:
    case r05:
    case r06:
    case r07:
    case r08:
    case r09:
    case r10:
    case r1A:
    case r1B:
    case r0A:
    case r0B:
    case r0C:
    case r0D:
    case r0E:
    case r0F:
        roomSong = musReedz;
        global.musicTitle = "OcularNebula - Reedz";
        break;
    case rHub02:
    case r11:
    case r12:
    case r12a:
    case r13:
    case r14:
    case r15:
    case r16:
    case r17:
    case r18:
    case r19:
    case r20:
    case r1E:
    case r1F:
    case r1G:
    case r1H:
    case r1I:
    case r1J:
    case r1K:
    case r1L:
        roomSong = musSwimming;
        global.musicTitle = "Dustforce - Swimming while it Rains";
        global.musicVol = .85;
        break;
    case rHub03:
    case r21:
    case r22:
    case r23:
    case r24:
    case r25:
    case r26:
    case r27:
    case r28:
    case r29:
    case r2A:
    case r2B:
    case r2C:
    case r2D:
    case r2E:
    case r30:
        roomSong = musGeller;
        global.musicTitle = "Reed - Urea Geller";
        global.musicVol = .9;
        break;
    case rHub04:
    case r31:
    case r32:
    case r33:
    case r34:
    case r35:
    case r36:
    case r37:
    case r38:
    case r3A:
    case r3B:
    case r3C:
    case r3D:
    case room98:
        roomSong = musKlonoa;
        global.musicTitle = "Klonoa 2 - Moonlight Museum";
        global.musicVol = .95;
        break;
    case rHub05:
    case rHub05Old:
    case r41:
    case r42:
    case r43:
    case r44:
    case r45:
    case r46:
    case r47:
    case r4A:
    case r4B:
        roomSong = musDark;
        global.musicTitle = "Positively Dark - Awakening";
        global.musicVol = .9;
        break;
    case rHub06:
    case r51:
    case r52:
    case r53:
    case r54:
    case r55:
    case r56:
    case r57:
    case r58:
    case r59:
    case r5A:
    case r5B:
    case r5C:
    case r5D:
        roomSong = musDolls;
        global.musicTitle = "Dolls in Pseudo Paradise - Forest of Dolls";
        global.musicVol = .9;
    break;
    case rHub07:
    case r60:
    case r61:
    case r62:
    case r63:
    case r64:
    case r65:
    case r66:
    case r67:
    case r68:
    case r69:
    case r6A:
    case r6B:
    case r6C:
    case r6D:
    case r6E:
        roomSong = -2;
        global.musicTitle = "";
        break;
    case rHub08:
    case r70:
    case r71:
    case r72:
    case r73:
    case r74:
    case r75:
    case r76:
    case r7A:
    case r7B:
        roomSong = musEBF;
        global.musicTitle = "Phyrnna - Journey to the East";
        global.musicVol = .95;
        break;
    case rHub09:
    case r80:
    case r81:
    case r82:
    case r83:
    case r84:
    case r85:
    case r8A:
    case r8B:
    case r8C:
    case r8D:
    case r8E:
    case r8F:
        roomSong = musHarvest;
        global.musicTitle = "Kuhu - Harvest Swing";
        global.musicVol = .9;
        break;
    case rHub10:
    case r90:
    case r91:
    case r92:
    case r93:
    case r94:
    case r95:
    case r96:
    case r97:
    case r98:
    case r99:
    case r9A:
    case r9B:
    case r9C:
        roomSong = musC;
        global.musicTitle = "Imitate - C";
        global.musicVol = .9;
        break;
    case rHub11:
    case rA0:
    case rA1:
    case rA2:
    case rA3:
    case rA4:
    case rA5:
    case rA6:
    case rA7:
    case rA8:
    case rA9:
    case rAA:
    case rAB:
    case rAC:
        roomSong = musSkyTower;
        global.musicTitle = "Pokemon Mystery Dungeon Blue Rescue Team - Sky Tower";
        global.musicVol = .85;
        break;
    case rGBTut:
    case rGBTutNew:
        roomSong = musWind;
        global.musicTitle = "LCDDem - BGM047";
        break;
    case rAutumnHub:
    case rB0:
    case rB1:
    case rB2:
    case rB3:
    case rB4:
    case rB5:
    case rB6:
    case rB7:
    case rBO1:
    case rBO2:
        roomSong = musAutumn;
        global.musicTitle = "Zwei!! The Arges Adventure - Caiaphas Woods";
        global.musicVol = .95;
        break;
    case rWinterHub:
    case rC0:
    case rC1:
    case rC2:
    case rC3:
    case rC4:
    case rC5:
    case rC6:
        roomSong = musWinter;
        global.musicTitle = "Kirby's Return to Dreamland - Aurora Area";
        global.musicVol = .9;
        break;
    case rSummerHub:
    case rD0:
    case rD1:
    case rD2:
    case rD3:
    case rD4:
    case rD5:
    case rD6:
        roomSong = musSummer;
        global.musicTitle = "OcularNebula - Wistful Wish";
        global.musicVol = .95;
        break;
    case rSpringHub:
    case rE0:
    case rE1:
    case rE2:
    case rE3:
    case rE4:
        roomSong = musSpring;
        global.musicTitle = "Virt - Nightfall over the City";
        global.musicVol = 1;
        break;
    case rNullHub:
        roomSong = musMystery;
        global.musicTitle = "LCDDem - ???";
        global.musicVol = .95;
        break;
    case rHub00:
    case rF0:
    case rF1:
    case rF2:
    case rF3:
    case rF4:
    case rF5:
    case rF6:
        roomSong = musLab;
        global.musicTitle = "Haru - March Handyman";
        global.musicVol = .9;
        break;
    case rSecretLab:
        roomSong = musLab2;
        global.musicTitle = "Hazelstorm - Secret Lab";
        break;
    case rHub12:
    case rG0:
    case rG1:
    case rG2:
    case rG3:
    case rG4:
    case rG5:
    case rG6:
    case rG7:
    case rG8:
    case rG9:
    case rGA:
    case rGB:
    case rGC:
    case rGD:
    case rGE:
        roomSong = musCafe;
        global.musicTitle = "Cafe de Touhou 8 - Cafe des Desirs";
        global.musicVol = .9;
        break;
    //case rOmega0:
    //case rOmega1:
    //case rOmega2:
    case rOmega7:
        roomSong = -1;//musLuigi;
        break;
    case rOmegaD:
        roomSong = musHanano;
        global.musicTitle = "Hanano Puzzle 2 - Clouds";
        break;
    case rEXHub:
    case rEX0:
    case rEX1:
    case rEX2:
    case rEX3:
    case rEX4:
    case rEX5:
    case rEX6:
    case rEX7:
        roomSong = musEX;
        global.musicTitle = "Yotsuba Kagerou - Tatsumairi in the Rain";
        global.musicVol = .95;
        break;
    case rEXZ:
        roomSong = musEpilogue;
        global.musicTitle = "Hazelstorm - Bridge to New Memories";
        break;
    case rHubOmega:
    case rH0:
    case rH1:
    case rH2:
    case rH3:
    case rHZ:
    case rHW:
    case rHV:
    case rHY:
    case rHU:
    case rHT:
    case rHS:
    case rHR:
    case rHQ:
    case rHP:
    case rHO:
    case rHN:
    case rHM:
    case rH0H:
    case rOmega0:
    case rOmega1:
        roomSong = musHorizon;
        global.musicTitle = "Hazelstorm - Lockpick Horizon";
        break;
    case rKinaDiary:
        roomSong = musEpilogue;
        global.musicPitch = .5;
        global.musicTitle = "Hazelstorm - Bridge to New Memories";
        break;
    case rMuseum:
    case rIntro2:
        roomSong = musGuestRoom;
        global.musicPitch = .5;
        global.musicTitle = "Hazelstorm - Guest Room";
        break;
    case rConnection:
        roomSong = musConnection;
        global.musicTitle = "LCDDem - Leaves";
        break;
    case rCredits:
        roomSong = -2;
        break;
    case rTitleNew:
        roomSong = -1;              //play nothing
        break;
    default:                        //default option in case the room does not have a song set
        roomSong = -1;
        break;
}

if global.musicTitle != "" && global.musicTitle != _oldTitle{
    with oMusicCredit{instance_destroy();}
    instance_create(0,0,oMusicCredit);
}

if (roomSong != -2){
    scrPlayMusic(roomSong,true); //play the song for the current room
}
