//Open and write to the settings.ini to update new preferences
//scr_saveSettings()
//Run whenever you exit a settings screen

//Open the ini file for writing
ini_open("Settings.ini")

//Sound Settings
ini_write_real("Sound","ambienceVolume", global.ambienceVolume)
ini_write_real("Sound","effectVolume", global.effectVolume)
ini_write_real("Sound","musicVolume", global.musicVolume)

//Movement Keybindings
ini_write_real("Controls","up", global.upKey)
ini_write_real("Controls","down", global.downKey)
ini_write_real("Controls","left", global.leftKey)
ini_write_real("Controls","right", global.rightKey)
ini_write_real("Controls","sprint", global.sprintKey)
ini_write_real("Controls","dodge", global.dodgeKey)
ini_write_real("Controls","sneak", global.sneakKey)

//Item Keybindings
ini_write_real("Controls","item1", global.itemKey[1])
ini_write_real("Controls","item2", global.itemKey[2])
ini_write_real("Controls","item3", global.itemKey[3])
ini_write_real("Controls","item4", global.itemKey[4])
ini_write_real("Controls","item5", global.itemKey[5])
ini_write_real("Controls","item6", global.itemKey[6])
ini_write_real("Controls","item7", global.itemKey[7])
ini_write_real("Controls","item8", global.itemKey[8])
ini_write_real("Controls","item9", global.itemKey[9])
ini_write_real("Controls","item10", global.itemKey[10])

//Other Keybindings
ini_write_real("Controls","reload", global.reloadKey)
ini_write_real("Controls","interact", global.interactKey)
ini_write_real("Controls","throw", global.throwKey)
ini_write_real("Controls","empty", global.emptyKey)

//Gameplay
ini_write_real("Gameplay","fps", global.frameRate)

//Close the ini file
ini_close()
