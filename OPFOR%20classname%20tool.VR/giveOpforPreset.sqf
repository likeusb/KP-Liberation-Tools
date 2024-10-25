// Formats arrays to include certain things. Number to code: 34 is ", 44 is ",", 13 & 10 make a line break, 32 times 4 ends up being a standard indent. 
_militiaSquadF = (militiaSquadNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
_militiaVicF = (militiaVicNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

_opforVicLoInF = (opforVicLoInNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
_opforVicF = (opforVicNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

_opforBGLoInF = (opforBGLoInNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
_opforBGF = (opforBGNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

_opforHeloF = (opforHeloNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
_opforAirF = (opforAirNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

// Entire section here calculates which vehicles in the battlegroup arrays hold 8 or more people
_troopToCheck = [];

{
    if (_x in _troopToCheck) then {
    } else {
        _troopToCheck pushBack _x;
    };
} forEach opforBGLoInNF;

{
    if (_x in _troopToCheck) then {
    } else {
        _troopToCheck pushBack _x;
    };
} forEach opforBGNF;

_troopMT8 = [];

{
    _total = [_x, true] call BIS_fnc_crewCount;
    _crew = [_x, false] call BIS_fnc_crewCount;
    _pax = _total - _crew;

    if (_pax >= 8) then {
        _troopMT8 pushBack _x;
    };
} forEach _troopToCheck;

_troopTransports = (_troopMT8 joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

// Copies EVERYTHING to clipboard. 47 is a /, 42 is a *. Output of this can be put right into custom.sqf with no issues. This includes all the comments present in the original mission.sqf.
copyToClipboard (
'
' + toString [47, 42] + '
' + toString[32, 32, 32, 32] + 'Needed Mods:
' + toString[32, 32, 32, 32] + '- None

' + toString[32, 32, 32, 32] + 'Optional Mods:
' + toString[32, 32, 32, 32] + '- None
' + toString [42, 47] + '

' + toString [47, 47] + ' Enemy infantry classes
opfor_officer = "' + officer + '";
opfor_squad_leader = "' + squadLeader + '";
opfor_team_leader = "' + teamLeader + '";
opfor_sentry = "' + sentry + '";
opfor_rifleman = "' + rifleman + '";
opfor_rpg = "' + rpg + '";
opfor_grenadier = "' + grenadier + '";
opfor_machinegunner = "' + machinegunner + '";
opfor_heavygunner = "' + heavygunner + '";
opfor_marksman = "' + marksman + '";
opfor_sharpshooter = "' + sharpshooter + '";
opfor_sniper = "' + sniper + '";
opfor_at = "' + at + '";
opfor_aa = "' + aa + '";
opfor_medic = "' + medic + '";
opfor_engineer = "' + engineer + '";
opfor_paratrooper = "' + paratrooper + '";

' + toString [47, 47] + ' Enemy vehicles used by secondary objectives.
opfor_mrap = "' + mrap + '";
opfor_mrap_armed = "' + mrapArmed + '";
opfor_transport_helo = "' + transportHelo + '";
opfor_transport_truck = "' + transportTruck + '";
opfor_ammobox_transport = "' + ammoBoxTransport + '";
opfor_fuel_truck = "' + fuelTruck + '";
opfor_ammo_truck = "' + ammoTruck + '";
opfor_fuel_container = "' + fuelContainer + '";
opfor_ammo_container = "' + ammoContainer + '";
opfor_flag = [REPLACE THIS PART YOURSELF];

' + toString [47, 42] + ' Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. ' + toString [42, 47] + '

' + toString [47, 42] + ' Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. ' + toString [42, 47] + '

militia_squad = [
' + toString[32, 32, 32, 32] + '"' + _militiaSquadF + '"
];

' + toString [47, 47] + ' Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
' + toString[32, 32, 32, 32] + '"' + _militiaVicF + '"
];

' + toString [47, 47] + ' All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
' + toString[32, 32, 32, 32] + '"' + _opforVicF + '"
];

' + toString [47, 47] + ' All enemy vehicles that can spawn as sector defenders and patrols at low enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
' + toString[32, 32, 32, 32] + '"' + _opforVicLoInF + '"
];

' + toString [47, 47] + ' All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
' + toString[32, 32, 32, 32] + '"' + _opforBGF + '"
];

' + toString [47, 47] + ' All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at low enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
' + toString[32, 32, 32, 32] + '"' + _opforBGLoInF + '"
];

' + toString [47, 42] + " All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur." + toString [42, 47] + '
opfor_troup_transports = [
' + toString[32, 32, 32, 32] + '"' + _troopTransports + '"
];

' + toString [47, 47] + ' Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
' + toString[32, 32, 32, 32] + '"' + _opforHeloF + '"
];

' + toString [47, 47] + ' Enemy fixed-wings that will need to spawn in flight.
opfor_air = [
' + toString[32, 32, 32, 32] + '"' + _opforAirF + '"
];
');