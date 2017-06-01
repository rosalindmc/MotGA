//Initialise all the settings
//scr_establishSettings()
//Run on game start up

//Open the ini file for reading
ini_open("Settings.ini")

//Sound Settings
global.ambienceVolume = ini_read_real("Sound", "ambienceVolume", 1)
global.effectVolume = ini_read_real("Sound", "effectVolume", 1)
global.musicVolume = ini_read_real("Sound", "musicVolume", 1)

//Movement Keybindings
global.upKey = ini_read_real("Controls", "up",  ord('W'))
global.downKey = ini_read_real("Controls", "down", ord('S'))
global.leftKey = ini_read_real("Controls", "left",  ord('A'))
global.rightKey = ini_read_real("Controls", "right",  ord('D'))
global.sprintKey = ini_read_real("Controls", "sprint",  vk_lshift)
global.dodgeKey = ini_read_real("Controls", "dodge",  vk_space)
global.sneakKey = ini_read_real("Controls", "sneak",  ord('C'))

//Item Keybindings
global.itemKey[1] = ini_read_real("Controls", "item1", ord('1'))
global.itemKey[2] = ini_read_real("Controls", "item2", ord('2'))
global.itemKey[3] = ini_read_real("Controls", "item3", ord('3'))
global.itemKey[4] = ini_read_real("Controls", "item4", ord('4'))
global.itemKey[5] = ini_read_real("Controls", "item5", ord('5'))
global.itemKey[6] = ini_read_real("Controls", "item6", ord('6'))
global.itemKey[7] = ini_read_real("Controls", "item7", ord('7'))
global.itemKey[8] = ini_read_real("Controls", "item8", ord('8'))
global.itemKey[9] = ini_read_real("Controls", "item9", ord('9'))
global.itemKey[10] = ini_read_real("Controls", "item10", ord('10'))

//Other Keybindings
global.reloadKey = ini_read_real("Controls", "reload",  ord('R'))
global.interactKey = ini_read_real("Controls", "interact",  ord('E'))
global.throwKey = ini_read_real("Controls", "throw",  ord('F'))
global.emptyKey = ini_read_real("Controls", "empty",  ord('T'))

//Gameplay
global.frameRate = ini_read_real("Gameplay", "fps", 60)

//Close the ini file
ini_close()
