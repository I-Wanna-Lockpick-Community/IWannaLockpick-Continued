///scrGateStep();
//GREATLY simplified combo door code

if !instance_exists(objPlayer){exit;}
var metRequirement = 1;//Whether the requirement for every lock has been met
for(var i = 0; i < lockCount; i += 1){
    if !canOpen(scrLockEffectiveColor(i),lock[i,1],lock[i,2],lock[i,3],0,lock[i,7],lock[i,7],lock[i,8],lock[i,9]){
        metRequirement = 0;
    }
}
if metRequirement{//Just turns solid or not
    solid = 0;
}else{
    if !solid{//doesn't collision check unless it's nonsolid
        if !place_meeting(x,y,objPlayer){//doesn't turn solid inside the player
            solid = 1;
        }
    }
}
