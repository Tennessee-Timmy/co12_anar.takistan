//POSTINIT
//
//
if !(mission_headless_controller) exitWith { };

//
// [[*spawn logic*,*patrol logic*],*spawn distance*,*patrol distance*,[*side*,*unitArray*],[*patrol buildings*,*stance*,*speed*],*outer spawn*,[*min*,*max*],*offencive*,*skill*,[*startCached*,*limit*,*disabled*],*wave_var*] call aiMaster_fnc_aiSpawnInf;
// [[*spawn logic*,*patrol logic*],*spawn distance*,*patrol distance*,[*side*,*unitArray*],[*only roads*,*stance*,*speed*,*trans*],*outer spawn*,*road spawn*,[*min*,*max*],*offencive*,*skill*,[*startCached*,*limit*,*disabled*],*wave_var*] call aiMaster_fnc_aiSpawnVeh;

town_1_air = false;
mission_task1_fail = false;
[] spawn {
	waitUntil {
		({_x distance town_1 < 100}count allPlayers) > 0
	};
	town_1_air = true;
};

[mid_3,200,1000,[west,2],[false,"AWARE","FULL"],false,[4,4],[true,false],1,[true,50,false,false,[1000,1400]],"mission_task1_fail"] call aiMaster_fnc_aiSpawnInf;
[mid_3,50,50,[west,2],[false,"SAFE","LIMITED"],false,[2,2],[true,false],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;


[convoy_1,100,150,[west,2],[false,"AWARE","FULL"],false,[2,2],[true,false],1,[true,50,false,false,[1500,2000]]] call aiMaster_fnc_aiSpawnInf;


// outskirts
[town_1,100,900,[west,3],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
// houses
[town_1,100,100,[west,3],[true,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
// nearby
[town_1,100,100,[west,3],[false,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
// attackers
[town_1,100,100,[west,2],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;

//town_2
// outskirts
[town_2,100,900,[west,3],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
// houses
[hostage_house,30,30,[west,3],[true,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[town_2,150,150,[west,3],[true,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
// nearby
[hostage_house,30,30,[west,3],[false,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
// Vehicle
[town_2,150,150,[west,1],[false,"AWARE","LIMITED",false],[false,[0,1]],false,[1,1],[true,false],1,[true,30,false,false]] call aiMaster_fnc_aiSpawnVeh;

//mid_1
[mid_1,100,100,[west,3],[true,"SAFE","LIMITED"],false,[1,1],[true,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
// nearby
[mid_1,100,100,[west,3],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;


//mid_2
[mid_2,30,30,[west,3],[true,"SAFE","LIMITED"],false,[1,1],[true,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
// nearby
[mid_2,30,30,[west,3],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;


[[town_3,town_1],500,150,[west,4],[true,"AWARE","FULL",true],[false,[0,1]],true,[3,3],[true,true],1,[true,20,false,false,[2500,3000]],"town_1_air"] call aiMaster_fnc_aiSpawnVeh;
[[town_3,town_1],500,150,[west,1],[true,"AWARE","FULL",false],[false,[0,1]],true,[1,1],[true,true],1,[true,20,false,false,[2500,3000]],"town_1_air"] call aiMaster_fnc_aiSpawnVeh;
[[town_3,town_1],500,1000,[west,10],[false,"AWARE","FULL",false],[false,[1,1]],false,[3,3],[true,true],1,[true,5,false,false,[2500,3000]],"town_1_air"] call aiMaster_fnc_aiSpawnVeh;
/*
//town_3
[town_3,150,150,[west,3],[true,"SAFE","LIMITED"],false,[2,3],[false,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[town_3,150,150,[west,2],[false,"SAFE","LIMITED"],false,[1,1],[false,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[town_3,150,150,[west,3],[false,"SAFE","LIMITED"],false,[2,3],[false,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[town_3,150,150,[west,3],[true,"AWARE","FULL",false],[false,[0,1]],true,[1,1],[false,false],1,[true,30,false,false]] call aiMaster_fnc_aiSpawnVeh;
//town_4
[town_4,50,50,[west,1],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;

//mid_1
[mid_1,150,150,[west,3],[false,"SAFE","LIMITED"],false,[1,1],[false,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[mid_1,150,150,[west,2],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
//mid_2
[mid_2,150,150,[west,2],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[mid_2,150,150,[west,2],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[mid_2,150,300,[west,4],[false,"AWARE","FULL",false],[false,[0,1]],false,[1,1],[true,false],1,[true,30,false,false]] call aiMaster_fnc_aiSpawnVeh;
//mid_3
[mid_3,50,50,[west,3],[true,"SAFE","LIMITED"],false,[1,1],[false,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[mid_3,50,50,[west,2],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
//mid_4
[mid_4,250,250,[west,3],[true,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[mid_4,250,250,[west,3],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
//
[[heli_1,attack_1],500,150,[west,10],[false,"AWARE","FULL",false],[false,[1,2]],false,[2,2],[true,false],1,[true,2,false,false,[2000,2500]],"air_1","nig_blufor_air"] call aiMaster_fnc_aiSpawnVeh;
[[heli_1,attack_2],500,150,[west,10],[false,"AWARE","FULL",false],[false,[1,2]],false,[1,1],[true,false],1,[true,1,false,false,[2500,3000]],"air_2","nig_blufor_air"] call aiMaster_fnc_aiSpawnVeh;
[[heli_1,attack_3],500,150,[west,10],[false,"AWARE","FULL",false],[false,[1,2]],false,[1,1],[true,false],1,[true,3,false,false,[2500,3000]],"air_2","nig_blufor_air"] call aiMaster_fnc_aiSpawnVeh;
[[heli_1,attack_4],500,150,[west,10],[false,"AWARE","FULL",false],[false,[1,1]],false,[1,1],[true,false],1,[true,4,false,false,[2500,3000]],"air_3","nig_blufor_air"] call aiMaster_fnc_aiSpawnVeh;
[[heli_1,attack_5],500,150,[west,10],[false,"AWARE","FULL",false],[false,[1,2]],false,[1,1],[true,false],1,[true,5,false,false,[2500,3000]],"air_3","nig_blufor_air"] call aiMaster_fnc_aiSpawnVeh;
//
[[heli_1,attack_1],500,500,[west,12],[false,"AWARE","FULL",false],[false,[2,2]],false,[2,2],[true,false],1,[true,5,false,false,[2500,3000]],"grad_gone","nig_blufor_air2"] call aiMaster_fnc_aiSpawnVeh;
[[heli_1,attack_1],500,1000,[west,11],[false,"AWARE","FULL",false],[false,[0,1]],false,[1,1],[true,false],1,[true,5,false,false,[2500,3000]],"grad_gone","nig_blufor_air3"] call aiMaster_fnc_aiSpawnVeh;
*/
/*
[[blufor_1,trench_1],500,1500,[west,10],[false,"AWARE","FULL",false],[false,[2,1]],false,[3,3],[true,false],1,[true,5,false,false,[2000,2500]],"nig_blufor_attack","nig_blufor_vehicles"] call aiMaster_fnc_aiSpawnVeh;
//mid
[mid_1,250,250,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[mid_2,250,250,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
[mid_3,250,250,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;
//trench_1
[trench_1,250,250,[east,1],[false,"SAFE","LIMITED"],false,[3,3],[true,false],1,[true,50,false,false,[1000,1200]]] call aiMaster_fnc_aiSpawnInf;

//btr
[[trench_1,trench_1],500,1250,[east,3],[false,"SAFE","FULL",false],[false,[0,1]],false,[3,3],[true,false],0.5,[true,50,false,false,[1750,2000]],nil,nil] call aiMaster_fnc_aiSpawnVeh;
//t55
[[trench_1,trench_1],500,1000,[east,5],[false,"SAFE","FULL",false],[false,[0,1]],false,[3,3],[true,false],0.5,[true,50,false,false,[1750,2000]],nil,nil] call aiMaster_fnc_aiSpawnVeh;

//nig_radar
[nig_radar,50,50,[east,3],[true,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[nig_radar,50,50,[east,3],[false,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
//base_1
[base_1,100,100,[east,3],[true,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[base_1,100,100,[east,3],[false,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[base_1,100,100,[east,1],[false,"SAFE","LIMITED"],false,[2,2],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
//atack
[[town_1,base_1],250,500,[east,1],[false,"AWARE","FULL"],false,[10,10],[true,false],1,[true,3,false,false]] call aiMaster_fnc_aiSpawnInf;

//bmp2
[[town_2,base_1],750,500,[east,1],[false,"AWARE","FULL",false],[false,[1,1]],false,[5,5],[true,false],0.7,[true,3],"base_1_attack","base_1_attack_inf"] call aiMaster_fnc_aiSpawnVeh;
[[town_2,base_1],750,500,[east,3],[true,"AWARE","FULL",false],[false,[1,2]],true,[5,5],[true,false],0.7,[true,3],"base_1_attack","base_1_attack_inf"] call aiMaster_fnc_aiSpawnVeh;
[[town_2,base_1],750,500,[east,1],[false,"AWARE","FULL"],false,[10,10],[true,false],1,[true,2,false,false],"base_1_attack","base_1_attack_inf"] call aiMaster_fnc_aiSpawnInf;
//t72
[[town_1,base_1],250,500,[east,6],[false,"AWARE","FULL",false],[false,[0,1]],false,[10,10],[true,false],0.7,[true,3],"base_1_attack","base_1_attack_veh"] call aiMaster_fnc_aiSpawnVeh;
[[town_1,base_1],250,500,[east,4],[false,"AWARE","FULL",false],[false,[0,1]],false,[10,10],[true,false],0.7,[true,3],"base_1_attack","base_1_attack_veh"] call aiMaster_fnc_aiSpawnVeh;

//town_3
[[town_3,base_1],250,500,[east,11],[false,"AWARE","FULL",false],[false,[2,3]],false,[5,5],[true,false],1,[true,1],"base_1_attack","base_1_attack_air"] call aiMaster_fnc_aiSpawnVeh;
[[town_3,base_1],250,250,[east,12],[false,"AWARE","FULL",false],[false,[3,3]],false,[5,5],[true,false],1,[true,2],"base_1_attack","base_1_attack_air"] call aiMaster_fnc_aiSpawnVeh;
*/
/*
//town_1
[town_1,50,50,[east,1],[true,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_1,50,50,[east,3],[false,"SAFE","LIMITED"],false,[5,5],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;

[town_1,100,150,[east,3],[true,"SAFE","LIMITED"],false,[6,6],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_1,250,350,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_1,250,350,[east,2],[false,"SAFE","LIMITED"],false,[2,2],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_1,250,500,[east,3],[true,"SAFE","FULL",false],false,true,[1,1],[true,false],1,[true,12]] call aiMaster_fnc_aiSpawnVeh;


[mid_2,50,50,[east,1],[false,"SAFE","NORMAL"],false,[1,1],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid_2,250,250,[east,1],[false,"SAFE","NORMAL"],false,[1,1],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;

//town_2
[town_2,30,30,[east,1],[true,"SAFE","LIMITED"],false,[1,1],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,30,30,[east,2],[true,"SAFE","LIMITED"],false,[1,1],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,30,30,[east,3],[false,"SAFE","LIMITED"],false,[4,4],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;

[town_2,250,250,[east,2],[true,"SAFE","LIMITED"],false,[5,5],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,250,250,[east,3],[true,"SAFE","LIMITED"],false,[5,5],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,500,500,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,500,500,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,500,500,[east,3],[false,"SAFE","LIMITED"],false,[5,5],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;


[mid_1,50,50,[east,2],[true,"SAFE","NORMAL"],false,[4,4],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid_1,50,50,[east,2],[false,"SAFE","NORMAL"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid_1,250,250,[east,3],[false,"SAFE","NORMAL"],true,[4,4],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;

[mid_4,50,75,[east,1],[true,"SAFE","NORMAL"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid_4,100,250,[east,1],[false,"SAFE","NORMAL"],false,[2,2],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid_4,250,1500,[east,2],[true,"SAFE","LIMITED",false],false,true,[2,2],[true,false],1,[true,12]] call aiMaster_fnc_aiSpawnVeh;



//town_3
[town_3,30,30,[east,1],[true,"SAFE","LIMITED"],false,[1,1],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_3,30,30,[east,3],[false,"SAFE","LIMITED"],false,[4,4],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_3,100,100,[east,2],[true,"SAFE","LIMITED"],false,[1,1],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_3,100,100,[east,3],[false,"SAFE","LIMITED"],true,[4,4],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;


[mid_3,100,500,[east,1],[false,"SAFE","NORMAL"],false,[2,2],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid_3,100,500,[east,1],[false,"SAFE","NORMAL"],false,[1,1],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;

//town_4
[town_4,250,250,[east,3],[true,"SAFE","LIMITED"],false,[4,4],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_4,250,250,[east,2],[false,"SAFE","NORMAL"],false,[1,1],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_4,250,250,[east,3],[false,"SAFE","NORMAL"],true,[4,4],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_4,500,1000,[east,2],[true,"SAFE","LIMITED",false],false,true,[3,3],[true,false],1,[true,12]] call aiMaster_fnc_aiSpawnVeh;*/
/*
[mid_1,50,750,[east,1],[false,"SAFE","NORMAL"],false,[2,2],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;

[mid_2,50,50,[east,1],[true,"SAFE","NORMAL"],false,[1,1],[false,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;

[mid_2,350,350,[east,1],[false,"SAFE","NORMAL"],false,[1,1],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;

//town_1
[town_1,500,250,[east,2],[true,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_1,500,250,[east,3],[true,"SAFE","LIMITED"],false,[3,3],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_1,500,350,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_1,500,350,[east,2],[false,"SAFE","LIMITED"],false,[2,2],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,250,500,[east,2],[false,"AWARE","FULL",false],false,false,[1,1],[true,false],1,[true,12]] call aiMaster_fnc_aiSpawnVeh;

//town_2
[town_2,250,250,[east,2],[true,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,250,250,[east,3],[true,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,250,250,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,500,500,[east,3],[false,"SAFE","LIMITED"],false,[6,6],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_2,250,500,[east,6],[false,"AWARE","FULL",false],false,false,[1,1],[true,false],1,[true,20]] call aiMaster_fnc_aiSpawnVeh;

[[town_3,town_2],250,250,[east,1],[false,"AWARE","NORMAL"],false,[5,5],[true,true],1,[false,50,false,false],"attack_town_2"] call aiMaster_fnc_aiSpawnInf;
[[town_3,town_2],250,500,[east,2],[false,"AWARE","FULL",false],false,false,[1,1],[true,false],1,[true,2],"attack_town_2","attack_town_2_vehicles"] call aiMaster_fnc_aiSpawnVeh;
[[town_3,town_2],250,500,[east,1],[false,"AWARE","FULL",true],false,false,[1,1],[true,false],1,[true,4],"attack_town_2","attack_town_2_vehicles"] call aiMaster_fnc_aiSpawnVeh;
[[town_3,town_2],250,500,[east,4],[false,"AWARE","FULL",false],false,false,[1,1],[true,false],1,[true,2],"attack_town_2","attack_town_2_vehicles"] call aiMaster_fnc_aiSpawnVeh;
[[town_3,town_2],250,500,[east,5],[false,"AWARE","FULL",false],false,false,[1,1],[true,false],1,[true,2],"attack_town_2","attack_town_2_vehicles"] call aiMaster_fnc_aiSpawnVeh;
[town_3,100,100,[east,2],[true,"SAFE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_3,100,100,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_3,500,2000,[east,5],[true,"AWARE","FULL",false],false,true,[1,1],[true,false],1,[true,20]] call aiMaster_fnc_aiSpawnVeh;


//town_4
[town_4,250,250,[east,2],[true,"AWARE","LIMITED"],false,[2,2],[false,false],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_4,250,250,[east,3],[true,"AWARE","LIMITED"],false,[3,3],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_4,250,250,[east,1],[false,"AWARE","LIMITED"],false,[1,1],[true,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_4,250,250,[east,1],[false,"AWARE","LIMITED"],false,[1,1],[true,true],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_4,250,250,[east,1],[false,"AWARE","LIMITED"],false,[1,1],[true,true],1,[true,60,false,false],nil,nil,true] call aiMaster_fnc_aiSpawnInf;
[town_4,500,500,[east,3],[false,"AWARE","LIMITED"],false,[3,3],[true,true],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[town_4,250,250,[east,2],[false,"AWARE","SLOW",false],false,true,[1,1],[false,false],1,[true,28]] call aiMaster_fnc_aiSpawnVeh;

[grad_1,50,50,[east,3],[true,"AWARE","LIMITED"],false,[2,2],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[grad_1,50,50,[east,1],[true,"AWARE","LIMITED"],false,[1,1],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[grad_1,50,50,[east,3],[false,"AWARE","LIMITED"],false,[3,3],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;

[grad_2,50,50,[east,1],[true,"AWARE","LIMITED"],false,[1,1],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[grad_2,75,75,[east,1],[false,"AWARE","LIMITED"],false,[2,2],[true,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;


//city_1
[city_1,50,50,[east,1],[true,"AWARE","LIMITED"],false,[1,1],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_1,100,100,[east,3],[true,"AWARE","LIMITED"],true,[5,5],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_1,100,100,[east,1],[false,"AWARE","LIMITED"],false,[1,1],[true,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_1,100,100,[east,1],[false,"AWARE","LIMITED"],false,[1,1],[true,true],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_1,100,100,[east,2],[false,"AWARE","LIMITED"],false,[1,1],[false,true],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
//city_2
[city_2,50,50,[east,2],[true,"AWARE","LIMITED"],false,[2,2],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_2,100,100,[east,2],[false,"AWARE","LIMITED"],false,[2,2],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_2,100,100,[east,2],[false,"AWARE","LIMITED"],false,[2,2],[true,true],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_2,250,250,[east,2],[false,"AWARE","LIMITED"],false,[6,6],[true,true],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_2,750,750,[east,3],[false,"AWARE","FULL",false],false,false,[1,1],[true,false],1,[true,20]] call aiMaster_fnc_aiSpawnVeh;
[city_2,750,750,[east,2],[false,"AWARE","FULL",false],false,false,[1,1],[true,false],1,[true,20]] call aiMaster_fnc_aiSpawnVeh;
//city_3
[city_3,50,50,[east,2],[true,"AWARE","LIMITED"],false,[3,3],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_3,125,125,[east,3],[false,"AWARE","LIMITED"],false,[5,5],[false,false],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;
[city_3,125,125,[east,3],[false,"AWARE","LIMITED"],false,[5,5],[false,true],1,[true,60,false,false]] call aiMaster_fnc_aiSpawnInf;



[town_5,250,250,[east,3],[false,"AWARE","LIMITED",false],false,true,[1,1],[false,false],1,[true,28]] call aiMaster_fnc_aiSpawnVeh;
[town_5,250,250,[east,6],[false,"AWARE","LIMITED",false],false,true,[1,1],[false,false],1,[true,28]] call aiMaster_fnc_aiSpawnVeh;
[town_5,250,250,[east,4],[false,"AWARE","LIMITED",false],false,true,[1,2],[true,false],1,[true,38]] call aiMaster_fnc_aiSpawnVeh;
[town_5,250,250,[east,5],[false,"AWARE","LIMITED",false],false,true,[1,1],[true,false],1,[true,38]] call aiMaster_fnc_aiSpawnVeh;
*/

/*
//town4
[town4,250,250,[east,2],[true,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town4,350,350,[east,3],[true,"SAFE","LIMITED"],false,[3,3],[false,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town4,400,400,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[town4,500,500,[east,2],[false,"SAFE","LIMITED"],false,[2,2],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
//[siege1,hvt]
[[siege1,hvt],350,100,[east,1],[false,"AWARE","LIMITED"],false,[1,1],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
[siege1,350,350,[east,2],[false,"AWARE","LIMITED"],false,[3,3],[true,true],1,[true,50,false,false]] call aiMaster_fnc_aiSpawnInf;
*/
/*
//mid
[mid1,50,50,[east,1],[false,"SAFE","LIMITED"],false,[1,1],[true,true],1,[true,10,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid1,50,50,[east,3],[true,"SAFE","LIMITED"],true,[2,2],[false,true],1,[true,10,false,false]] call aiMaster_fnc_aiSpawnInf;
//
[mid4,50,50,[east,2],[false,"SAFE","FULL"],false,[2,2],[true,true],1,[true,10,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid4,250,250,[east,2],[false,"SAFE","FULL"],false,[2,2],[true,true],1,[true,10,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid4,50,50,[east,3],[true,"SAFE","FULL"],true,[2,2],[false,true],1,[true,10,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid4,250,250,[east,4],[true,"AWARE","FULL",false],false,true,[1,1],[true,true],1,[true,4]] call aiMaster_fnc_aiSpawnVeh;
//
[mid2,50,50,[east,3],[false,"SAFE","LIMITED"],false,[2,2],[true,true],1,[true,15,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid2,50,50,[east,3],[true,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,15,false,false]] call aiMaster_fnc_aiSpawnInf;
[mid2,250,250,[east,1],[false,"SAFE","LIMITED"],false,[3,3],[true,true],1,[true,15,false,false]] call aiMaster_fnc_aiSpawnInf;
//
[mid3,50,50,[east,2],[false,"SAFE","LIMITED"],false,[2,2],[true,true],1,[true,10,false,false]] call aiMaster_fnc_aiSpawnInf;
//
[mid5,50,50,[east,2],[true,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,10,false,false]] call aiMaster_fnc_aiSpawnInf;
//ugv
[[attack5,target1],50,50,[east,4],[false,"COMBAT","FULL"],false,[2,2],[true,false],1,[false,3,false,false],"attack_ugv","attacking_inf"] call aiMaster_fnc_aiSpawnInf;
[[attack1,target1],150,50,[east,3],[false,"AWARE","FULL"],false,[9,9],[true,true],1,[true,2,false,false],"attack_ugv","attacking_inf4"] call aiMaster_fnc_aiSpawnInf;
[[attack1,target1],150,100,[east,1],[false,"AWARE","NORMAL"],false,[6,6],[true,true],1,[true,1,false,false],"attack_ugv","attacking_inf"] call aiMaster_fnc_aiSpawnInf;
[[attack1,target1],100,50,[east,5],[false,"AWARE","NORMAL"],false,[8,8],[true,true],1,[true,2,false,false],"attack_ugv","attacking_inf2"] call aiMaster_fnc_aiSpawnInf;
[[attack3,target1],150,50,[east,4],[false,"AWARE","FULL"],false,[9,9],[true,true],1,[true,3,false,false],"attack_ugv","attacking_inf3"] call aiMaster_fnc_aiSpawnInf;
[[attack2,target1],100,50,[east,4],[true,"AWARE","FULL",false],false,true,[7,7],[true,true],1,[true,1],"attack_ugv","attacking_Veh"] call aiMaster_fnc_aiSpawnVeh;
//cache
_caches = [cache_1,cache_2,cache_3,cache_4,cache_5,cache_6,cache_7,cache_8,cache_9,cache_10,cache_11,cache_12,cache_13];
_cache =  selectRandom _caches;
cache = _cache;
{if !(_x isEqualTo cache) then {deleteVehicle _x;}}count _caches;
publicVariable "cache";
_group = createGroup sideLogic;
town1 = _group createUnit ["LOGIC",(getpos cache) , [], 0, ""];
//
[town1,50,50,[east,3],[false,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,26,false,false]] call aiMaster_fnc_aiSpawnInf;
[town1,50,50,[east,2],[false,"SAFE","LIMITED"],false,[3,3],[false,true],1,[true,26,false,false]] call aiMaster_fnc_aiSpawnInf;
[town1,50,50,[east,2],[true,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,26,false,false]] call aiMaster_fnc_aiSpawnInf;
[town1,100,100,[east,3],[true,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,26,false,false]] call aiMaster_fnc_aiSpawnInf;
//
[town1,250,250,[east,3],[true,"SAFE","LIMITED"],false,[5,5],[false,true],1,[true,26,false,false]] call aiMaster_fnc_aiSpawnInf;
[town1,250,250,[east,2],[true,"SAFE","LIMITED"],false,[2,2],[false,true],1,[true,26,false,false]] call aiMaster_fnc_aiSpawnInf;
[town1,250,250,[east,3],[false,"SAFE","LIMITED"],false,[2,2],[true,true],1,[true,26,false,false]] call aiMaster_fnc_aiSpawnInf;
[town1,250,250,[east,1],[false,"SAFE","LIMITED"],false,[2,2],[true,true],1,[true,26,false,false],"last_task"] call aiMaster_fnc_aiSpawnInf;
[town1,750,750,[east,3],[false,"COMBAT","NORMAL"],false,[5,5],[true,true],1,[true,26,false,false],"last_task"] call aiMaster_fnc_aiSpawnInf;
[town1,500,500,[east,2],[true,"AWARE","FULL",false],false,true,[1,1],[true,true],1,[true,5],"last_task"] call aiMaster_fnc_aiSpawnVeh;
*/
