/* ----------------------------------------------------------------------------
Function: respawn_fnc_timer_onRespawnUnit

Description:
	Remove a respawn live and reset wait time
Parameters:
	none
Returns:
	nothing
Examples:
	call respawn_fnc_timer_onRespawnUnit;
Author:
	nigel
---------------------------------------------------------------------------- */
#include "script_component.cpp"
// Code begins

// Get respawn deafult lives from missionNamespace if it's not defined, use the settings time
private _defaultLives = missionNamespace getVariable ["respawn_timerLives",RESPAWN_PARAM_TIMERLIVES];
private _lives = ["unit_respawn_timer_lives",_defaultLives] call seed_fnc_getVars;

// Remove a life and save
["unit_respawn_timer_lives",(_lives - 1)] call seed_fnc_setVars;

// Reset the waited time
["unit_respawn_timer_waited",nil] call seed_fnc_setVars;