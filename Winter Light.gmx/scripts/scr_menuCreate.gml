//Establish Menu Buttons
//scr_menuCreate()
//Run to create menus

switch(argument0)
{
case 0:     //Landing Menu
i = instance_create(50,30,obj_menuTitle)
i.text = 'Winter Light'

i = instance_create(32,60,obj_menuButton)
i.text = 'Start Game' i.number = 0

i = instance_create(32,90,obj_menuButton)
i.text = 'Graveyard' i.number = 1

i = instance_create(32,120,obj_menuButton)
i.text = 'Settings' i.number = 2

i = instance_create(32,150,obj_menuButton)
i.text = 'Exit' i.number = 3
break

case 1:     //New Game Menu
i = instance_create(50,30,obj_menuTitle)
i.text = 'Character Selection'

i = instance_create(32,60,obj_menuButton)
i.text = 'Princess' i.number = 5 

i = instance_create(400,250,obj_menuButton)
i.text = 'Return'
i.number = 4
break

case 2:     //Graveyard
i = instance_create(50,30,obj_menuTitle)
i.text = 'Graveyard'

//Temp

i = instance_create(400,250,obj_menuButton)
i.text = 'Return'
i.number = 4
break

case 3:     //Settings Menu 
i = instance_create(50,30,obj_menuTitle)
i.text = 'Settings'
 
i = instance_create(32,60,obj_menuButton)
i.text = 'Audio' i.number = 8

i = instance_create(32,90,obj_menuButton)
i.text = 'Gameplay' i.number = 9

i = instance_create(32,120,obj_menuButton)
i.text = 'Keybindings' i.number = 10

i = instance_create(400,250,obj_menuButton)
i.text = 'Return' i.number = 11
break

case 4:     //Audio Menu
i = instance_create(50,30,obj_menuTitle)
i.text = 'Settings - Audio'

i = instance_create(32,60,obj_menuButton)
i.text = 'Audio' i.number = 20

i = instance_create(40,90,obj_sliderControl)
i.text = 'Effects' i.number = 0

i = instance_create(40,110,obj_sliderControl)
i.text = 'Music' i.number = 2

i = instance_create(40,130,obj_sliderControl)
i.text = 'Ambience' i.number = 3

i = instance_create(32,160,obj_menuButton)
i.text = 'Gameplay' i.number = 9

i = instance_create(32,190,obj_menuButton)
i.text = 'Keybindings' i.number = 10

i = instance_create(400,250,obj_menuButton)
i.text = 'Return'
i.number = 11
break

case 5:     //Gameplay Menu
i = instance_create(50,30,obj_menuTitle)
i.text = 'Settings - Gameplay'

i = instance_create(32,60,obj_menuButton)
i.text = 'Audio' i.number = 8

i = instance_create(32,90,obj_menuButton)
i.text = 'Gameplay' i.number = 20

i = instance_create(40,120,obj_sliderControl)
i.text = 'Frame Rate' i.number = 4

i = instance_create(32,150,obj_menuButton)
i.text = 'Keybindings' i.number = 10

i = instance_create(400,250,obj_menuButton)
i.text = 'Return' i.number = 11
break

case 6:     //Keybind Menu
i = instance_create(50,30,obj_menuTitle)
i.text = 'Settings - Keybindings - Movement'

i = instance_create(32,60,obj_menuButton)
i.text = 'Audio' i.number = 8

i = instance_create(32,90,obj_menuButton)
i.text = 'Gameplay' i.number = 9

i = instance_create(32,120,obj_menuButton)
i.text = 'Keybindings' i.number = 20

i = instance_create(40,150,obj_menuButton)
i.text = 'Movement' i.number = 20 i.font = fnt_smlMenu

i = instance_create(40,170,obj_menuButton)
i.text = 'Inventory' i.number = 12 i.font = fnt_smlMenu

i = instance_create(40,190,obj_menuButton)
i.text = 'Other' i.number = 13 i.font = fnt_smlMenu

scr_keybindCreate(1)


i = instance_create(400,250,obj_menuButton)
i.text = 'Return' i.number = 11
break

case 7:     //Keybind Menu
i = instance_create(50,30,obj_menuTitle)
i.text = 'Settings - Keybindings - Abilities'

i = instance_create(32,60,obj_menuButton)
i.text = 'Audio' i.number = 8

i = instance_create(32,90,obj_menuButton)
i.text = 'Gameplay' i.number = 9

i = instance_create(32,120,obj_menuButton)
i.text = 'Keybindings' i.number = 20

i = instance_create(40,150,obj_menuButton)
i.text = 'Movement' i.number = 10 i.font = fnt_smlMenu

i = instance_create(40,170,obj_menuButton)
i.text = 'Inventory' i.number = 20 i.font = fnt_smlMenu

i = instance_create(40,190,obj_menuButton)
i.text = 'Other' i.number = 13 i.font = fnt_smlMenu

scr_keybindCreate(2)


i = instance_create(400,250,obj_menuButton)
i.text = 'Return' i.number = 11
break

case 8:     //Keybind Menu
i = instance_create(50,30,obj_menuTitle)
i.text = 'Settings - Keybindings - Other'

i = instance_create(32,60,obj_menuButton)
i.text = 'Audio' i.number = 8

i = instance_create(32,90,obj_menuButton)
i.text = 'Gameplay' i.number = 9

i = instance_create(32,120,obj_menuButton)
i.text = 'Keybindings' i.number = 20

i = instance_create(40,150,obj_menuButton)
i.text = 'Movement' i.number = 10 i.font = fnt_smlMenu

i = instance_create(40,170,obj_menuButton)
i.text = 'Inventory' i.number = 12 i.font = fnt_smlMenu

i = instance_create(40,190,obj_menuButton)
i.text = 'Other' i.number = 20 i.font = fnt_smlMenu

scr_keybindCreate(3)


i = instance_create(400,250,obj_menuButton)
i.text = 'Return' i.number = 11
break
}
