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
    case rcx1a:
    case rcx1b:
    case rcx1c:
    case rcx1d:
    case rGuestRoom:
        roomSong = musGuestRoom;
        global.musicTitle = "Hazelstorm - Guest Room";
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
