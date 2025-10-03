//create a map for save data
var saveMap2 = ds_map_create();

ds_map_add(saveMap2,"newSavefile",global.newSavefile);
ds_map_add(saveMap2,"sawIntro",global.sawIntro);
ds_map_add(saveMap2,"didEscape",global.didEscape);
ds_map_add(saveMap2,"kinaHeart",global.kinaHeart);
ds_map_add(saveMap2,"clearRank",global.clearRank);

for(var i = 0; i < 50; i+=1){
    ds_map_add(saveMap2,"areaReached["+string(i)+"]",global.areaReached[i]);
}

for(var i = 0; i < 100; i+=1){
    ds_map_add(saveMap2,"saveRoomClear["+string(i)+"]",global.roomClear[i+250]);
}

for(var i = 0; i < 16; i+=1){
    ds_map_add(saveMap2,"omegaKey["+string(i)+"]",global.omegaKey[i]);
    ds_map_add(saveMap2,"omegaPuzzle["+string(i)+"]",global.omegaPuzzle[i]);
}

for(var i = 0; i < 5; i+=1){
    ds_map_add(saveMap2,"omegaPerk["+string(i)+"]",global.omegaPerk[i]);
}

for(var i = 0; i < 15; i+=1){
    ds_map_add(saveMap2,"areaSuperClear["+string(i)+"]",global.areaSuperClear[i]);
}

for(var i = 0; i < 20; i+=1){
    ds_map_add(saveMap2,"didCutscene["+string(i)+"]",global.didCutscene[i]);
}

for(var i = 0; i < 100; i+=1){
    ds_map_add(saveMap2,"convoUnlocked["+string(i)+"]",global.convoUnlocked[i]);
}

for(var i = 0; i < 100; i+=1){
    ds_map_add(saveMap2,"convoRead["+string(i)+"]",global.convoRead[i]);
}

for(var i = 0; i < 350; i+=1){
    ds_map_add(saveMap2,"roomSeen["+string(i)+"]",global.roomSeen[i]);
}

//add md5 hash to verify saves and make them harder to hack
var md5Hash = md5_string_unicode(json_encode(saveMap2)+global.md5StrAdd);
show_debug_message(md5Hash + " (SAVE GENERATED MD5)");
ds_map_add(saveMap2,"mapMd5_1",md5_string_unicode(json_encode(saveMap2)+global.md5StrAdd));

//save the map to a file
if (global.extraSaveProtection) //use ds_map_secure function
{
    ds_map_secure_save(saveMap2,"Data\p2save"+string(global.savenum));
}
else    //use text file
{
    //open the save file
    var f = file_text_open_write("Data\p2save"+string(global.savenum));
    
    //write map to the save file with base64 encoding
    file_text_write_string(f,base64_encode(json_encode(saveMap2)));
    
    file_text_close(f);
}

//destroy the map
ds_map_destroy(saveMap2);
