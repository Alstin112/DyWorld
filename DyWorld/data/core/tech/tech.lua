require "data/prefix"

local Data_Table = {
	{
		Name = dy.."mining-tools-1",
		Icon = {{icon = dyworld_path_tech.."tools.png"}},
		Tech_Ingredients = 1,
		Count = 50,
		Military = false,
	},
	{
		Name = dy.."mining-tools-2",
		Icon = {{icon = dyworld_path_tech.."tools.png"}},
		Pre_Req = {dy.."mining-tools-1"},
		Tech_Ingredients = 2,
		Count = 250,
		Military = false,
	},
	{
		Name = dy.."repair-tools-1",
		Icon = {{icon = dyworld_path_tech.."repair.png"}},
		Pre_Req = {"automation"},
		Tech_Ingredients = 2,
		Count = 150,
		Military = false,
	},
	{
		Name = dy.."repair-tools-2",
		Icon = {{icon = dyworld_path_tech.."repair.png"}},
		Pre_Req = {dy.."repair-tools-1"},
		Tech_Ingredients = 4,
		Count = 450,
		Military = false,
	},
	{
		Name = "electric-energy-distribution-3",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-distribution.png"}},
		Pre_Req = {"electric-energy-distribution-2"},
		Tech_Ingredients = 5,
		Count = 250,
		Military = false,
	},
	{
		Name = "solar-energy-2",
		Icon = {{icon = "__base__/graphics/technology/solar-energy.png"}},
		Pre_Req = {"solar-energy"},
		Tech_Ingredients = 3,
		Count = 250,
		Military = false,
	},
	{
		Name = "solar-energy-3",
		Icon = {{icon = "__base__/graphics/technology/solar-energy.png"}},
		Pre_Req = {"solar-energy-2"},
		Tech_Ingredients = 5,
		Count = 250,
		Military = false,
	},
	{
		Name = "electric-energy-accumulators-2",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-acumulators.png"}},
		Pre_Req = {"electric-energy-accumulators-1"},
		Tech_Ingredients = 3,
		Count = 250,
		Military = false,
	},
	{
		Name = "electric-energy-accumulators-3",
		Icon = {{icon = "__base__/graphics/technology/electric-energy-acumulators.png"}},
		Pre_Req = {"electric-energy-accumulators-2"},
		Tech_Ingredients = 5,
		Count = 350,
		Military = false,
	},
	{
		Name = dy.."electric-miners-1",
		Icon = {{icon = "__base__/graphics/technology/mining-productivity.png"}},
		Pre_Req = {"automation"},
		Tech_Ingredients = 2,
		Count = 250,
		Military = false,
	},
	{
		Name = dy.."electric-miners-2",
		Icon = {{icon = "__base__/graphics/technology/mining-productivity.png"}},
		Pre_Req = {dy.."electric-miners-1"},
		Tech_Ingredients = 5,
		Count = 550,
		Military = false,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
{
  {
    type = "technology",
   	name = v.Name,
    icons = v.Icon,
    effects = { },
    prerequisites = {},
    unit =
    {
      count = v.Count,
      ingredients = {},
      time = v.Time or 30
    },
    order = v.Name,
	upgrade = true,
  },
})
	if v.Tech_Ingredients == 1 then
		local results = {{"science-pack-1", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 2 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 3 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 4 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1},{"production-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 5 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1},{"production-science-pack", 1},{"high-tech-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	elseif v.Tech_Ingredients == 6 then
		local results = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1},{"production-science-pack", 1},{"high-tech-science-pack", 1},{"space-science-pack", 1}}
		data.raw.technology[v.Name].unit.ingredients = results
	end
	if v.Military then
		local results = {"military-science-pack", 1}
		table.insert(data.raw.technology[v.Name].unit.ingredients,results)
	end
	if v.Pre_Req then
		data.raw.technology[v.Name].prerequisites = v.Pre_Req
	end
end