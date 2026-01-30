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
    case rMainHub:
    case rGuestRoom:
    case rcx2a:
    case rcx2b:
    case rcx2c:
    case rcx2d:
    case rcx2e:
    case rcx3a:
    case rcx3b:
    case rcx3c:
    case rcx3d:
    case rcx4a:
    case rcx4b:
    case rcx4c:
    case rcx5a:
    case rcx5b:
    case rcx5c:
    case rcx5d:
    case rcx5e:
    case rcx5f:
    case rcxxx:
        roomSong = musGuestRoom;
        global.musicTitle = "Hazelstorm - Guest Room";
        break;
    case rcx1a:
    case rcx1b:
    case rcx1c:
    case rcx1d:
        roomSong = musArcade;
        global.musicTitle = "Thegur90 - New Jank City";
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
