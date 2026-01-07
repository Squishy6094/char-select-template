-- name: [CS] Template
-- description: <Mod Description Here>\n\nMade by: <Creator Name Here>\n\n\\#ff7777\\This Pack requires Character Select\nto use as a Library!
-- category: cs

-- Replace Mod Name with your Character/Pack name.
local TEXT_PACK_NAME = "Custom Character Pack"

-- Stops mod from loading if Character Select isn't on, Does not need to be touched
if not charSelect then
    djui_popup_create(
    "\\#ffffa0\\"..TEXT_PACK_NAME.." requires\nCharacter Select to be enabled.\n\nPlease rehost with it enabled.", 4)
    return
end

--[[
    Everything from here down is character data, and is loaded at the end of the file

    This table is a very simplified format of character creation, and is by no means the
    only way to do it. This is intended for those who do not know how to code, and just
    looking to get their character in-game easily (or those looking for a github repo
    template to easily clone.)

    Ensure all file naming is unique from other mods.
    Prefixing your files with your character's name should work fine
    Ex: exclamation-icon -> squishy-icon
    
    API Documentation for Character Select can be found below:
    https://github.com/Squishy6094/character-select-coop/wiki/API-Documentation
]]

characterTable = {
    {
        -- Basic Character Info
        name = "Custom Character",
        nickname = "Dialog Name",
        description = "This is a description that tells about your character.",
        credits = "Creator",
        color = { r = 255, g = 255, b = 255 },               -- Menu Color
        model = smlua_model_util_get_id("template_mario_geo"), -- Replace custom_model to your character model's name.
        forceChar = CT_MARIO,                                -- Builds upon Vanilla Character
        lifeIcon = get_texture_info("exclamation-icon"),     -- File extension (.png) not needed here, converted to .tex on refresh
        camScale = 1,                                        -- Sets the camera scale of your character in the CS menu

        graffiti = get_texture_info("exclamation-icon"),

        -- Health Meter Textures
        meter = {
            label = {
                left = get_texture_info("char_select_custom_meter_left"),
                right = get_texture_info("char_select_custom_meter_right"),
            },
            pie = {
                [1] = get_texture_info("char_select_custom_meter_pie1"),
                [2] = get_texture_info("char_select_custom_meter_pie2"),
                [3] = get_texture_info("char_select_custom_meter_pie3"),
                [4] = get_texture_info("char_select_custom_meter_pie4"),
                [5] = get_texture_info("char_select_custom_meter_pie5"),
                [6] = get_texture_info("char_select_custom_meter_pie6"),
                [7] = get_texture_info("char_select_custom_meter_pie7"),
                [8] = get_texture_info("char_select_custom_meter_pie8"),
            }
        },

        -- Cap Models (Not In Template)
        caps = {
            normal = smlua_model_util_get_id("custom_cap_geo"),
            wing = smlua_model_util_get_id("custom_wing_cap_geo"),
            metal = smlua_model_util_get_id("custom_metal_cap_geo"),
            metalWing = smlua_model_util_get_id("custom_metal_wing_cap_geo")
        },

        -- Character Palettes
        palettes = {
            {
                name     = "Default",
                [PANTS]  = 'ffffff',
                [SHIRT]  = 'ffffff',
                [GLOVES] = 'ffffff',
                [SHOES]  = 'ffffff',
                [HAIR]   = 'ffffff',
                [SKIN]   = 'ffffff',
                [CAP]    = 'ffffff',
                [EMBLEM] = 'ffffff'
            },
            {
                name     = "Alt",
                [PANTS]  = 'ffffff',
                [SHIRT]  = 'ffffff',
                [GLOVES] = 'ffffff',
                [SHOES]  = 'ffffff',
                [HAIR]   = 'ffffff',
                [SKIN]   = 'ffffff',
                [CAP]    = 'ffffff',
                [EMBLEM] = 'ffffff'
            },
        },

        -- Replaces the vanilla character sounds.
        -- Sounds in 16000hz ('0' in quality) and mono are recommended for optimization and authenticity.
        -- (.aiff, .ogg, and .mp3 are supported)
        voices = {
            [CHAR_SOUND_OKEY_DOKEY] =         'CustomStartGame.ogg', -- Starting game
        	[CHAR_SOUND_LETS_A_GO] =          'CustomStartLevel.ogg', -- Starting level
        	[CHAR_SOUND_GAME_OVER] =          'CustomGameOver.ogg', -- Game Overed
        	[CHAR_SOUND_PUNCH_YAH] =          'CustomPunch1.ogg', -- Punch 1
        	[CHAR_SOUND_PUNCH_WAH] =          'CustomPunch2.ogg', -- Punch 2
        	[CHAR_SOUND_PUNCH_HOO] =          'CustomPunch3.ogg', -- Punch 3
        	[CHAR_SOUND_YAH_WAH_HOO] =       {'CustomJump1.ogg', 'CustomJump2.ogg', 'CustomJump3.ogg'}, -- First Jump Sounds
        	[CHAR_SOUND_HOOHOO] =             'CustomDoubleJump.ogg', -- Second jump sound
        	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'CustomTripleJump1.ogg', 'CustomTripleJump2.ogg'}, -- Triple jump sounds
        	[CHAR_SOUND_UH] =                 'CustomBonk.ogg', -- Soft wall bonk
        	[CHAR_SOUND_UH2] =                'CustomLedgeGetUp.ogg', -- Quick ledge get up
        	[CHAR_SOUND_UH2_2] =              'CustomLongJumpLand.ogg', -- Landing after long jump
        	[CHAR_SOUND_DOH] =                'CustomBonk.ogg', -- Hard wall bonk
        	[CHAR_SOUND_OOOF] =               'CustomBonk.ogg', -- Attacked in air
        	[CHAR_SOUND_OOOF2] =              'CustomBonk.ogg', -- Land from hard bonk
        	[CHAR_SOUND_HAHA] =               'CustomTripleJumpLand.ogg', -- Landing triple jump
        	[CHAR_SOUND_HAHA_2] =             'CustomWaterLanding.ogg', -- Landing in water from big fall
        	[CHAR_SOUND_YAHOO] =              'CustomLongJump.ogg', -- Long jump
        	[CHAR_SOUND_DOH] =                'CustomBonk.ogg', -- Long jump wall bonk
        	[CHAR_SOUND_WHOA] =               'CustomGrabLedge.ogg', -- Grabbing ledge
        	[CHAR_SOUND_EEUH] =               'CustomClimbLedge.ogg', -- Climbing over ledge
        	[CHAR_SOUND_WAAAOOOW] =           'CustomFalling.ogg', -- Falling a long distance
        	[CHAR_SOUND_TWIRL_BOUNCE] =       'CustomFlowerBounce.ogg', -- Bouncing off of a flower spring
        	[CHAR_SOUND_GROUND_POUND_WAH] =   'CustomGroundPound.ogg', -- Ground Pound after startup
        	[CHAR_SOUND_WAH2] =               'CustomThrow.ogg', -- Throwing something
        	[CHAR_SOUND_HRMM] =               'CustomLift.ogg', -- Lifting something
        	[CHAR_SOUND_HERE_WE_GO] =         'CustomGetStar.ogg', -- Star get
        	[CHAR_SOUND_SO_LONGA_BOWSER] =    'CustomThrowBowser.ogg', -- Throwing Bowser
        --DAMAGE
        	[CHAR_SOUND_ATTACKED] =     'CustomDamaged.ogg', -- Damaged
        	[CHAR_SOUND_PANTING] =      'CustomPanting.ogg', -- Low health
        	[CHAR_SOUND_PANTING_COLD] = 'CustomPanting.ogg', -- Getting cold
        	[CHAR_SOUND_ON_FIRE] =      'CustomBurned.ogg', -- Burned
        --SLEEP SOUNDS
        	[CHAR_SOUND_IMA_TIRED] = 'CustomTired.ogg', -- Mario feeling tired
        	[CHAR_SOUND_YAWNING] =   'CustomYawn.ogg', -- Mario yawning before he sits down to sleep
        	[CHAR_SOUND_SNORING1] =  'CustomSnore.ogg', -- Snore Inhale
        	[CHAR_SOUND_SNORING2] =  'CustomExhale.ogg', -- Exhale
        	[CHAR_SOUND_SNORING3] =  'CustomSleepTalk.ogg', -- Sleep talking / mumbling
        --COUGHING (USED IN THE GAS MAZE)
        	[CHAR_SOUND_COUGHING1] = 'CustomCough1.ogg', -- Cough take 1
        	[CHAR_SOUND_COUGHING2] = 'CustomCough2.ogg', -- Cough take 2
        	[CHAR_SOUND_COUGHING3] = 'CustomCough3.ogg', -- Cough take 3
        --DEATH
        	[CHAR_SOUND_DYING] =    'CustomDying.ogg', -- Dying from damage
        	[CHAR_SOUND_DROWNING] = 'CustomDrowning.ogg', -- Running out of air underwater
        	[CHAR_SOUND_MAMA_MIA] = 'CustomLeaveLevel.ogg' -- Booted out of level
        },
        
        -- Replaces Vanilla Animations or Adds Custom Animations.
        anims = {
            -- CS Menu Anim Pose
            [charSelect.CS_ANIM_MENU] = 'CS_CUSTOM',
        },

        -- Forces Eye State if in Animation.
        eyes = {
            [charSelect.CS_ANIM_MENU] = MARIO_EYES_OPEN,
        },

        -- Forces Hand State if in Animation.
        hands = {
            [charSelect.CS_ANIM_MENU] = MARIO_HAND_PEACE_SIGN,
        },
    },

    -- Copy and Paste below to add another character in the table.
}

-- This function loads and applies Character Data based on the table above, does not need to be touched
local function on_character_select_load()
    for i, char in pairs(characterTable) do
        local _ENV = setmetatable(char, { __index = _G })
        tablePos = charSelect.character_add(name, description, credits, color, model, forceChar, lifeIcon, camScale)
        -- if caps then character_add_caps(model, caps) end
        if voices then charSelect.character_add_voice(model, voices) end
        if palettes then
            for i = 1, #palettes do
                charSelect.character_add_palette_preset(model, palettes[i], palettes[i].name)
            end
        end
        charSelect.character_set_category(tablePos, TEXT_PACK_NAME)
        charSelect.character_add_graffiti(tablePos, graffiti)

        if anims then charSelect.character_add_animations(model, anims, eyes, hands) end

        if meter then charSelect.character_add_health_meter(tablePos, meter) end
    end
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)