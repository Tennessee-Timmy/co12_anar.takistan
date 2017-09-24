// Just delete the parts you don't like/need
//
//
// =============================================================================



// =============================================================================
private _situation1 = "1.  SITUATION";
private _situationA = "
<font color='#FFFF00'>Enemy forces<br/></font color>
US Army goons. They are have air support and are well armed and trained
";
// =============================================================================
private _situationB = "<br/><br/>
<font color='#FFFF00'>Friendly Forces<br/></font color>
Allah's finest. We will bring victory to allah!<br/>
There are no other friendly units in the area.
";
// =============================================================================
private _situationC = "<br/><br/>
<font color='#FFFF00'>Attachments/Detachments<br/></font color>
1x Engineer/demolishion unit
";
// =============================================================================
private _situationD = "<br/><br/>
<font color='#FFFF00'>Civil/Terrain considerations<br/></font color>
Civilians are on our side. The US Army are keeping them hostage!
";
// =============================================================================
private _situation = [_situation1,_situationA,_situationB,_situationC,_situationD];
// =============================================================================



// =============================================================================
private _mission0 = "2.  MISSION";
// =============================================================================
private _missionA = "
Annihiliate US presence in the area around Anar
";
// =============================================================================
private _mission = [_mission0,_missionA];
// =============================================================================



// =============================================================================
private _execution0 = "3.  EXECUTION";
// =============================================================================
private _executionA = "
<font color='#FFFF00'>Commander's Intent<br/></font color>
Your Insurgent cell will ambush an ammo convoy, release some prisoners and
capture and hold a checkpoint. <br/>
Convoy ambush takes priorty over everything else, because we cannot let it reach
it's destination.
<br/>
You only need to release the prisoners if you need reinforcements.
";
// =============================================================================
private _executionB = "<br/><br/>
<font color='#FFFF00'>Maneuver Plan<br/></font color>
Up to Cell leader
";
// =============================================================================
private _executionC = "<br/><br/>
<font color='#FFFF00'>Tasks<br/></font color>
1. Ambush Convoy.<br/>
2. Capture and hold checkpoint.<br/>
3. OPTIONAL: Liberate Locals
";
// =============================================================================
private _execution = [_execution0,_executionA,_executionB,_executionC];
// =============================================================================



// =============================================================================
private _service0 = "4.  LOGISTICS/SUPPORT";
// =============================================================================
private _serviceA = "
<font color='#FFFF00'>General<br/></font color>
You can get extra supplies from Kakaru.
Extra vehicles: <br/>
1x UAZ(DshKM)
";
// =============================================================================
private _serviceB = "<br/><br/>
<font color='#FFFF00'>Transportation<br/></font color>
4x UAZ<br/>
1x URAL<br/>
";
// =============================================================================
private _serviceC = "<br/><br/>
<font color='#FFFF00'>Reinforcements<br/></font color>
Reinforcements are available on every task completion.<br/>
";
// =============================================================================
private _serviceD = "<br/><br/>
<font color='#FFFF00'>Evacuation<br/></font color>
-nothing in line-
";
// =============================================================================
private _serviceE = "<br/><br/>
<font color='#FFFF00'>Support<br/></font color>
-nothing in line-
";

// =============================================================================
private _service = [_service0,_serviceA,_serviceB,_serviceC,_serviceD,_serviceE];
// =============================================================================
/*
	Signal

	These are basic radio frequencies for units to use
*/
// =============================================================================
private _signal0 = "5.  SIGNAL";
// =============================================================================
private _signalA = "
<font color='#FFFF00'>Short-Range Radios<br/></font color>
<font color='#4169E1'>
Infantry:<br/>
</font color>
Freq. 150 - ZERO<br/>
Freq. 110 - Alpha<br/>
Freq. 120 - Bravo<br/>
Freq. 130 - Charlie<br/>
Freq. 140 - Delta<br/>
<font color='#4169E1'>
Assets:<br/>
</font color>
Freq. 160-169 - Vehicles<br/>
Freq. 170-179 - Air Vehicles<br/>
Freq. 180-189 - Support<br/>
";
// =============================================================================
private _signalB = "<br/>
<font color='#FFFF00'>Long-Range Radios<br/></font color>
Freq. 50 - Infantry<br/>
Freq. 51 - FAC / AIR<br/>
";
// =============================================================================
private _signal = [_signal0,_signalA,_signalB];
// =============================================================================

private _nil = {
	private _paragraph = _x;
	if (!isNil "_paragraph") then {
		_title = _paragraph deleteAt 0;
		_text = _paragraph joinString "";
		player createDiaryRecord ["Diary",[_title,_text]];
	};
	false
} count [_signal,_service,_execution,_mission,_situation];