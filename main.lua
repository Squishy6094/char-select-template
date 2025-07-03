-- name: [CS] Character Select Template
-- description: Write mod description here!\n\nMade by: You!\n\n\\#ff7777\\This Pack requires Character Select\nto use as a Library!

--[[
    This template was made speficially with the interntion to be as simple and "fill in the blank" as possible,
    and does not have support for more advanced features such as movesets. 

    API Documentation for Character Select can be found below:
    https://github.com/Squishy6094/character-select-coop/wiki/API-Documentation

    Use this if you're curious on how anything here works >v<
]]

-- Replace Mod Name with your Character/Pack name.
local TEXT_MOD_NAME = "Custom Character"

-- Stops mod from loading if Character Select isn't on, Does not need to be touched
if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

--[[
    
        "Custom Character", -- Character Name
        "Description/Info", -- Description
        "Mod Creator Name", -- Credits
        "ffaaaa",           -- Menu Color
        E_MODEL_CHAR,       -- Character Model
        CT_MARIO,           -- Override Character
        TEX_CHAR_LIFE_ICON, -- Life Icon
        1,                  -- Camera Scale
        0                   -- Vertical Offset
]]

local characterData = {
    {
        name = "Custom Character",                           -- Name
        description = "Description/Info",                    -- Description
        credit = "You!",                                     -- Creator
        color = "ffffff",                                    -- Menu Color (Hex)
        model = smlua_model_util_get_id("custom_model_geo"), -- Model File Name (Found in 'actors' folder, exclude .bin)
        forceChar = CT_MARIO,                                -- Override Character
        lifeIcon = get_texture_info("exclamation-icon"),     -- Life Icon File Name (Found in 'textures' folder, exclude .tex)
        camScale = 1,                                        -- Camera Zoom in Menu
        offset = 0,                                          -- Character's Verticle Offset
        caps = {
            normal = smlua_model_util_get_id("FILENAME_geo"),
            wing = smlua_model_util_get_id("FILENAME_geo"),
            metal = smlua_model_util_get_id("FILENAME_geo"),
        },
        voicelines = {
            -- GENERAL SOUNDS
            [CHAR_SOUND_OKEY_DOKEY] =        'StartGame.ogg', -- Starting game
            [CHAR_SOUND_LETS_A_GO] =         'StartLevel.ogg', -- Starting level
            [CHAR_SOUND_PUNCH_YAH] =         'Punch1.ogg', -- Punch 1
            [CHAR_SOUND_PUNCH_WAH] =         'Punch2.ogg', -- Punch 2
            [CHAR_SOUND_PUNCH_HOO] =         'Punch3.ogg', -- Punch 3
            [CHAR_SOUND_YAH_WAH_HOO] =       {'Jump1.ogg', 'Jump2.ogg', 'Jump3.ogg'}, -- First Jump Sounds
            [CHAR_SOUND_HOOHOO] =            'DoubleJump.ogg', -- Second jump sound
            [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'TripleJump1.ogg', 'TripleJump2.ogg'}, -- Triple jump sounds
            [CHAR_SOUND_UH] =                'Bonk.ogg', -- Wall bonk
            [CHAR_SOUND_UH2] =               'LongJumpLand.ogg', -- Landing after long jump
            [CHAR_SOUND_UH2_2] =             'LongJumpLand.ogg',
            [CHAR_SOUND_HAHA] =              'TripleJumpLand.ogg', -- Landing triple jump
            [CHAR_SOUND_YAHOO] =             'LongJump.ogg', -- Long jump
            [CHAR_SOUND_DOH] =               'Bonk.ogg', -- Long jump wall bonk
            [CHAR_SOUND_WHOA] =              'GrabLedge.ogg', -- Grabbing ledge
            [CHAR_SOUND_EEUH] =              'ClimbLedge.ogg', -- Climbing over ledge
            [CHAR_SOUND_WAAAOOOW] =          'Falling.ogg', -- Falling a long distance
            [CHAR_SOUND_TWIRL_BOUNCE] =      'FlowerBounce.ogg', -- Bouncing off of a flower spring
            [CHAR_SOUND_GROUND_POUND_WAH] =  'GroundPound.ogg', 
            [CHAR_SOUND_HRMM] =              'Lift.ogg', -- Lifting something
            [CHAR_SOUND_HERE_WE_GO] =        'GetStar.ogg', -- Star get
            [CHAR_SOUND_SO_LONGA_BOWSER] =   'ThrowBowser.ogg', -- Throwing Bowser
            -- DAMAGE
            [CHAR_SOUND_ATTACKED] = 'Damaged.ogg', -- Damaged
            [CHAR_SOUND_PANTING] = 'Panting.ogg', -- Low health
            [CHAR_SOUND_ON_FIRE] = 'Burned.ogg', -- Burned
            -- SLEEP SOUNDS
            [CHAR_SOUND_IMA_TIRED] = 'Tired.ogg', -- Mario feeling tired
            [CHAR_SOUND_YAWNING] = 'Yawn.ogg', -- Mario yawning before he sits down to sleep
            [CHAR_SOUND_SNORING1] = 'Snore.ogg', -- Snore Inhale
            [CHAR_SOUND_SNORING2] = 'Exhale.ogg', -- Exhale
            [CHAR_SOUND_SNORING3] = 'SleepTalk.ogg', -- Sleep talking / mumbling
            -- COUGHING (USED IN THE GAS MAZE)
            [CHAR_SOUND_COUGHING1] = 'Cough1.ogg', -- Cough take 1
            [CHAR_SOUND_COUGHING2] = 'Cough2.ogg', -- Cough take 2
            [CHAR_SOUND_COUGHING3] = 'Cough3.ogg', -- Cough take 3
            -- DEATH
            [CHAR_SOUND_DYING] = 'Dying.ogg', -- Dying from damage
            [CHAR_SOUND_DROWNING] = 'Drowning.ogg', -- Running out of air underwater
            [CHAR_SOUND_MAMA_MIA] = 'LeaveLevel.ogg' -- Booted out of level
        },
        healthMeter = {
            label = {
                left = "charHealthleft",
                right = "charHealthright",
            },
            -- Segments 1-8 (Zero is baked into back)
            pie = {
                [1] = "charPie1",
                [2] = "charPie2",
                [3] = "charPie3",
                [4] = "charPie4",
                [5] = "charPie5",
                [6] = "charPie6",
                [7] = "charPie7",
                [8] = "charPie8",
            }
        },
    },
}

--[[
    Everything from here down is character data, and is loaded at the end of the file

    Note that most things here are noted out via use of '--', if there is any
    functionality you'd want to use then remove the '--' in front of the functions.

    If needbe, Replace CHAR in the tables with your character's name
    Ex: E_MODEL_CHAR -> E_MODEL_SQUISHY

    Ensure all file naming is unique from other mods.
    Prefixing your files with your character's name should work fine
    Ex: life-icon.png -> squis
]]

local E_MODEL_CHAR =      smlua_model_util_get_id("custom_model_geo")      -- Located in "actors"
-- local E_MODEL_CHAR_STAR = smlua_model_util_get_id("custom_model_star_geo") -- Located in "actors"

local TEX_CHAR_LIFE_ICON = get_texture_info("exclamation-icon") -- Located in "textures"
-- local TEX_CHAR_STAR_ICON = get_texture_info("exclamation-icon") -- Located in "textures"

-- All sound files are located in "sound" folder
-- Remember to include the file extention in the name
local VOICETABLE_CHAR = {
    [CHAR_SOUND_OKEY_DOKEY] =        'StartGame.ogg', -- Starting game
	[CHAR_SOUND_LETS_A_GO] =         'StartLevel.ogg', -- Starting level
	[CHAR_SOUND_PUNCH_YAH] =         'Punch1.ogg', -- Punch 1
	[CHAR_SOUND_PUNCH_WAH] =         'Punch2.ogg', -- Punch 2
	[CHAR_SOUND_PUNCH_HOO] =         'Punch3.ogg', -- Punch 3
	[CHAR_SOUND_YAH_WAH_HOO] =       {'Jump1.ogg', 'Jump2.ogg', 'Jump3.ogg'}, -- First Jump Sounds
	[CHAR_SOUND_HOOHOO] =            'DoubleJump.ogg', -- Second jump sound
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'TripleJump1.ogg', 'TripleJump2.ogg'}, -- Triple jump sounds
	[CHAR_SOUND_UH] =                'Bonk.ogg', -- Wall bonk
	[CHAR_SOUND_UH2] =               'LongJumpLand.ogg', -- Landing after long jump
	[CHAR_SOUND_UH2_2] =             'LongJumpLand.ogg',
	[CHAR_SOUND_HAHA] =              'TripleJumpLand.ogg', -- Landing triple jump
	[CHAR_SOUND_YAHOO] =             'LongJump.ogg', -- Long jump
	[CHAR_SOUND_DOH] =               'Bonk.ogg', -- Long jump wall bonk
	[CHAR_SOUND_WHOA] =              'GrabLedge.ogg', -- Grabbing ledge
	[CHAR_SOUND_EEUH] =              'ClimbLedge.ogg', -- Climbing over ledge
	[CHAR_SOUND_WAAAOOOW] =          'Falling.ogg', -- Falling a long distance
	[CHAR_SOUND_TWIRL_BOUNCE] =      'FlowerBounce.ogg', -- Bouncing off of a flower spring
	[CHAR_SOUND_GROUND_POUND_WAH] =  'GroundPound.ogg', 
	[CHAR_SOUND_HRMM] =              'Lift.ogg', -- Lifting something
	[CHAR_SOUND_HERE_WE_GO] =        'GetStar.ogg', -- Star get
	[CHAR_SOUND_SO_LONGA_BOWSER] =   'ThrowBowser.ogg', -- Throwing Bowser
--DAMAGE
	[CHAR_SOUND_ATTACKED] = 'Damaged.ogg', -- Damaged
	[CHAR_SOUND_PANTING] = 'Panting.ogg', -- Low health
	[CHAR_SOUND_ON_FIRE] = 'Burned.ogg', -- Burned
--SLEEP SOUNDS
	[CHAR_SOUND_IMA_TIRED] = 'Tired.ogg', -- Mario feeling tired
	[CHAR_SOUND_YAWNING] = 'Yawn.ogg', -- Mario yawning before he sits down to sleep
	[CHAR_SOUND_SNORING1] = 'Snore.ogg', -- Snore Inhale
	[CHAR_SOUND_SNORING2] = 'Exhale.ogg', -- Exhale
	[CHAR_SOUND_SNORING3] = 'SleepTalk.ogg', -- Sleep talking / mumbling
--COUGHING (USED IN THE GAS MAZE)
	[CHAR_SOUND_COUGHING1] = 'Cough1.ogg', -- Cough take 1
	[CHAR_SOUND_COUGHING2] = 'Cough2.ogg', -- Cough take 2
	[CHAR_SOUND_COUGHING3] = 'Cough3.ogg', -- Cough take 3
--DEATH
	[CHAR_SOUND_DYING] = 'Dying.ogg', -- Dying from damage
	[CHAR_SOUND_DROWNING] = 'Drowning.ogg', -- Running out of air underwater
	[CHAR_SOUND_MAMA_MIA] = 'LeaveLevel.ogg' -- Booted out of level
}

-- All Located in "actors" folder
-- (Models do not exist in template)
--[[
local CAPTABLE_CHAR = {
    normal = smlua_model_util_get_id("FILENAME_geo"),
    wing = smlua_model_util_get_id("FILENAME_geo"),
    metal = smlua_model_util_get_id("FILENAME_geo"),
}
]]

local PALETTE_CHAR = {
    [PANTS]  = "ffffff",
    [SHIRT]  = "ffffff",
    [GLOVES] = "ffffff",
    [SHOES]  = "ffffff",
    [HAIR]   = "ffffff",
    [SKIN]   = "ffffff",
    [CAP]    = "ffffff",
	[EMBLEM] = "ffffff"
}

-- All Located in "textures" folder
-- (Textures do not exist in template)
--[[
local HEALTH_METER_CHAR = {
    label = {
        left = get_texture_info("healthleft"),
        right = get_texture_info("healthright"),
    },
    pie = {
        [1] = get_texture_info("Pie1"),
        [2] = get_texture_info("Pie2"),
        [3] = get_texture_info("Pie3"),
        [4] = get_texture_info("Pie4"),
        [5] = get_texture_info("Pie5"),
        [6] = get_texture_info("Pie6"),
        [7] = get_texture_info("Pie7"),
        [8] = get_texture_info("Pie8"),
    }
}
]]

--[[
    Everything from here down where the data is applied

    Note that nothing here other than the 'character_add' function
    is required for a custom character, if you don't have the assets
    then feel free to remove the function from the functions below
]]

-- Interprets Character Data from Table and adds it to Character Select
-- Anything below this does not need to be affected

local TYPE_STRING = "string"
local TYPE_TABLE = "table"

local function log_character_error(charNum, errorString)
    log_to_console(TEXT_MOD_NAME.." - Character "..tostring(charNum)..": "..errorString)
end

local function on_character_select_load()
    for i = 1, #characterData do
        local c = characterData[i]
        local CT_CHAR = _G.charSelect.character_add(c.name, c.description, c.credit, c.color, c.model, c.forceChar, c.lifeIcon, c.camScale, c.offset)
        _G.charSelect.character_add_caps(c.model, c.caps)
        _G.charSelect.character_add_celebration_star(c.model, c.star.model, c.star.texture)
    end

    _G.charSelect.credit_add(TEXT_MOD_NAME, "You", "Pack")

    _G.charSelect.config_character_sounds()
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)