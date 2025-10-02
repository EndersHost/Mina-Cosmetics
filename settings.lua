dofile("data/scripts/lib/mod_settings.lua") -- see this file for documentation on some of the features.


function mod_setting_bool_custom( mod_id, gui, in_main_menu, im_id, setting )
	local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
	local text = setting.ui_name .. " - " .. GameTextGet( value and "$option_on" or "$option_off" )

	if GuiButton( gui, im_id, mod_setting_group_x_offset, 0, text, 1, "data/fonts/font_pixel_runes.xml", true ) then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), not value, false )
	end

	mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
end

function mod_setting_change_callback( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	print( tostring(new_value) )
end

local mod_id = "Mina-Cosmetics" -- This should match the name of your mod's folder.
mod_settings_version = 1 -- This is a magic global that can be used to migrate settings to new mod versions. call mod_settings_get_version() before mod_settings_update() to get the old value. 
mod_settings = 
{
	{
		category_id = "functional",
		ui_name = "",
		foldable = false,
		_folded = false,
		settings = {
			{
				id = "randomised_enabled",
				ui_name = "Random",
				value_default = "1",
				values = { 
					{"1","(*)"}, 
					{"0","(  )"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
		},
	},
	{
		category_id = "head",
		ui_name = "Head",
		foldable = true,
		_folded = true,
		settings = {
			{
				id = "helmet_enabled",
				ui_name = "Enable Helmet",
				value_default = "1",
				values = { 
					{"1","(*)"}, 
					{"0","(  )"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "helmet_type",
				ui_name = "Helmet Type",
				value_default = "hood_alchemist",
				values = { 
					-- HOOD
					{"hood_alchemist","Alchemist"},
					{"hood_alchemist_alt","Alchemist Alt"},
					{"hood_enlightened","Enlightened"},
					{"hood_enlightened_alt","Enlightened Alt"},
					{"hood_highalchemist","High Alchemist"},
					{"hood_highenlightened","High Enlightened"},
					-- SCAVENGER
					{"scavenger","Scavenger"},
					{"scavenger_poison","Big Poison"},
					{"scavenger_leader","Scavenger Leader"},
					{"scavenger_alchemist","Scavenger Alchemist"},
					{"scavenger_alchemist_alt","Scavenger Alchemist Alt"},
					-- ROBOT
					{"monk","Monk"},
					{"sentry","Sentry"},
					{"necrobot","Necrobot"},
					{"coward","Coward"},
					-- CREATURE
					{"fungus","Fungus"},
					{"armor","Helmet"}, 
					{"skull","Skull"},
					{"skull_fire","Skull Fire"},
					{"elk","Elk"},
					{"rat","Rat"},
					{"eye","Eye"},
					{"bloom","Bloom"},
					{"maggot","Maggot"},
					{"headless","Headless"},
					-- WIZARD
					{"wizard_wither","Wizard Wither"},
					{"wizard_weaken","Wizard Weaken"},
					{"wizard_twitchy","Wizard Twitchy"},
					{"wizard_tele","Wizard Tele"},
					{"wizard_returner","Wizard Returner"},
					{"wizard_poly","Wizard Poly"},
					{"wizard_neutral","Wizard Neutral"},
					{"wizard_hearty","Wizard Hearty"},
					{"wizard_dark","Wizard Dark"},
					{"wizard_swapper","Wizard Swapper"},
					{"wizard_barfer","Wizard Barfer"},
					{"wizard_master","Wizard Master"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				ui_fn = mod_setting_vertical_spacing,
				not_setting = true,
			},
			{
				id = "hair_enabled",
				ui_name = "Enable Hair",
				value_default = "1",
				values = { 
					{"1","(*)"}, 
					{"0","(  )"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "hair_type",
				ui_name = "Hair Type",
				value_default = "short",
				values = { 
					{"short","Short"},
					{"down","Down"},
					{"down_alt","Down Alt"},
					{"up","Up"},
					{"side","Side"},
					{"side_alt","Side Alt"},
					{"tied","Tied"},
					{"tied_alt","Tied Alt"},
					{"bigbun","Big Bun"},
					{"bigbun_alt","Big Bun Alt"},
					{"highbuns","High Buns"},
					{"highbuns_alt","High Buns Alt"},
					{"lowbuns","Low Buns"},
					{"afro","Afro"},
					{"braid","Braid"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "hair_color",
				ui_name = "Hair Color",
				value_default = "light_hair",
				values = { 
					{"light_hair","Light"}, 
					{"dark_hair","Dark"}, 
					{"red_hair","Red"}, 
					{"gold_hair","Gold"}, 
					{"spirit_hair","Spirit"},
					{"ghost_hair","Ghost"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
		},
	},
	{
		category_id = "body_type",
		ui_name = "Body",
		foldable = true,
		_folded = true,
		settings = {
			{
				id = "skin_type",
				ui_name = "Skin Type",
				value_default = "pale_skin",
				values = { 
					-- HUMAN
					{"pale_skin","Pale"}, 
					{"light_skin","Light"},  
					{"tan_skin","Tan"}, 
					{"dark_skin","Dark"},
					-- ALCHEMIST
					{"alchemist_skin","Alchemist"},
					{"highalchemist_skin","High Alchemist"},
					{"hell_skin","Hell"},
					{"toxic_skin","Toxic"}, 
					-- ROBOT
					{"assasin_skin","Assasin"}, 
					{"monk_skin","Monk"}, 
					{"robot_skin","Robot"}, 
					{"machine_skin","Machine"}, 
					-- MONSTER
					{"hamis_skin","Hamis"},
					{"creep_skin","Creep"}, 
					{"skeleton_skin","Skeleton"},
					{"necromancer_skin","Necromancer"},
					-- OTHER
					{"spirit_skin","Spirit"}, 
					{"ghost_skin","Ghost"}, 
					{"stone_skin","Stone"},
					{"gold_skin","Gold"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "body_type",
				ui_name = "Outfit Type",
				value_default = "naked",
				values = { 
					{"naked","Naked"}, 
					-- AlCHEMIST
					{"alchemist","Alchemist"},
					{"alchemist_short","Short Alchemist"},
					{"alchemist_high","High Alchemist"},
					-- PEASANT
					{"peasant","Peasant"}, 
					{"peasant_belt","Belt Peasant"}, 
					{"peasant_tshirt","Tshirt Peasant"}, 
					{"peasant_femboy","Skirt Peasant"},
					{"miner","Miner"}, 
					{"miner_weak","Weak Miner"},
					{"dress","Dress"}, 
					{"dress_belt","Belt Dress"},  
					{"dress_skirt","Skirt Dress"}, 
					{"gown","Gown"},
					{"gown_thin","Thin Gown"},
					{"gown_skirt","Skirt Gown"},
					-- PERK
					{"monk","Monk"},  
					{"armor","Armor"},
					{"armor_dress","Dress Armor"},
					{"necromancer","Necromancer"},
					{"necromancer_armor","Armor Necromancer"},
					-- SCAVENGER
					{"scavenger","Scavenger"},
					{"scavenger_shield","Scavenger Shield"},
					{"scavenger_support","Scavenger Support"},
					{"scavenger_coward","Scavenger Coward"},
					{"scavenger_alchemist","Scavenger Alchemist"},
					-- WIZARD
					{"wizard_wither","Wizard Wither"},
					{"wizard_weaken","Wizard Weaken"},
					{"wizard_twitchy","Wizard Twitchy"},
					{"wizard_tele","Wizard Tele"},
					{"wizard_returner","Wizard Returner"},
					{"wizard_poly","Wizard Poly"},
					{"wizard_neutral","Wizard Neutral"},
					{"wizard_hearty","Wizard Hearty"},
					{"wizard_dark","Wizard Dark"},
					{"wizard_swapper","Wizard Swapper"},
					{"wizard_barfer","Wizard Barfer"},
					{"wizard_master","Wizard Master"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				ui_fn = mod_setting_vertical_spacing,
				not_setting = true,
			},
		},
	},
	{
		category_id = "misc",
		ui_name = "Misc",
		foldable = true,
		_folded = true,
		settings = {
			{
				id = "hat_enabled",
				ui_name = "Enable Hat",
				value_default = "1",
				values = { 
					{"1","(*)"}, 
					{"0","(  )"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "hat_type",
				ui_name = "Hat Type",
				value_default = "crown_big",
				values = { 
					{"crown","Crown"},
					{"crown_iron","Crown Iron"},
					{"crown_gem","Crown Gem"},
					{"miner","Miner"}, 
					{"cowboy","Cowboy"}, 
					{"wizard","Wizard"},
					{"flower","Flower"},
					{"horns","Horns"},
					{"antlers","Antlers"},
					{"antlers_spirit","Antlers Spirit"},
					{"santa","Santa"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				ui_fn = mod_setting_vertical_spacing,
				not_setting = true,
			},
			{
				id = "cape_enabled",
				ui_name = "Enable cape",
				value_default = "1",
				values = { 
					{"1","(*)"}, 
					{"0","(  )"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "cape_color",
				ui_name = "Cape Color",
				value_default = "alchemist",
				values = { 
					{"alchemist","Alchemist"}, 
					{"hamis","Hamis"}, 
					{"monk","Monk"},  
					{"ghost","Ghost"}, 
					{"copper","copper"},  
					{"spirit","Spirit"}, 
					{"plastic","Plastic"},
					{"antler","Antler"},
					{"gold","Gold"},  
					{"peasant","Peasant"},
					{"necromancer","Necromancer"},
					{"iron","Iron"},  
					{"old","Old"}, 
					{"silk","Silk"}, 
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				ui_fn = mod_setting_vertical_spacing,
				not_setting = true,
			},
			{
				id = "amulet_enabled",
				ui_name = "Enable Amulet",
				value_default = "1",
				values = { 
					{"1","(*)"}, 
					{"0","(  )"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "amulet_type",
				ui_name = "Amulet Type",
				value_default = "amulet",
				values = { 
					{"amulet","Amulet"}, 
					{"amulet_gold","Gold Amulet"},
					{"amulet_gold_gem","Gold Gem Amulet"},
					{"amulet_iron","Iron Amulet"},
					{"amulet_iron_gem","Iron Gem Amulet"},
					{"bottle","Bottle"},
					{"back","Back"},
					{"back_shield","Back Shield"},
					{"back_rocket","Back Rocket"},
					{"back_rocket_alt","Back Rocket Alt"},
				},
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				ui_fn = mod_setting_vertical_spacing,
				not_setting = true,
			},
		},
	},
}



function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
	
end
