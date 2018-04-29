require "data/prefix"

local Table = {
	{ 
		Name = "stone", 
		Table = "Stone", 
		Type = "Primitive", 
		Tier = 1,
		DMG_Type = "physical",
	},
	{ 
		Name = "wood", 
		Table = "Wood", 
		Type = "Primitive", 
		Tier = 1,
		DMG_Type = "physical",
	},
	{ 
		Name = "obsidian", 
		Table = "Obsidian", 
		Type = "Primitive", 
		Tier = 1,
		DMG_Type = "physical",
	},
	{ 
		Name = "rubber", 
		Table = "Rubber", 
		Type = "Primitive", 
		Tier = 1,
		DMG_Type = "physical",
	},
	{ 
		Name = "copper", 
		Table = "Copper", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "iron", 
		Table = "Iron", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "chromium", 
		Table = "Chromium", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "zinc", 
		Table = "Zinc", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "tin", 
		Table = "Tin", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "silver", 
		Table = "Silver", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "gold", 
		Table = "Gold", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "lead", 
		Table = "Lead", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "poison",
	},
	{ 
		Name = "tungsten", 
		Table = "Tungsten", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "nickel", 
		Table = "Nickel", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "aluminium", 
		Table = "Aluminium", 
		Type = "Basic", 
		Tier = 2,
		DMG_Type = "physical",
	},
	{ 
		Name = "uranium", 
		Table = "Uranium", 
		Type = "Alloy", 
		Tier = 4,
		DMG_Type = "radiation",
	},
	{ 
		Name = "steel", 
		Table = "Steel", 
		Type = "Simple_Alloy", 
		Tier = 3,
		DMG_Type = "physical",
	},
}

for k,v in pairs(Table) do
    table.insert(Material_Table, Table[k])
end