/* ----------------------------------------------------------------------------
Function: respawn_fnc_wave_setup

Description:
	Sets up the wave respawn script aka. "mission_respawn_type"
	Runs the respawn_fnc_wave_serverTimer
	Run only on the server
Parameters:
	none
Returns:
	nothing
Examples:
	call respawn_fnc_wave_setup;
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
if !(isServer) exitWith {};
// Code begins

// Set wave respawn script as the respawn script
missionNamespace setVariable ["mission_respawn_type",{call respawn_fnc_wave_onRespawn},true];

// add onRespawnUnit script
[[""],{call respawn_fnc_wave_onRespawnUnit},"onRespawnUnit",true] call respawn_fnc_scriptAdd;

// Start the server timer
call respawn_fnc_wave_serverTimer;