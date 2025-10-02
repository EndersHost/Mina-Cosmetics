dofile_once("data/scripts/lib/utilities.lua")
dofile_once( "mods/Mina-Cosmetics/files/scripts/cosmetics.lua" )
dofile_once( "mods/Mina-Cosmetics/files/scripts/cape_color.lua" )

function OnPlayerSpawned(entity_id)
	local key = "Mina-Cosmetics_MOD_TRYING_TO_MODIFY_PLAYER_DATA_ONLY_ONCE"
	local is_initialized = GlobalsGetValue( key ) 
	if( is_initialized == "yes" ) then
		return
	end
	GlobalsSetValue( key, "yes" )
	
	local x,y = EntityGetTransform( entity_id )
	SetRandomSeed( x, y )
	
	-- SETTINGS
	local randomised_enabled = 		ModSettingGet("Mina-Cosmetics.randomised_enabled")
	
	local cape_enabled = 		ModSettingGet("Mina-Cosmetics.cape_enabled")
	local cape_color = 			ModSettingGet("Mina-Cosmetics.cape_color")
	local hat_enabled = 		ModSettingGet("Mina-Cosmetics.hat_enabled")
	local hat_type = 				ModSettingGet("Mina-Cosmetics.hat_type")
	local amulet_enabled = 	ModSettingGet("Mina-Cosmetics.amulet_enabled")
	local amulet_type = 		ModSettingGet("Mina-Cosmetics.amulet_type")
	
	local helmet_enabled = 	ModSettingGet("Mina-Cosmetics.helmet_enabled")
	local helmet_type = 		ModSettingGet("Mina-Cosmetics.helmet_type")
	local hair_enabled = 		ModSettingGet("Mina-Cosmetics.hair_enabled")
	local hair_type = 			ModSettingGet("Mina-Cosmetics.hair_type")
	local hair_color = 			ModSettingGet("Mina-Cosmetics.hair_color")
	local skin_type = 			ModSettingGet("Mina-Cosmetics.skin_type")
	local body_type = 			ModSettingGet("Mina-Cosmetics.body_type")
	
	-- RNG
	if ( randomised_enabled == "1" ) then
		cape_enabled = tostring(Random( 0, 1 ))
		cape_color = cape_list[Random( 1, #cape_list )].cape
		hat_enabled = tostring(Random( 0, 1 ))
		hat_type = hat_list[Random( 1, #hat_list )].hat
		amulet_enabled = tostring(Random( 0, 1 ))
		amulet_type = amulet_list[Random( 1, #amulet_list )].amulet
		helmet_enabled = tostring(Random( 0, 1 ))
		helmet_type = helmet_list[Random( 1, #helmet_list )].helmet
		hair_enabled = tostring(Random( 0, 1 ))
		hair_type = hair_list[Random( 1, #hair_list )].hair
		hair_color = hair_color_list[Random( 1, #hair_color_list )].hair_color
		skin_type = skin_list[Random( 1, #skin_list )].skin
		body_type = body_list[Random( 1, #body_list )].body
		limbs_enabled = tostring(Random( 0, 1 ))
	end
	
	EntityAddTag(entity_id, skin_type )
	
	-- FIND CHILD INVENTORY, CAPE
	local player_child_entities = EntityGetAllChildren( entity_id )
	if ( player_child_entities ~= nil ) then
		for i,child_entity in ipairs( player_child_entities ) do
			local child_entity_name = EntityGetName( child_entity )
		
			if ( child_entity_name == "cape" ) then
				cape = child_entity
			end
			if ( child_entity_name == "arm_r" ) then
				arm_r = child_entity
			end
		end
	end
	
	-- CAPE
	local cloth_colors      = cloth_color[cape_color]
	if ( cape_enabled == "0" ) then
		EntitySetComponentsWithTagEnabled( cape, "player_cape", false )
	else
		EntitySetComponentsWithTagEnabled( cape, "player_cape", true )
		edit_component( cape, "VerletPhysicsComponent", function(comp,vars) 
			vars.cloth_color = cloth_colors.cloth_color
			vars.cloth_color_edge = cloth_colors.cloth_color_edge
		end)
	end
	
	-- BODY
	local mainlayer_sprite_component = EntityGetFirstComponent( entity_id, "SpriteComponent", "player_mainlayer" )
	local body_sprite_file = "mods/Mina-Cosmetics/files/body_gfx/" .. skin_type ..  "/" .. body_type .. ".xml"
	ComponentSetValue( mainlayer_sprite_component, "image_file", body_sprite_file )
	
	-- ARM
	local player_arm_sprite_component = EntityGetFirstComponent( arm_r, "SpriteComponent" )
	local player_arm_sprite_file = "mods/Mina-Cosmetics/files/arm_gfx/" .. skin_type ..  "/" .. body_type .. ".xml"
	ComponentSetValue( player_arm_sprite_component, "image_file", player_arm_sprite_file )
	
	
	-- HEAD
	local headlayer_sprite_component = EntityGetFirstComponent( entity_id, "SpriteComponent", "player_headlayer" )
	local hairlayer_sprite_component = EntityGetFirstComponent( entity_id, "SpriteComponent", "player_hairlayer" )

	-- HELMET
	if ( helmet_enabled == "1" ) then
		local empty_sprite_file = "mods/Mina-Cosmetics/files/misc_gfx/1px_tp.xml" 
		ComponentSetValue( headlayer_sprite_component, "image_file", empty_sprite_file )
		local head_sprite_file = "mods/Mina-Cosmetics/files/helmet_gfx/" .. helmet_type .. ".xml"
		ComponentSetValue( hairlayer_sprite_component, "image_file", head_sprite_file )
	-- HEAD HAIR
	else
		if ( hair_enabled == "1" ) then
			local head_sprite_file = "mods/Mina-Cosmetics/files/head_gfx/" .. skin_type .. "/" .. hair_color .. ".xml"
			ComponentSetValue( headlayer_sprite_component, "image_file", head_sprite_file )
			local hair_sprite_file = "mods/Mina-Cosmetics/files/hair_gfx/" .. hair_color .. "/" .. hair_type .. ".xml"
			ComponentSetValue( hairlayer_sprite_component, "image_file", hair_sprite_file )
		else
			local head_sprite_file = "mods/Mina-Cosmetics/files/head_gfx/" .. skin_type .. "/bald_hair.xml"
			ComponentSetValue( headlayer_sprite_component, "image_file", head_sprite_file )
		end
	end
	
	-- HAT
	if ( hat_enabled == "1" ) then
		local hat_sprite_component = EntityGetFirstComponent( entity_id, "SpriteComponent", "player_hatlayer" )
		local hat_sprite_file = "mods/Mina-Cosmetics/files/misc_gfx/hat/" .. hat_type ..  ".xml"
		ComponentSetValue( hat_sprite_component, "image_file", hat_sprite_file )
	end
	-- AMULET
	if ( amulet_enabled == "1" ) then
		local amulet_sprite_component = EntityGetFirstComponent( entity_id, "SpriteComponent", "player_amuletlayer" )
		local amulet_sprite_file = "mods/Mina-Cosmetics/files/misc_gfx/amulet/" .. amulet_type ..  ".xml"
		ComponentSetValue( amulet_sprite_component, "image_file", amulet_sprite_file )
	end
	
	-- RAGDOLL
	local damage_sprite_component = EntityGetFirstComponent( entity_id, "DamageModelComponent" )
	local ragdoll_sprite_file = "mods/Mina-Cosmetics/files/ragdolls_gfx/" .. skin_type ..  "/filenames.txt"
	ComponentSetValue( damage_sprite_component, "ragdoll_filenames_file", ragdoll_sprite_file )
end


-- this code runs when all mods' filesystems are registered
