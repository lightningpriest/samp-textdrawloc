/*

   _____ ______ _______   _      ____   _____       _______ _____ ____  _   _ 
  / ____|  ____|__   __| | |    / __ \ / ____|   /\|__   __|_   _/ __ \| \ | |
 | |  __| |__     | |    | |   | |  | | |       /  \  | |    | || |  | |  \| |
 | | |_ |  __|    | |    | |   | |  | | |      / /\ \ | |    | || |  | | . ` |
 | |__| | |____   | |    | |___| |__| | |____ / ____ \| |   _| || |__| | |\  |
  \_____|______|  |_|    |______\____/ \_____/_/    \_\_|  |_____\____/|_| \_|

------------------------------------------------------------------------------->
Github: https://github.com/prrssr
Version: 0.0.1
<------------------------------------------------------------------------------
                                                                              
                                                                              
*/

#include <a_samp>
#include <a_zones>

enum playerData {
    PlayerText:pTextdraws;
}

CreateTextDraws(playerid)
{
    PlayerData[playerid][pTextdraws] = CreatePlayerTextDraw(playerid, 43.000000, 311.000000, "Mulholland");
	PlayerTextDrawFont(playerid, PlayerData[playerid][pTextdraws], 1);
	PlayerTextDrawLetterSize(playerid, PlayerData[playerid][pTextdraws], 0.275000, 1.350000);
	PlayerTextDrawTextSize(playerid, PlayerData[playerid][pTextdraws], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerData[playerid][pTextdraws], 1);
	PlayerTextDrawSetShadow(playerid, PlayerData[playerid][pTextdraws], 0);
	PlayerTextDrawAlignment(playerid, PlayerData[playerid][pTextdraws], 1);
	PlayerTextDrawColor(playerid, PlayerData[playerid][pTextdraws], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerData[playerid][pTextdraws], 255);
	PlayerTextDrawBoxColor(playerid, PlayerData[playerid][pTextdraws], 50);
	PlayerTextDrawUseBox(playerid, PlayerData[playerid][pTextdraws], 0);
	PlayerTextDrawSetProportional(playerid, PlayerData[playerid][pTextdraws], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerData[playerid][pTextdraws], 0);
}

forward PlayerLocationTimer(playerid);
public PlayerLocationTimer(playerid)
{
	new location[MAX_ZONE_NAME];
	new str[256];
	GetPlayer2DZone(playerid, location, MAX_ZONE_NAME);
	format(str, sizeof(str), "%s", location);
	PlayerTextDrawSetString(playerid, PlayerData[playerid][pTextdraws], str);
	PlayerTextDrawHide(playerid, PlayerData[playerid][pTextdraws]);
	SetTimer("PlayerLocationTimer", 1000, false);
	PlayerTextDrawShow(playerid, PlayerData[playerid][pTextdraws]);
}

public OnPlayerSpawn(playerid)
{
    PlayerTextDrawShow(playerid, PlayerData[playerid][pTextdraws]);
	SetTimer("PlayerLocationTimer", 1000, false);
}