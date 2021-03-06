module("gui_1", package.seeall)
-- gui_1 is the stats menu
require "script/stats/functions"

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function closeGUI(player, id)
	if player.gui.top.dyworld_stats_1_gui then
		player.gui.top.dyworld_stats_1_gui.destroy()
		player.gui.top.dyworld_stats_2_gui.destroy()
		player.gui.top.dyworld_stats_3_gui.destroy()
	end
end

function openGui(player, id)
	local mp = global.dyworld.Players
	local gsc = global.players[id].stats.crafted or 1
	local gsm = global.players[id].stats.mined or 1
	local gsb = global.players[id].stats.build or 1
	local gsp = global.players[id].stats.pickup or 1
	local gsk = global.stats.killed or 1
	local gss = global.stats.scanned or 1
	local gsr = global.stats.research or 1
	local gsgb = global.stats.ghostbuild or 1
	local gsgm = global.stats.ghostmined or 1
	local p1 = global.players[id].physical.strength
	local p2 = global.players[id].physical.endurance
	local p3 = global.players[id].physical.speed
	local p4 = global.players[id].physical.creations
	local p5 = global.players[id].physical.implants 
	local m1 = global.players[id].mystical.spirit
	local m2 = global.players[id].mystical.intelligence
	local m3 = global.players[id].mystical.wisdom
	local m4 = global.players[id].mystical.guile
	local m5 = global.players[id].mystical.knowledge
	local frame1 = player.gui.top.add{type = "frame", name = "dyworld_stats_1_gui", direction = "vertical", caption = {"dyworld_stats_gui.title"}}
	local frame2 = player.gui.top.add{type = "frame", name = "dyworld_stats_2_gui", direction = "vertical", caption = {"dyworld_stats_gui.title"}}
	local frame3 = player.gui.top.add{type = "frame", name = "dyworld_stats_3_gui", direction = "vertical", caption = {"dyworld_stats_gui.title"}}
	local frameflow1 = frame1.add{type = "flow", name = "flow", direction = "vertical"}
	local frameflow2 = frame2.add{type = "flow", name = "flow", direction = "vertical"}
	local frameflow3 = frame3.add{type = "flow", name = "flow", direction = "vertical"}
	stats_functions.BodySkills(id)
	if not global.dyworld.Max_Research then
		require "script/startup"
		global.dyworld.Max_Research = startup.Research_Calc()
	end
	-- labels for stats_1
	frameflow1.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.stats_1", (game.players[id].name)}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_level", (global.players[id].Level or 0)}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_xp"}}
	frameflow1.add{type = "progressbar", size = 26, value = (global.players[id].XP/global.players[id].XP_LevelUp)}
	--frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_xp", (global.players[id].XP or 0)}}
	--frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_xplevel", (global.players[id].XP_LevelUp or 0)}}
	--frameflow1.add{type = "label", caption = "XP TO LEVEL FRACT: "..(global.players[id].XP/global.players[id].XP_LevelUp)}
	if (#game.players <= 1) then
		frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_crafted", (global.players[id].stats.crafted or 0)}}
		frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_mined", (global.players[id].stats.mined or 0)}}
		frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_build", (global.players[id].stats.build or 0)}}
	else
		frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_crafted_mp", (global.players[id].stats.crafted or 0), (global.stats.crafted or 0)}}
		frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_mined_mp", (global.players[id].stats.mined or 0), (global.stats.mined or 0)}}
		frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_build_mp", (global.players[id].stats.build or 0), (global.stats.build or 0)}}
	end
	if settings.startup["DyWorld_Story"].value or settings.startup["DyWorld_Needs"].value then
		frameflow1.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_needs_gui.title"}}
		frameflow1.add{type = "label", caption = {"dyworld_needs_gui.food"}}
		frameflow1.add{type = "progressbar", size = 26, value = (global.players[id].Food/global.players[id].Food_Max)}
		frameflow1.add{type = "label", caption = {"dyworld_needs_gui.water"}}
		frameflow1.add{type = "progressbar", size = 26, value = (global.players[id].Water/global.players[id].Water_Max)}
	end
	frameflow1.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.stats_2"}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_killed", (global.stats.killed or 0)}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_evo", (Round(game.forces.enemy.evolution_factor * 100, 2) or 0)}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_scanned", (global.stats.scanned or 0)}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_research", (global.stats.research or 0)}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_research_done", (Round(((global.stats.research or 1) / global.dyworld.Max_Research) * 100, 1) or 0)}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_ghostbuild", (global.stats.ghostbuild or 0)}}
	frameflow1.add{type = "label", caption = {"dyworld_stats_gui.stats_ghostmined", (global.stats.ghostmined or 0)}}
	-- labels for stats_2
	frameflow2.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.body", (game.players[id].name)}}
	frameflow2.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_physical"}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_strength", (global.players[id].physical.strength)}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_endurance", (global.players[id].physical.endurance)}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_speed", (global.players[id].physical.speed)}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_creations", (global.players[id].physical.creations)}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_implants", (global.players[id].physical.implants)}}
	frameflow2.add{type = "label", style = "dyworld_stats_header_label", caption = {"dyworld_stats_gui.body_mystical"}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_spirit", (global.players[id].mystical.spirit)}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_intelligence", (global.players[id].mystical.intelligence)}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_wisdom", (global.players[id].mystical.wisdom)}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_guile", (global.players[id].mystical.guile)}}
	frameflow2.add{type = "label", caption = {"dyworld_stats_gui.body_knowledge", (global.players[id].mystical.knowledge)}}
	-- labels for stats_3
	frameflow3.add{type = "label", style = "dyworld_stats_divider_header_label", caption = {"dyworld_stats_gui.stats_3", (game.players[id].name)}}
	frameflow3.add{type = "label", caption = "Health: "..game.entity_prototypes["player"].max_health + game.players[id].character_health_bonus}
	frameflow3.add{type = "label", caption = "Inventory Slots: "..game.entity_prototypes["player"].get_inventory_size(1) + game.players[id].character_inventory_slots_bonus}
	frameflow3.add{type = "label", caption = "Running Speed: "..(game.players[id].character_running_speed_modifier+1)}
	frameflow3.add{type = "label", caption = "Loot Pickup Range: "..math.floor(game.players[id].character_loot_pickup_distance_bonus+2)}
	frameflow3.add{type = "label", caption = "Robot Follower Count: "..math.floor(game.players[id].character_maximum_following_robot_count_bonus)}
	frameflow3.add{type = "label", caption = "Mining Speed: "..Round(game.players[id].character_mining_speed_modifier+1, 2)}
	frameflow3.add{type = "label", caption = "Crafting Speed: "..Round(game.players[id].character_crafting_speed_modifier+1, 2)}
	frameflow3.add{type = "label", caption = "Reach Distance: "..math.floor(game.players[id].character_reach_distance_bonus+6)}
	frameflow3.add{type = "label", caption = "Build Distance: "..math.floor(game.players[id].character_build_distance_bonus+6)}
	frameflow3.add{type = "label", caption = "Resource Reach Distance: "..math.floor(game.players[id].character_resource_reach_distance_bonus+2.7)}
end
