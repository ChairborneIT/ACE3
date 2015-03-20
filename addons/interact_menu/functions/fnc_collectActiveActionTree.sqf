/*
 * Author: CAA-Picard
 * Collect a entire tree of active actions
 *
 * Argument:
 * 0: Object <OBJECT>
 * 1: Original action tree <ARRAY>
 * 2: Parent path <ARRAY>
 *
 * Return value:
 * Active children <ARRAY>
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_object,_origAction,_parentPath);
EXPLODE_2_PVT(_origAction,_origActionData,_origActionChildren);

private ["_target","_player","_fullPath","_activeChildren","_action","_actionData","_x"];

_target = _object;
_player = ACE_player;

// Return nothing if the action itself is not active
if !([_target, ACE_player, _origActionData select 6] call (_origActionData select 4)) exitWith {
    []
};

_activeChildren = [];

// If there's a statement to dynamically insert children then execute it
if !({} isEqualTo (_origActionData select 5)) then {
    _activeChildren = [_target, ACE_player, _origActionData select 6] call (_origActionData select 5);
};

_fullPath = +_parentPath;
_fullPath pushBack (_origActionData select 0);

// Collect children class actions
{
    _action = [_object, _x, _fullPath] call FUNC(collectActiveActionTree);
    if ((count _action) > 0) then {
        _activeChildren pushBack _action;
    };
} forEach _origActionChildren;

// Collect children object actions
{
    EXPLODE_2_PVT(_x,_actionData,_pPath);

    // Check if the action is children of the original action
    if (count _pPath == count _fullPath &&
        {_pPath isEqualTo _fullPath}) then {

        _action = [_object, _action, _fullPath] call FUNC(collectActiveActionTree);
        if ((count _action) > 0) then {
            _activeChildren pushBack _action;
        };
    };
} forEach GVAR(objectActions);


// If the original action has no statement, and no children, don't display it
if ((count _activeChildren) == 0 && ((_origActionData select 3) isEqualTo {})) exitWith {
    // @todo: Account for showDisabled?
    []
};


[_origActionData, _activeChildren, _object]
