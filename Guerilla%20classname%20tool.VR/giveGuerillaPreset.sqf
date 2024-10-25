// _opforAirF = (opforAirNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
guerInitF = (guerInitNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
guerVicF = (guerVicNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

// Defined and filled in later by the stupid forEach loops
T1WNF = [];
T2WNF = [];
T3WNF = [];

// Format: T(n) - Tier n, W - Weapon, U - Uniform, V - Vest, H - Headgear, F - Facewear

T1UF = (Tier1U joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
T2UF = (Tier2U joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
T3UF = (Tier3U joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

T1VF = (Tier1V joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
T2VF = (Tier2V joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
T3VF = (Tier3V joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

T1HF = (Tier1H joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
T2HF = (Tier2H joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);
T3HF = (Tier3H joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

T23FF = (faceGearUNF joinString toString [34, 44, 13, 10, 32, 32, 32, 32, 34]);

{
    _tempHold = [];
    // Weapon classname
    _tempHold set [0, (((getUnitLoadout _x) select 0) select 0)];
    // Magazine classname
    _tempHold set [1, ((((getUnitLoadout _x) select 0) select 4) select 0)];
    // Optic classname
    _tempHold set [3, (((getUnitLoadout _x) select 0) select 3)];
    // Bipod classname
    _tempHold set [4, (((getUnitLoadout _x) select 0) select 6)];

    // Dumb stupid overly complicated code to get amount of mags
    _tempHoldMag = [];
    _tempHoldMagU = currentMagazineDetail _x;
    {
        if ((_x regexReplace ["\(\d+/\d+\)\[id/cr:\d+/\d*]", ""]) == (_tempHoldMagU regexReplace ["\(\d+/\d+\)\[id/cr:\d+/\d*]", ""])) then {
            _tempHoldMag pushBack _x;
        };
    } forEach (magazinesDetail _x);

    _tempHold set [2, count _tempHoldMag];

    T1WNF pushBack _tempHold; 
} forEach Tier1W;

{
    _tempHold = [];
    // Weapon classname
    _tempHold set [0, (((getUnitLoadout _x) select 0) select 0)];
    // Magazine classname
    _tempHold set [1, ((((getUnitLoadout _x) select 0) select 4) select 0)];
    // Optic classname
    _tempHold set [3, (((getUnitLoadout _x) select 0) select 3)];
    // Bipod classname
    _tempHold set [4, (((getUnitLoadout _x) select 0) select 6)];

    // Dumb stupid overly complicated code to get amount of mags
    _tempHoldMag = [];
    _tempHoldMagU = currentMagazineDetail _x;
    {
        if ((_x regexReplace ["\(\d+/\d+\)\[id/cr:\d+/\d*]", ""]) == (_tempHoldMagU regexReplace ["\(\d+/\d+\)\[id/cr:\d+/\d*]", ""])) then {
            _tempHoldMag pushBack _x;
        };
    } forEach (magazinesDetail _x);

    _tempHold set [2, count _tempHoldMag];

    T2WNF pushBack _tempHold; 
} forEach Tier2W;

{
    _tempHold = [];
    // Weapon classname
    _tempHold set [0, (((getUnitLoadout _x) select 0) select 0)];
    // Magazine classname
    _tempHold set [1, ((((getUnitLoadout _x) select 0) select 4) select 0)];
    // Optic classname
    _tempHold set [3, (((getUnitLoadout _x) select 0) select 3)];
    // Bipod classname
    _tempHold set [4, (((getUnitLoadout _x) select 0) select 6)];

    // Dumb stupid overly complicated code to get amount of mags
    _tempHoldMag = [];
    _tempHoldMagU = currentMagazineDetail _x;
    {
        if ((_x regexReplace ["\(\d+/\d+\)\[id/cr:\d+/\d*]", ""]) == (_tempHoldMagU regexReplace ["\(\d+/\d+\)\[id/cr:\d+/\d*]", ""])) then {
            _tempHoldMag pushBack _x;
        };
    } forEach (magazinesDetail _x);

    _tempHold set [2, count _tempHoldMag];

    T3WNF pushBack _tempHold; 
} forEach Tier3W;

T1WF = (T1WNF joinString toString [44, 13, 10, 32, 32, 32, 32]);
T2WF = (T2WNF joinString toString [44, 13, 10, 32, 32, 32, 32]);
T3WF = (T3WNF joinString toString [44, 13, 10, 32, 32, 32, 32]);

copyToClipboard (
'
' + toString [47, 42] + '
' + toString[32, 32, 32, 32] + 'Needed Mods:
' + toString[32, 32, 32, 32] + '- None

' + toString[32, 32, 32, 32] + 'Optional Mods:
' + toString[32, 32, 32, 32] + '- None
' + toString [42, 47] + '

' + toString [47, 42] + 'Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Standard loadout of the units will be replaced with a scripted one, which depends on the guerilla strength, after spawn ' + toString [42, 47] + '
KP_liberation_guerilla_units = [
' + toString[32, 32, 32, 32] + '"' + guerInitF + '"
];

' + toString [47, 47] + ' Armed vehicles
KP_liberation_guerilla_vehicles = [
' + toString[32, 32, 32, 32] + '"' + guerVicF + '"
];

' + toString [47, 42] + " Guerilla Equipment
There are 3 tiers for every category. If the strength of the guerillas will increase, they'll have higher tier equipment. " + toString [42, 47] + '

' + toString [47, 42] + " Weapons - You've to add the weapons as array like" + ' 
["Weaponclassname","Magazineclassname","magazine amount","optic","tripod"] ' + "
" + toString [42, 47] + '
KP_liberation_guerilla_weapons_1 = [
' + toString[32, 32, 32, 32] + '' + T1WF + '
];

KP_liberation_guerilla_weapons_2 = [
' + toString[32, 32, 32, 32] + '' + T2WF + '
];

KP_liberation_guerilla_weapons_3 = [
' + toString[32, 32, 32, 32] + '' + T3WF + '
];

' + toString [47, 47] + ' Uniforms 
KP_liberation_guerilla_uniforms_1 = [
' + toString[32, 32, 32, 32] + '"' + T1UF + '"
];

KP_liberation_guerilla_uniforms_2 = [
' + toString[32, 32, 32, 32] + '"' + T2UF + '"
];

KP_liberation_guerilla_uniforms_3 = [
' + toString[32, 32, 32, 32] + '"' + T3UF + '"
];

' + toString [47, 47] + ' Vests
KP_liberation_guerilla_vests_1 = [
' + toString[32, 32, 32, 32] + '"' + T1VF + '"
];

KP_liberation_guerilla_vests_2 = [
' + toString[32, 32, 32, 32] + '"' + T2VF + '"
];

KP_liberation_guerilla_vests_3 = [
' + toString[32, 32, 32, 32] + '"' + T3VF + '"
];

' + toString [47, 47] + ' Headgear
KP_liberation_guerilla_headgear_1 = [
' + toString[32, 32, 32, 32] + '"' + T1HF + '"
];

KP_liberation_guerilla_headgear_2 = [
' + toString[32, 32, 32, 32] + '"' + T2HF + '"
];

KP_liberation_guerilla_headgear_3 = [
' + toString[32, 32, 32, 32] + '"' + T3HF + '"
];

' + toString [47, 47] + ' Facegear. Applies for tier 2 and 3.
KP_liberation_guerilla_facegear = [
' + toString[32, 32, 32, 32] + '"' + T23FF + '"
];');