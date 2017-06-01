//Click on Menu button
//scr_menuButton(button)
//Run when a menu button is clicked

switch(argument0)
{
//New Campaign   
case 0: scr_menuClear() scr_menuCreate(1) break
//Load Campaign
case 1: scr_menuClear() scr_menuCreate(2) break
//Settings Menu
case 2: scr_menuClear() scr_menuCreate(3) break
//Exit
case 3: game_end() break
//Landing Menu
case 4: scr_menuClear() scr_menuCreate(0) break
//Campaign Starts
case 5: room_goto_next() break
case 6: room_goto_next() break
case 7: room_goto_next() break

//Settings Menus
case 8: scr_menuClear() scr_menuCreate(4) break
case 9: scr_menuClear() scr_menuCreate(5) break
case 10: scr_menuClear() scr_menuCreate(6) break

case 12: scr_menuClear() scr_menuCreate(7) break
case 13: scr_menuClear() scr_menuCreate(8) break


//Return from settings
case 11: scr_menuClear() scr_saveSettings() scr_menuCreate(0) break
}
