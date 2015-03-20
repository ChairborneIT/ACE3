#include "script_component.hpp"

ADDON = false;

PREP(addActionToClass);
PREP(addActionToObject);
PREP(compileMenu);
PREP(compileMenuSelfAction);
PREP(collectActiveActionTree);
PREP(createAction);
PREP(findActionNode);
PREP(keyDown);
PREP(keyDownSelfAction);
PREP(keyUp);
PREP(keyUpSelfAction);
PREP(removeActionFromClass);
PREP(removeActionFromObject);
PREP(render);
PREP(renderBaseMenu);
PREP(renderIcon);
PREP(renderMenu);
PREP(splitPath);

GVAR(keyDown) = false;
GVAR(keyDownSelfAction) = false;
GVAR(keyDownTime) = 0;

GVAR(lastTime) = diag_tickTime;
GVAR(rotationAngle) = 0;

GVAR(selectedAction) = [[],[]];
GVAR(selectedStatement) = {};
GVAR(actionSelected) = false;
GVAR(selectedTarget) = objNull;

GVAR(menuDepthPath) = [];
GVAR(lastPos) = [0,0,0];

GVAR(currentOptions) = [];

GVAR(lastPath) = [];

GVAR(expanded) = false;

GVAR(startHoverTime) = diag_tickTime;
GVAR(expandedTime) = diag_tickTime;
GVAR(iconCtrls) = [];
GVAR(iconCount) = 0;

ADDON = true;
