if type == 0 || type == 1 || type == 3 || type == 4 || type == 5{
    if color == color_MASTER && colorSpend == color_MASTER && type != 5 && cursed == -1{
        scrPlaySoundExt(sndMasterUnlock,1,1,false);
    }else{
        scrPlaySoundExt(sndOpen,1,1,false);
    }
}
if type == 2{
    scrPlaySoundExt(sndBlast,1,1,false);
}
//Slowstopping
scrPlayerDownStop();
if iPow == 0{//Real +
    if copies > 0{copies -= 1;}
}else if iPow == 1{//Im +
    if icopies > 0{icopies -= 1;}
}else if iPow == 2{//Real -
    if copies < 0{copies += 1;}
}else{//Im -
    if icopies < 0{icopies += 1;}
}
if copies == 0 && icopies == 0{//DESTROY
    solid = 0; visible = 0; active = 0;
    if global.salvageActive{
        event_user(5);
        scrSaveSalvage(global.salvageID,id);
    }else{//Normal door open
        event_user(0);
        var playerOnTop = place_meeting(x,y-1,objPlayer);
        //instance_destroy();
        if playerOnTop{
            with objPlayer{
                if place_free(x,y+1){
                    djump = 0;
                    if recentJump{
                        vspeed *= .45;
                    }
                }
            }
        }
    }
}else{
    event_user(2);
}
undoBUFFER();
