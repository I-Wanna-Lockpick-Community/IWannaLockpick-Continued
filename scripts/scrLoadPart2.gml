//load the save map
var saveMap2;

if (global.extraSaveProtection) //use ds_map_secure function
{
    saveMap2 = ds_map_secure_load("Data\p2save"+string(global.savenum));
}
else    //use text file
{
    var f = file_text_open_read("Data\p2save"+string(global.savenum));
    
    saveMap2 = json_decode(base64_decode(file_text_read_string(f)));
    
    file_text_close(f);
}

var saveValid = true;   //keeps track of whether or not the save being loaded is valid

if (saveMap2 != -1)  //check if the save map loaded correctly
{
    global.newSavefile = ds_map_find_value(saveMap2,"newSavefile");
    global.sawIntro = ds_map_find_value(saveMap2,"sawIntro");
    global.didEscape = ds_map_find_value(saveMap2,"didEscape");
    global.kinaHeart = ds_map_find_value(saveMap2,"kinaHeart");
    global.clearRank = ds_map_find_value(saveMap2,"clearRank");
    
    for (var i = 0; i < 50; i++)
    {
        global.areaReached[i] = ds_map_find_value(saveMap2,"areaReached["+string(i)+"]");
    }
    
    for (var i = 0; i < 100; i++)
    {
        global.roomClear[i+250] = ds_map_find_value(saveMap2,"saveRoomClear["+string(i)+"]");
    }
    
    for (var i = 0; i < 16; i++)
    {
        global.omegaKey[i] = ds_map_find_value(saveMap2,"omegaKey["+string(i)+"]");
        global.omegaPuzzle[i] = ds_map_find_value(saveMap2,"omegaPuzzle["+string(i)+"]");
    }
    
    for (var i = 0; i < 5; i++)
    {
        global.omegaPerk[i] = ds_map_find_value(saveMap2,"omegaPerk["+string(i)+"]");
    }
    
    for (var i = 0; i < 15; i++)
    {
        global.areaSuperClear[i] = ds_map_find_value(saveMap2,"areaSuperClear["+string(i)+"]");
    }
    
    for (var i = 0; i < 20; i++)
    {
        global.didCutscene[i] = ds_map_find_value(saveMap2,"didCutscene["+string(i)+"]");
    }
    
    for (var i = 0; i < 100; i++)
    {
        global.convoUnlocked[i] = ds_map_find_value(saveMap2,"convoUnlocked["+string(i)+"]");
    }
    
    for (var i = 0; i < 100; i++)
    {
        global.convoRead[i] = ds_map_find_value(saveMap2,"convoRead["+string(i)+"]");
    }

    for (var i = 0; i < 350; i++)
    {
        var _vrs = ds_map_find_value(saveMap2,"roomSeen["+string(i)+"]");
        if !is_undefined(_vrs){global.roomSeen[i] = _vrs;}else{global.roomSeen[i] = 0;}
    }
    
    //load md5 string from the save map
    var mapMd5_1 = ds_map_find_value(saveMap2,"mapMd5_1");
    
    //check if md5 is not a string in case the save was messed with or got corrupted
    if (!is_string(mapMd5_1)){
        mapMd5_1 = "";   //make it a string for the md5 comparison
    }
    //show_debug_message(mapMd5_1 + " (LOAD READ MD5)");
    
    //generate md5 string to compare with
    ds_map_delete(saveMap2,"mapMd5_1");
    var genMd5_1 = md5_string_unicode(json_encode(saveMap2)+global.md5StrAdd);
    //show_debug_message(genMd5_1 + " (LOAD GENERATED MD5)")
    
    if (mapMd5_1 != genMd5_1){   //check if md5 hash is invalid
        saveValid = false;
        show_message("Invalid MD5");
    }
    
    //destroy the map
    ds_map_destroy(saveMap2);
}
else
{
    //save map didn't load correctly, set the save to invalid
    saveValid = false;
    show_message("Save map invalid");
}

if (!saveValid) //check if the save is invalid
{
    //save is invalid, restart the game
    
    show_message("Save invalid!");
    
    scrRestartGame();
    
    exit;
}
