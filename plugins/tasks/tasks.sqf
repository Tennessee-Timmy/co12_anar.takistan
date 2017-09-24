/* ----------------------------------------------------------------------------
tasks.sqf

Description:
	Add your tasks to this file.
	for more in-depth info read the header of fn_add.sqf in "files\fnc\"

	Mission will end once ALL primary and secondary tasks are complete. The winners will be automatic (TASKS_SETTINGS_ENDING_SIDES_AUTO) or "mission_tasks_winSides" or "mission_tasks_winPlayers"
		To also make the player win, add player to "mission_tasks_winPlayers"
	Mission will fail if a primary task is failed/cancled, winners will be everyone who the failed task was not assigned to.

	If target of the task is a group or a player, make it into string

Examples:
	// simple task, that will need to be ended manually (admin or zeus)
	["ind_task1",[west,[],["Do this task.","DO","domarker"]]] call tasks_fnc_add;
	// Add more complex task
	[
		"ind_task1",	//unique taskID
		[
			west,	// target (side,unit,group)
			[],		// parent taskID
			["Liberate the town by any means.","LIBERATE TOWN"],		// description
			town_3,		//location or object
			"Attack",	//https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul#Default_Task_Types:_Actions
			"CREATED"
		],
		1,			// priority (1 - critical; 2 - secondary 3 - optional)
		[{true},{false},{false}],	//{condition to add},{condition to win},{condition to lose}
		[{},{},{}]				//{code on add},{code on win},{code on lose}
	] call tasks_fnc_add;

	To update a task state mid mission:
		// set ind_task1 as canceled
		["ind_task1","CANCELED"] remoteExec ["tasks_fnc_update",2];

	Possible states: "CREATED","SUCCEEDED","FAILED","CANCELED"
	MORE in fn_update.sqf

Author:
	nigel
---------------------------------------------------------------------------- */
#include "files\script_component.cpp"
// Script begins
/*
// ----------------------------------------- TASK1 -----------------------------------------
// id
private _taskID = "ind_task1";
// task info
private _task = [
	west,	// target (side,unit,group)
	[],		// parent taskID
	["Liberate the town by any means.","LIBERATE TOWN"],		// description
	town_3,		//location or object
	"Attack",	//https://community.bistudio.com/wiki/Arma_3_Tasks_Overhaul#Default_Task_Types:_Actions
	"CREATED"
];

// conditions
private _conditions = [
	{true},		// condition to add the task
	{({(side _x isEqualTo east) && {(_x distanceSqr town_3) < 10000}} count allUnits) < 5false},	// condition to succeed the task
	{!isNil "task1_fail"}		// condition to fail the task
];

// code to run
private _code = [
	{},		// code to run when task is added
	{
		missionNamespace setVariable ["mission_task1_complete",true,true];	// set a variable for the 2nd task
	},		// code to run when task is succeeded
	{}		// code to run when task is failed
];

// Assemble the array and add the task
[
	_taskID,		// unique taskID
	_task,			// task info
	2,				// priority (1 critical/primary - [can't be failed],secondary - [can be failed],optional - [does not have to be completed])
	_conditions,	// conditions
	_code			// code to run
] call tasks_fnc_add;

// --------------------------------------- TASK1 END ---------------------------------------


// ----------------------------------------- TASK2 -----------------------------------------
// id
private _taskID = "ind_task2";
// task info
private _task = [
	west,	// target (side,unit or group)
	["ind_task1"],		// this task is a child to first task
	["Defend this town at all costs.","DEFEND TOWN"],		// description
	town_3,
	"Defend",
	"CREATED"
];

// conditions
private _conditions = [
	{
		!isNil "mission_task1_complete" && {mission_task1_complete}		// Task will only be added when mission_task1_complete is true
	},
	{false},	// This task will never autocomplete (completes in code below)
	{false}		// This task will never autofail
];

// code to run
private _code = [
	{
		[] spawn {
			sleep 10;		// after 60 seconds the task will be canceled
			["ind_task2","CANCELED"] remoteExec ["tasks_fnc_update",2];

		};
	},
	{missionNamespace setVariable ["mission_task2_complete",true,true];},
	{missionNamespace setVariable ["mission_task2_complete",true,true];}
];

// Assemble the array and add the task
[_taskID,_task,2,_conditions,_code] call tasks_fnc_add;

// --------------------------------------- TASK2 END ---------------------------------------

// ----------------------------------------- TASK3 -----------------------------------------
[

// Unique task id
"ind_task3",
[

// target (side,unit,group)
west,
[

// Task parent
"ind_task2"
],
[

// Description
"You've been overwhelmed, retreat.",

// Title
"RETREAT!"
],

// Task destination
town_3,

// Task Icon
"Defend",

// Task state on creation
"CREATED"
],

// Priority
1,
[{

// Condition to add the task
!isNil "mission_task2_complete" && {mission_task2_complete}		// Task will only be added when mission_task1_complete is true
},{

// Condition to complete
private _aliveList = ALIVELIST;		// list of alive players
private _awayCount = {_x distance town_3 > 300}count _aliveList;	//count units that are 300m from the town_3
((count _aliveList) isEqualTo _awayCount)		// Compare amount of alive units to the amount of units away from
},{

// Condition to fail the task
false
}]] call tasks_fnc_add;

// --------------------------------------- TASK3 END ---------------------------------------



//--- TASK4 ---
// This task will not auto-complete.
// It can only be set as complete by zeus/admin
// Only ind_0_1 will recieve this task (commander)
["ind_task4",["ind_0_1",[],["Tell a hilarious, funny joke!","Optional: TELL A JOKE"]],3] call tasks_fnc_add;
//--- TASK4 END ---
*/
// quick 'n dirty
["ind_task1",[resistance,[],
["There's a supply convoy coming. They will finish loading up supplies in 10 minutes. Ambush it and destroy the convoy!",
"DESTROY SUPPLIES"],
truck1,"destroy"],
2,
[
	{true},{
		isNil "truck1" || {!alive truck1}
	},{
		!isNil "truck1" && {alive truck1 && {truck1 distance mid_3 < 300}}
	}
],
[{},{
	[] spawn {
		[] call respawn_fnc_respawn;
		sleep 5;
		[] call respawn_fnc_respawn;
	};
},{}]
] call tasks_fnc_add;

//

["ind_task2",[resistance,[],
["Some local fighters are being held hostage at Kakaru, liberate them from their captors!",
"OPTIONAL: LIBERATE LOCALS"],
"marker_17","meet"],
3,
// cond
[{true},{
	({_x distanceSqr hostage_house < 100}count units group_locals) isEqualTo 0
},{{alive _x}count units group_locals isEqualTo 0}],
// code
[{},{
	[] spawn {
		missionNamespace setVariable ["mission_respawn_base_location_west",hostage_house,true];
		[] call respawn_fnc_respawn;
		sleep 5;
		[] call respawn_fnc_respawn;
		sleep 5;
		missionNamespace setVariable ["mission_respawn_base_location_west",base_ind_1,true];
	};

},{}]
] call tasks_fnc_add;

//

["ind_task3",[resistance,[],
["Capture the checkpoint near Feruz Abad. Leave no survivors!",
"CAPTURE CHECKPOINT"],
"marker_18","attack"],
1,
[{true},{
	(({(_x distanceSqr town_1) < 10000} count allPlayers) > 0) &&
	{({((side _x) isEqualTo west) && {(_x distanceSqr town_1) < 10000}}count allUnits < 2)}
},{
	(time > 10 && {ALIVELIST isEqualTo []})
}],
[{},{
	[] spawn {
		missionNamespace setVariable ["mission_respawn_base_location_west",town_1,true];
		[] call respawn_fnc_respawn;
		sleep 5;
		[] call respawn_fnc_respawn;
		sleep 5;
		missionNamespace setVariable ["mission_respawn_base_location_west",base_ind_1,true];
	};
	missionNamespace setVariable ["task3_complete",time,true];

},{}]
] call tasks_fnc_add;

//

["ind_task4",[resistance,[],
["Dig in, keep this place secure for 15 minutes.",
"DEFEND CHECKPOINT"],
"marker_18","defend"],
1,
[{!isNil "task3_complete"},{
	_time = missionNamespace getVariable ["task3_complete",time];
	if (time - _time >= 600) then {
		({_x distance town_1 < 100}count allPlayers > 0) &&
		({(side _x isEqualTo west) && (_x distance town_1 < 200)}count allUnits < 5)
	} else {
		false
	};
},{false}],
[{},{},{}]
] call tasks_fnc_add;