local Game = {};

-------------------------
-- DK64 specific state --
-------------------------

local kong_model_pointer;
local training_barrel;
local pointer_list;
local global_base;
local kongbase;
local tb_void_byte;
local menu_flags;

Game.maps = {
	"Test Map",
	"Funky's Store",
	"DK Arcade",
	"K. Rool Barrel: Lanky's Maze",
	"Jungle Japes: Mountain",
	"Cranky's Lab",
	"Jungle Japes: Minecart",
	"Jungle Japes",
	"Jungle Japes: Army Dillo",
	"Jetpac",
	"Kremling Kosh! (very easy)",
	"Stealthy Snoop! (normal, no logo)",
	"Jungle Japes: Shell",
	"Jungle Japes: Lanky's Cave",
	"Angry Aztec: Beetle Race",
	"Snide's H.Q.",
	"Angry Aztec: Tiny's Temple",
	"Hideout Helm",
	"Teetering Turtle Trouble! (very easy)",
	"Angry Aztec: Five Door Temple (DK)",
	"Angry Aztec: Llama Temple",
	"Angry Aztec: Five Door Temple (Diddy)",
	"Angry Aztec: Five Door Temple (Tiny)",
	"Angry Aztec: Five Door Temple (Lanky)",
	"Angry Aztec: Five Door Temple (Chunky)",
	"Candy's Music Shop",
	"Frantic Factory",
	"Frantic Factory: Car Race",
	"Hideout Helm (Level Intros, Game Over)",
	"Frantic Factory: Power Hut",
	"Gloomy Galleon",
	"Gloomy Galleon: K. Rool's Ship",
	"Batty Barrel Bandit! (easy)",
	"Jungle Japes: Chunky's Cave",
	"DK Isles Overworld",
	"K. Rool Barrel: DK's Target Game",
	"Frantic Factory: Conveyor Belt",
	"Jungle Japes: Barrel Blast",
	"Angry Aztec",
	"Gloomy Galleon: Seal Race",
	"Nintendo Logo",
	"Angry Aztec: Barrel Blast",
	"Troff 'n' Scoff",
	"Gloomy Galleon: Shipwreck (Diddy, Lanky, Chunky)",
	"Gloomy Galleon: Treasure Chest",
	"Gloomy Galleon: Mermaid",
	"Gloomy Galleon: Shipwreck (DK, Tiny)",
	"Gloomy Galleon: Shipwreck (Lanky, Tiny)",
	"Fungi Forest",
	"Gloomy Galleon: Lighthouse",
	"K. Rool Barrel: Tiny's Mushroom Game",
	"Gloomy Galleon: Mechanical Fish",
	"Fungi Forest: Tree Stump",
	"Beaver Brawl!",
	"Gloomy Galleon: Barrel Blast",
	"Fungi Forest: Minecart",
	"Fungi Forest: Diddy's Barn",
	"Fungi Forest: Diddy's Attic",
	"Fungi Forest: Lanky's Attic",
	"Fungi Forest: DK's Barn",
	"Fungi Forest: Spider",
	"Fungi Forest: Front Part of Mill",
	"Fungi Forest: Rear Part of Mill",
	"Fungi Forest: Mushroom Puzzle",
	"Fungi Forest: Giant Mushroom",
	"Stealthy Snoop! (normal)",
	"Mad Maze Maul! (hard)",
	"Stash Snatch! (normal)",
	"Mad Maze Maul! (easy)",
	"Mad Maze Maul! (normal)",
	"Fungi Forest: Mushroom Leap",
	"Fungi Forest: Shooting Game",
	"Crystal Caves",
	"Kritter Karnage!",
	"Stash Snatch! (easy)",
	"Stash Snatch! (hard)",
	"DK Rap",
	"Minecart Mayhem! (easy)",
	"Busy Barrel Barrage! (easy)",
	"Busy Barrel Barrage! (normal)",
	"Main Menu",
	"Title Screen (Not For Resale Version)",
	"Crystal Caves: Beetle Race",
	"Fungi Forest: Dogadon",
	"Crystal Caves: Igloo (Tiny)",
	"Crystal Caves: Igloo (Lanky)",
	"Crystal Caves: Igloo (DK)",
	"Creepy Castle",
	"Creepy Castle: Ballroom",
	"Crystal Caves: DK's Hut",
	"Crystal Caves: Shack (Chunky)",
	"Crystal Caves: Shack (DK)",
	"Crystal Caves: Shack (Diddy, middle part)",
	"Crystal Caves: Shack (Tiny)",
	"Crystal Caves: Lanky's Hut",
	"Crystal Caves: Igloo (Chunky)",
	"Splish-Splash Salvage! (normal)",
	"K. Lumsy",
	"Crystal Caves: Ice Castle",
	"Speedy Swing Sortie! (easy)",
	"Crystal Caves: Igloo (Diddy)",
	"Krazy Kong Klamour! (easy)",
	"Big Bug Bash! (very easy)",
	"Searchlight Seek! (very easy)",
	"Beaver Bother! (easy)",
	"Creepy Castle: Tower",
	"Creepy Castle: Minecart",
	"Kong Battle: Battle Arena",
	"Creepy Castle: Basement (Lanky, Tiny)",
	"Kong Battle: Arena 1",
	"Frantic Factory: Barrel Blast",
	"Gloomy Galleon: Pufftoss",
	"Creepy Castle: Basement (DK, Diddy, Chunky)",
	"Creepy Castle: Museum",
	"Creepy Castle: Library",
	"Kremling Kosh! (easy)",
	"Kremling Kosh! (normal)",
	"Kremling Kosh! (hard)",
	"Teetering Turtle Trouble! (easy)",
	"Teetering Turtle Trouble! (normal)",
	"Teetering Turtle Trouble! (hard)",
	"Batty Barrel Bandit! (easy)",
	"Batty Barrel Bandit! (normal)",
	"Batty Barrel Bandit! (hard)",
	"Mad Maze Maul! (insane)",
	"Stash Snatch! (insane)",
	"Stealthy Snoop! (very easy)",
	"Stealthy Snoop! (easy)",
	"Stealthy Snoop! (hard)",
	"Minecart Mayhem! (normal)",
	"Minecart Mayhem! (hard)",
	"Busy Barrel Barrage! (hard)",
	"Splish-Splash Salvage! (hard)",
	"Splish-Splash Salvage! (easy)",
	"Speedy Swing Sortie! (normal)",
	"Speedy Swing Sortie! (hard)",
	"Beaver Bother! (normal)",
	"Beaver Bother! (hard)",
	"Searchlight Seek! (easy)",
	"Searchlight Seek! (normal)",
	"Searchlight Seek! (hard)",
	"Krazy Kong Klamour! (normal)",
	"Krazy Kong Klamour! (hard)",
	"Krazy Kong Klamour! (insane)",
	"Peril Path Panic! (very easy)",
	"Peril Path Panic! (easy)",
	"Peril Path Panic! (normal)",
	"Peril Path Panic! (hard)",
	"Big Bug Bash! (easy)",
	"Big Bug Bash! (normal)",
	"Big Bug Bash! (hard)",
	"Creepy Castle: Tunnel",
	"Hideout Helm (Intro Story)",
	"DK Isles (DK Theatre)",
	"Frantic Factory: Mad Jack",
	"Arena Ambush!",
	"More Kritter Karnage!",
	"Forest Fracas!",
	"Bish Bash Brawl!",
	"Kamikaze Kremlings!",
	"Plinth Panic!",
	"Pinnacle Palaver!",
	"Shockwave Showdown!",
	"Creepy Castle: Dungeon",
	"Creepy Castle: Tree",
	"K. Rool Barrel: Diddy's Kremling Game",
	"Creepy Castle: Hut",
	"Creepy Castle: Trash Can",
	"Creepy Castle: Greenhouse",
	"Jungle Japes Lobby",
	"Hideout Helm Lobby",
	"DK's House",
	"Rock (Intro Story)",
	"Angry Aztec Lobby",
	"Gloomy Galleon Lobby",
	"Frantic Factory Lobby",
	"Training Grounds",
	"Water Barrel",
	"Fungi Forest Lobby",
	"Gloomy Galleon: Submarine",
	"Orange Barrel",
	"Barrel Barrel",
	"Vine Barrel",
	"Creepy Castle: Crypt",
	"Enguarde Arena",
	"Creepy Castle: Car Race",
	"Crystal Caves: Barrel Blast",
	"Creepy Castle: Barrel Blast",
	"Fungi Forest: Barrel Blast",
	"Fairy Island",
	"Kong Battle: Arena 2",
	"Rambi Arena",
	"Kong Battle: Arena 3",
	"Creepy Castle Lobby",
	"Crystal Caves Lobby",
	"DK Isles: Snide's Room",
	"Crystal Caves: Army Dillo",
	"Angry Aztec: Dogadon",
	"Training Grounds (End Sequence)",
	"Creepy Castle: King Kutout",
	"Crystal Caves: Shack (Diddy, upper part)",
	"K. Rool Barrel: Diddy's Rocketbarrel Game",
	"K. Rool Barrel: Lanky's Shooting Game",
	"K. Rool Fight: DK Phase",
	"K. Rool Fight: Diddy Phase",
	"K. Rool Fight: Lanky Phase",
	"K. Rool Fight: Tiny Phase",
	"K. Rool Fight: Chunky Phase",
	"Bloopers Ending",
	"K. Rool Barrel: Chunky's Hidden Kremling Game",
	"K. Rool Barrel: Tiny's Pony Tail Twirl Game",
	"K. Rool Barrel: Chunky's Shooting Game",
	"K. Rool Barrel: DK's Rambi Game",
	"K. Lumsy Ending",
	"K. Rool's Shoe",
	"K. Rool's Arena"
};

------------------
-- Unlock menus --
------------------

function Game.unlock_menus()
	for byte=0,7 do
		mainmemory.write_u8(menu_flags + byte, 0xff);
	end
end

----------------------------------
-- Refill Consumables           --
-- Based on research by Exchord --
----------------------------------

-- Maximum values
local max_melons = 3;
local max_health = max_melons * 4;

local max_coins          = 50;
local max_crystals       = 20;
local max_film           = 10;
local max_oranges        = 20;
local max_musical_energy = 10;
local max_standard_ammo  = 50;
local max_homing_ammo    = 50;

-- Relative to global_base
local standard_ammo = 0;
local homing_ammo   = 2;
local oranges       = 4;
local crystals      = 5;
local film          = 8;
local health        = 10;
local melons        = 11;

-- Kong index
local DK     = 0;
local Diddy  = 1;
local Lanky  = 2;
local Tiny   = 3;
local Chunky = 4;

-- Pointers relative to Kong base
local moves      = 0;
local sim_slam   = 1;
local weapon     = 2;
local instrument = 4;
local coins      = 7;
local lives      = 9; -- This is used as instrument ammo in single player

local function unlock_moves()
	local kong;
	for kong=DK,Chunky do
		local base = kongbase + kong * 0x5e;
		mainmemory.write_u8(base + moves,      3);
		mainmemory.write_u8(base + sim_slam,   3);
		mainmemory.write_u8(base + weapon,     7);
		mainmemory.write_u8(base + instrument, 15);
	end

	-- Training barrels
	mainmemory.write_u8(training_barrel, 0xff);
end

------------------------------------
-- Moonjump BizHawk Lua port      --
-- Based on work by SubDrag, 2006 --
------------------------------------
-- http://www.therwp.com/forums/showthread.php?t=7238

-- Relative to kong_model_pointer
local visibility = 0x63; -- 127 = visible

local x_pos = 0x7c;
local y_pos = 0x80;
local z_pos = 0x84;

local floor = 0xa4;
local angle = 0xe4;

local camera_focus_pointer = 0x178;

local kick_animation = 0x181;
local kick_animation_value = 0x29;

local kick_freeze = 0xc4;
local kick_freeze_value = 0xc020;

local kong_model;

---------------
-- Key stuff --
---------------

-- USA Defaults
local key_base;
local key_collected_bitmasks;
local key_offsets = {
	0x00,
	0x06,
	0x0e,
	0x12,
	0x1a,
	0x21,
	0x24,
	0x2c
};

local function keyGet(number)
	local current_file = mainmemory.readbyte(file);
	if current_file >= 0 and current_file <= 2 then
		local current_value = mainmemory.readbyte(key_base[current_file] + key_offsets[number]);
		local new_value = bit.bor(current_value, key_collected_bitmasks[number]);
		mainmemory.write_u8(key_base[current_file] + key_offsets[number], new_value);
	end
end

local function keyLose(number)
	local current_file = mainmemory.readbyte(file);
	if current_file >= 0 and current_file <= 2 then
		local current_value = mainmemory.readbyte(key_base[current_file] + key_offsets[number]);
		local new_value = bit.bnot(bit.band(current_value, key_collected_bitmasks[number]));
		mainmemory.write_u8(key_base[current_file] + key_offsets[number], new_value);
	end
end

local function initKeyGUI(form_handle, col, row, button_height)
	local options_get_key1_button =  forms.button(form_handle, "Get Key 1", function() keyGet(1) end,  col(10), row(0), 64, button_height);
	local options_lose_key1_button = forms.button(form_handle, "Lose Key",  function() keyLose(1) end, col(13), row(0), 64, button_height);
	local options_get_key2_button =  forms.button(form_handle, "Get Key 2", function() keyGet(2) end,  col(10), row(1), 64, button_height);
	local options_lose_key2_button = forms.button(form_handle, "Lose Key",  function() keyLose(2) end, col(13), row(1), 64, button_height);
	local options_get_key3_button =  forms.button(form_handle, "Get Key 3", function() keyGet(3) end,  col(10), row(2), 64, button_height);
	local options_lose_key3_button = forms.button(form_handle, "Lose Key",  function() keyLose(3) end, col(13), row(2), 64, button_height);
	local options_get_key4_button =  forms.button(form_handle, "Get Key 4", function() keyGet(4) end,  col(10), row(3), 64, button_height);
	local options_lose_key4_button = forms.button(form_handle, "Lose Key",  function() keyLose(4) end, col(13), row(3), 64, button_height);
	local options_get_key5_button =  forms.button(form_handle, "Get Key 5", function() keyGet(5) end,  col(10), row(4), 64, button_height);
	local options_lose_key5_button = forms.button(form_handle, "Lose Key",  function() keyLose(5) end, col(13), row(4), 64, button_height);
	local options_get_key6_button =  forms.button(form_handle, "Get Key 6", function() keyGet(6) end,  col(10), row(5), 64, button_height);
	local options_lose_key6_button = forms.button(form_handle, "Lose Key",  function() keyLose(6) end, col(13), row(5), 64, button_height);
	local options_get_key7_button =  forms.button(form_handle, "Get Key 7", function() keyGet(7) end,  col(10), row(6), 64, button_height);
	local options_lose_key7_button = forms.button(form_handle, "Lose Key",  function() keyLose(7) end, col(13), row(6), 64, button_height);
	local options_get_key8_button =  forms.button(form_handle, "Get Key 8", function() keyGet(8) end,  col(10), row(7), 64, button_height);
	local options_lose_key8_button = forms.button(form_handle, "Lose Key",  function() keyLose(8) end, col(13), row(7), 64, button_height);
end

--------------------
-- Region/Version --
--------------------

function Game.detectVersion(romName)
	if bizstring.contains(romName, "USA") and not bizstring.contains(romName, "Kiosk") then
		map                = 0x7444E7;
		file               = 0x7467c8;
		training_barrel    = 0x7ed230;
		menu_flags         = 0x7ed558;
		kong_model_pointer = 0x7fbb4d;
		tb_void_byte       = 0x7fbb63;
		pointer_list       = 0x7fbff0;
		kongbase           = 0x7fc950;
		global_base        = 0x7fcc41;

		key_base = {
			[0] = 0x7ed3af,
			[1] = 0x7ed057,
			[2] = 0x7ed3af
		};

		key_collected_bitmasks = {
			0x04,
			0x04,
			0x04,
			0x01,
			0x10,
			0x10,
			0x20,
			0x10
		};
	elseif bizstring.contains(romName, "Europe") then
		map                = 0x73EC37;
		file               = 0x740F18;
		training_barrel    = 0x7ed150;
		menu_flags         = 0x7ed478;
		kong_model_pointer = 0x7fba6d;
		tb_void_byte       = 0x7FBA83;
		pointer_list       = 0x7fbf10;
		kongbase           = 0x7fc890;
		global_base        = 0x7fcb81;

		-- TODO: Keys
	elseif bizstring.contains(romName, "Japan") then
		map                = 0x743DA7;
		file               = 0x746088;
		training_barrel    = 0x7ed84c;
		menu_flags         = 0x7ed9c8;
		kong_model_pointer = 0x7fbfbd;
		tb_void_byte       = 0x7FBFD3;
		pointer_list       = 0x7fc460;
		kongbase           = 0x7fcde0;
		global_base        = 0x7fd0d1;

		key_base = {
			[0] = 0x7ED4C7,
			[1] = 0x7ED31B,
			[2] = 0x7ED673
		};

		key_collected_bitmasks = { -- TODO
			0xFF,
			0xFF,
			0xFF,
			0xFF,
			0xFF,
			0xFF,
			0xFF,
			0xFF
		};
	elseif bizstring.contains(romName, "Kiosk") then
		file               = 0x7467c8; -- TODO?
		map                = 0x7444E7; -- TODO
		training_barrel    = 0x7ed150; -- TODO?
		menu_flags         = 0x7ed558; -- TODO?
		kong_model_pointer = 0x7b5afd;
		tb_void_byte       = 0x7fbb63; -- TODO?
		pointer_list       = 0x7b5e58;
		kongbase           = 0x7fc950; -- TODO
		global_base        = 0x7fcc41; -- TODO

		-- TODO: Keys?
	end
end

-------------------
-- Physics/Scale --
-------------------

Game.speedy_speeds = { .001, .01, .1, 1, 5, 10, 20, 50, 100 };
Game.speedy_index = 7;

Game.rot_speed = 10;
Game.max_rot_units = 4096;

function Game.isPhysicsFrame()
	return not emu.islagged();
end

--------------
-- Position --
--------------

function Game.getXPosition()
	return mainmemory.readfloat(kong_model + x_pos, true);
end

function Game.getYPosition()
	return mainmemory.readfloat(kong_model + y_pos, true);
end

function Game.getZPosition()
	return mainmemory.readfloat(kong_model + z_pos, true);
end

function Game.setXPosition(value)
	mainmemory.writefloat(kong_model + x_pos, value, true);
end

function Game.setYPosition(value)
	mainmemory.writefloat(kong_model + y_pos, value, true);
end

function Game.setZPosition(value)
	mainmemory.writefloat(kong_model + z_pos, value, true);
end

--------------
-- Rotation --
--------------

function Game.getXRotation()
	return mainmemory.read_u16_be(kong_model + angle + 0);
end

function Game.getYRotation()
	return mainmemory.read_u16_be(kong_model + angle + 2);
end

function Game.getZRotation()
	return mainmemory.read_u16_be(kong_model + angle + 4);
end

function Game.setXRotation(value)
	mainmemory.write_u16_be(kong_model + angle + 0, value);
end

function Game.setYRotation(value)
	mainmemory.write_u16_be(kong_model + angle + 2, value);
end

function Game.setZRotation(value)
	mainmemory.write_u16_be(kong_model + angle + 4, value);
end

--------------------
-- Misc functions --
--------------------

local function invisify()
	kong_model = mainmemory.read_u24_be(kong_model_pointer);
	mainmemory.writebyte(kong_model + visibility, 0x00);
	-- TODO: We only really need to update UI here, can we include a Game.updateUI method in the module interface?
	Game.eachFrame();
end

local function visify()
	kong_model = mainmemory.read_u24_be(kong_model_pointer);
	mainmemory.writebyte(kong_model + visibility, 0x7f);
	-- TODO: We only really need to update UI here, can we include a Game.updateUI method in the module interface?
	Game.eachFrame();
end

local current_invisify = "Invisify";
local function toggle_invisify()
	if current_invisify == "Invisify" then
		invisify();
		current_invisify = "Visify";
	else
		visify();
		current_invisify = "Invisify";
	end

	-- TODO: We only really need to update UI here, can we include a Game.updateUI method in the module interface?
	Game.eachFrame();
end

local function clear_tb_void()
	local tb_void_byte_val = mainmemory.readbyte(tb_void_byte);
	mainmemory.writebyte(tb_void_byte, bit.bor(tb_void_byte_val, 0x30));
end

local function force_pause()
	mainmemory.writebyte(tb_void_byte, 0x31);
end

local function force_zipper()
	-- TODO: ik you can do this with tb_void_byte
end

------------------------------------
-- Never Slip                     --
-- Written by Isotarge, 2014-2015 --
------------------------------------

-- Pointers
local slope_object_pointer = 0x7f94b9;
local slope_object_pointer_2 = 0x7fd581;

-- Relative to slope object
local slope_timer = 0xc3;

-- Relative to kong object
local slope_byte = 0xDE;

local function neverSlip()
	-- Patch the slope timer
	local slope_object = mainmemory.read_u24_be(slope_object_pointer);
	mainmemory.write_u8(slope_object + slope_timer, 0);

	-- Patch the Kong object
	local kong_model = mainmemory.read_u24_be(kong_model_pointer);
	local slope_value = mainmemory.read_u8(kong_model + slope_byte);
	mainmemory.write_u8(kong_model + slope_byte, math.max(3, slope_value));
end

------------
-- Events --
------------

function Game.setMap(value)
	if value >= 1 and value <= #Game.maps then
		mainmemory.writebyte(map, value - 1);
	end
end

local options_toggle_invisify_button;
local options_clear_tb_void_button;
local options_force_pause_button;
local options_unlock_moves_button;

local options_toggle_homing_ammo;
local options_toggle_neverslip;

function Game.initUI(form_handle, col, row, button_height)
	initKeyGUI(form_handle, col, row, button_height);

	-- Buttons
	options_toggle_invisify_button = forms.button(form_handle, "Invisify",      toggle_invisify, col(5), row(4), col(4) + 8, button_height);
	options_clear_tb_void_button =   forms.button(form_handle, "Clear TB void", clear_tb_void,   col(5), row(5), col(4) + 8, button_height);
	options_force_pause_button =     forms.button(form_handle, "Force Pause",   force_pause,     col(5), row(6), col(4) + 8, button_height);
	options_unlock_moves_button =    forms.button(form_handle, "Unlock Moves",  unlock_moves,    col(5), row(7), col(4) + 8, button_height);

	-- Checkboxes
	options_toggle_neverslip =       forms.checkbox(form_handle, "Never Slip",                  col(0), row(6));
	options_toggle_homing_ammo =     forms.checkbox(form_handle, "Homing Ammo",                 col(0), row(7));
end

function Game.applyInfinites()
	mainmemory.write_u8(global_base + standard_ammo, max_standard_ammo);
	if forms.ischecked(options_toggle_homing_ammo) then
		mainmemory.write_u8(global_base + homing_ammo, max_homing_ammo);
	else
		mainmemory.write_u8(global_base + homing_ammo, 0);
	end
	mainmemory.write_u8(global_base + oranges,  max_oranges);
	mainmemory.write_u16_be(global_base + crystals, max_crystals * 150);
	mainmemory.write_u8(global_base + film,     max_film);
	mainmemory.write_u8(global_base + health,   max_health);
	mainmemory.write_u8(global_base + melons,   max_melons);
	local kong;
	for kong=DK,Chunky do
		local base = kongbase + kong * 0x5e;
		mainmemory.write_u8(base + coins, max_coins);
		mainmemory.write_u8(base + lives, max_musical_energy);
	end
end

function Game.eachFrame()
	kong_model = mainmemory.read_u24_be(kong_model_pointer);
	Game.unlock_menus();

	if forms.ischecked(options_toggle_neverslip) then
		neverSlip();
	end

	forms.settext(options_toggle_invisify_button, current_invisify);
end

return Game;