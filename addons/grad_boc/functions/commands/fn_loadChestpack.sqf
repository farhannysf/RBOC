/*
 * Author: DerZade
 * Returns current sum of mass from items stored in a chestpack.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Mass <NUMBER>
 *
 * Example:
 * [player] call grad_boc_fnc_loadChestpack;
 *
 * Public: No
 */
params [ ["_unit",objNull,[objNull]] ];

if (isNull _unit) exitWith {0};

if ([_unit] call grad_boc_fnc_chestpack isEqualTo "") exitWith {0};

private _items = [_unit] call grad_boc_fnc_chestpackItems;
private _mass = 0;

{

    //get mass of item
    private _itemMass = 0;
    if (isClass (configFile>>"CfgWeapons">> _x >> "ItemInfo")) then {
        _itemMass = getNumber(configFile>>"CfgWeapons">> _x >> "ItemInfo" >> "Mass");
    };
    if (isClass (configFile>>"CfgWeapons">> _x >> "WeaponSlotsInfo")) then {
        _itemMass = getNumber(configFile>>"CfgWeapons">> _x >> "WeaponSlotsInfo" >> "Mass")
    };
    if (isClass (configFile>>"CfgMagazines">> _x)) then {
        _itemMass = getNumber(configFile>>"CfgMagazines">> _x >> "Mass");
    };
    if (isClass (configFile>>"CfgVehicles">> _x)) then  {
        _itemMass = getNumber(configFile>>"CfgVehicles">> _x >> "Mass");
    };
    if (isClass (configFile>>"CfgGlasses">> _x)) then  {
        _itemMass = getNumber(configFile>>"CfgGlasses">> _x >> "Mass");
    };

    _mass = _mass + _itemMass

} forEach _items;

_mass