-- Functions namespace :
metal_carpentry = {}

--
-- Functions
--

-- TODO fonctions pour les autres formes de poutres + une fonction register_all_shapes()

-- /!\ Lua doesn't accept nammed parameters !
-- You can emulate it by sending a table of key=value couple
-- as a function parameter
function metal_carpentry.register_ubeam (param_table)
	minetest.register_node("metal_carpentry:ubeam_" .. param_table.subname, {
		description = param_table.description,
		drawtype = "mesh",
		mesh = "metal_carpentry_ubeam.obj",
		tiles = param_table.tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = param_table.groups,
		sounds = param_table.sounds,
		selection_box = {
			type = 'fixed',
			fixed = {
				--right, bottom, back, left, top, front (origine au centre du node)
				{0.25, 0.4, 0.5, -0.25, 0.5, -0.5},
				{0.25, -0.5, 0.5, -0.25, -0.4, -0.5},
				{0.25, -0.5, 0.5, 0.15, 0.5, -0.5},
			},
		},
		collision_box = {
			type = 'fixed',
			fixed = {
				--right, bottom, back, left, top, front (origine au centre du node)
				{0.25, 0.4, 0.5, -0.25, 0.5, -0.5},
				{0.25, -0.5, 0.5, -0.25, -0.4, -0.5},
				{0.25, -0.5, 0.5, 0.15, 0.5, -0.5},
			},
		},
	})

	minetest.register_craft({
		output = "metal_carpentry:ubeam_" .. param_table.subname .. " 10",
		recipe = {
			{param_table.recipeitem, param_table.recipeitem},
			{'', param_table.recipeitem},
			{param_table.recipeitem, param_table.recipeitem},
		}
	})

-- Recette symétrique
	minetest.register_craft({
		output = "metal_carpentry:ubeam_" .. param_table.subname .. " 10",
		recipe = {
			{param_table.recipeitem, param_table.recipeitem},
			{param_table.recipeitem, ''},
			{param_table.recipeitem, param_table.recipeitem},
		}
	})
end

function metal_carpentry.register_hbeam (param_table)
	minetest.register_node ("metal_carpentry:hbeam_" .. param_table.subname, {
		description = param_table.description,
		drawtype = "mesh",
		mesh = "metal_carpentry_hbeam.obj",
		tiles = param_table.tiles,
		groups = param_table.groups,
		is_ground_content = false,
		sounds = param_table.sounds,
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = {
			type = "fixed",
			fixed = {
				{.45, .4, .5, -.45, .5, -.5},
				{.45, -.5, .5, -.45, -.4, -.5},
				{.05, -.5, .5, -.05, .5, -.5}
			}
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{.45, .4, .5, -.45, .5, -.5},
				{.45, -.5, .5, -.45, -.4, -.5},
				{.05, -.5, .5, -.05, .5, -.5}
			}
		},
	}) -- fin d'appel register_node

	minetest.register_craft({
		output = 'metal_carpentry:hbeam_' .. param_table.subname .. ' 10',
		recipe = {
			{param_table.recipeitem, param_table.recipeitem, param_table.recipeitem},
			{"", param_table.recipeitem, ""},
			{param_table.recipeitem, param_table.recipeitem, param_table.recipeitem}
		}
	}) -- fin d'appel register_craft
end

function metal_carpentry.register_lbeam (param_table)
	minetest.register_node ("metal_carpentry:lbeam_" .. param_table.subname, {
		description = param_table.description,
		drawtype = "mesh",
		mesh = "metal_carpentry_lbeam.obj",
		tiles = param_table.tiles,
		groups = param_table.groups,
		is_ground_content = false,
		sounds = param_table.sounds,
		paramtype = "light",
		paramtype2 = "facedir",
		selection_box = {
			type = "fixed",
			fixed = {
				{.5, -.5, .5, .4, .5, -.5},
				{.5, -.5, .5, -.5, -.4, -.5}
			}
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{.5, -.5, .5, .4, .5, -.5},
				{.5, -.5, .5, -.5, -.4, -.5}
			}
		},
	}) -- fin d'appel register_node

	minetest.register_craft({
		output = 'metal_carpentry:lbeam_' .. param_table.subname .. ' 10',
		recipe = {
			{param_table.recipeitem, "", ""},
			{param_table.recipeitem, "", ""},
			{param_table.recipeitem, param_table.recipeitem, param_table.recipeitem}
		}
	}) -- fin d'appel register_craft

minetest.register_craft({
		output = 'metal_carpentry:lbeam_' .. param_table.subname .. ' 10',
		recipe = {
			{"", "", param_table.recipeitem},
			{"", "", param_table.recipeitem},
			{param_table.recipeitem, param_table.recipeitem, param_table.recipeitem}
		}
	}) -- fin d'appel register_craft
end

function metal_carpentry.register_all_shapes (param_table)
	metal_carpentry.register_hbeam({
		subname = param_table.subname,
		description = param_table.hdesc,
		tiles = param_table.tiles,
		groups = param_table.groups,
		sounds = param_table.sounds,
		recipeitem = param_table.recipeitem
	})

	metal_carpentry.register_lbeam({
		subname = param_table.subname,
		description = param_table.ldesc,
		tiles = param_table.tiles,
		groups = param_table.groups,
		sounds = param_table.sounds,
		recipeitem = param_table.recipeitem
	})

	metal_carpentry.register_ubeam({
		subname = param_table.subname,
		description = param_table.udesc,
		tiles = param_table.tiles,
		groups = param_table.groups,
		sounds = param_table.sounds,
		recipeitem = param_table.recipeitem
	})

end



--
-- Définition des nodes
-- Nodes definitions
--

minetest.register_node('metal_carpentry:corrugated_iron_block', {
	description = 'Rusty iron block',
	tiles = {'metal_carpentry_corrugated_iron.png'},
	groups = {cracky=1, level=2, corrugated=1},
	is_ground_content = false,
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node('metal_carpentry:corrugated_bronze_block', {
	description = 'Old bronze block',
	tiles = {'metal_carpentry_corrugated_bronze.png'},
	groups = {cracky=1, level=2, corrugated=1},
	is_ground_content = false,
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node('metal_carpentry:engraved_steel_block', {
	description = 'Engraved steel block',
	tiles = {'metal_carpentry_engraved_steel.png'},
	groups = {cracky=1, level=2, corrugated=1},
	is_ground_content = false,
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node('metal_carpentry:brushed_steel_block', {
	description = 'Brushed steel block',
	tiles = {'metal_carpentry_brushed_steel.png'},
	groups = {cracky=1, level=2, corrugated=1},
	is_ground_content = false,
	sounds = default.node_sound_metal_defaults(),
})




--
-- Stairs and slabs
--
-- function stairs.register_stair_and_slab(subname, recipeitem,
-- groups, images, desc_stair, desc_slab, sounds)
stairs.register_stair_and_slab(
	"corrugated_iron",
	"metal_carpentry:corrugated_iron_block",
	{cracky = 1, level = 2, corrugated=1},
	{"metal_carpentry_corrugated_iron.png"},
	"Rusty iron stair",
	"Rusty iron slab",
	default.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"corrugated_bronze",
	"metal_carpentry:corrugated_bronze_block",
	{cracky = 1, level = 2, corrugated=1},
	{"metal_carpentry_corrugated_bronze.png"},
	"Old bronze stair",
	"Old bronze slab",
	default.node_sound_metal_defaults()
)



--
-- Beams
--

metal_carpentry.register_all_shapes({
	subname = "corrugated_bronze",
	tiles = {"metal_carpentry_corrugated_bronze.png"},
	recipeitem = "metal_carpentry:corrugated_bronze_block",
	groups = {cracky=1, level=2, corrugated=1},
	sounds = default.node_sound_metal_defaults(),
	hdesc = "Old bronze H beam",
	ldesc = "Old bronze L beam",
	udesc = "Old bronze U beam"
})

metal_carpentry.register_all_shapes({
	subname = "corrugated_iron",
	tiles = {"metal_carpentry_corrugated_iron.png"},
	recipeitem = "metal_carpentry:corrugated_iron_block",
	groups = {cracky=1, level=2, corrugated=1},
	sounds = default.node_sound_metal_defaults(),
	hdesc = "Rusty iron H beam",
	ldesc = "Rusty iron L beam",
	udesc = "Rusty iron U beam"
})

metal_carpentry.register_all_shapes({
	subname = "engraved_steel",
	tiles = {"metal_carpentry_engraved_steel.png"},
	recipeitem = "metal_carpentry:engraved_steel_block",
	groups = {cracky=1, level=2, corrugated=1},
	sounds = default.node_sound_metal_defaults(),
	hdesc = "Engraved steel H beam",
	ldesc = "Engraved steel L beam",
	udesc = "Engraved steel U beam"
})

metal_carpentry.register_all_shapes({
	subname = "brushed_steel",
	tiles = {"metal_carpentry_brushed_steel.png"},
	recipeitem = "metal_carpentry:brushed_steel_block",
	groups = {cracky=1, level=2, corrugated=1},
	sounds = default.node_sound_metal_defaults(),
	hdesc = "Brushed steel H beam",
	ldesc = "Brushed steel L beam",
	udesc = "Brushed steel U beam"
})

metal_carpentry.register_all_shapes({
	subname = "steel",
	tiles = {"default_steel_block.png"},
	recipeitem = "default:steelblock",
	groups = {cracky=1, level=2, corrugated=1},
	sounds = default.node_sound_metal_defaults(),
	hdesc = "Steel H beam",
	ldesc = "Steel L beam",
	udesc = "Steel U beam"
})

--
-- Définition des craft
--

minetest.register_craft({
	type = 'shapeless',
	output = 'metal_carpentry:corrugated_iron_block 1',
	recipe = {'default:dirt', 'default:steelblock'},
})

minetest.register_craft({
	type='shapeless',
	output='metal_carpentry:corrugated_bronze_block 1',
	recipe={'default:dirt', 'default:bronzeblock'},
})

minetest.register_craft({
	type='shapeless',
	output='metal_carpentry:engraved_steel_block 1',
	recipe={'default:stone', 'default:steelblock'},
})

minetest.register_craft({
	type='shapeless',
	output='metal_carpentry:brushed_steel_block 1',
	recipe={'default:cobble', 'default:steelblock'},
})


--
-- ABM defs
--

-- Steel corrugation
minetest.register_abm({
	label = "Steel corrugation",          -- Pas d'influence en jeu
	nodenames = {"default:steelblock"}, -- Nodes concernés par la transformation
	interval = 60,                       -- Durée de la transformation (en secondes)
	chance = 2,                         -- Probabilité (1/x)
	catch_up = true,                    -- Pour corriger un bug…
	neighbors = {"group:water", "group:snowy", "group:corrugated", "default:ice"},   -- Nodes dont le voisinage provoque la transformation
	action = function(pos, node, active_object_count, active_object_count_wider)         -- Action (pas forcément un remplacement de node…)
		minetest.set_node(pos, {name="metal_carpentry:corrugated_iron_block"})
	end })


-- Bronze corrugation
minetest.register_abm({
	label = "Bronze corrugation",          -- Pas d'influence en jeu
	nodenames = {"default:bronzeblock"}, -- Nodes concernés par la transformation
	interval = 60,                       -- Durée de la transformation (en secondes)
	chance = 2,                         -- Probabilité (1/x)
	catch_up = true,                    -- Pour corriger un bug…
	neighbors = {"group:water", "group:snowy", "group:corrugated", "default:ice"},   -- Nodes dont le voisinage provoque la transformation
	action = function(pos, node, active_object_count, active_object_count_wider)         -- Action (pas forcément un remplacement de node…)
		minetest.set_node(pos, {name="metal_carpentry:corrugated_bronze_block"})
	end })


