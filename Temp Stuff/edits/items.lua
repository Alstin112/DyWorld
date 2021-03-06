
StackSizes = {
	{Name = "iron-ore", Amount = 200, Type = "item"},
	{Name = "copper-ore", Amount = 200, Type = "item"},
	{Name = "iron-plate", Amount = 200, Type = "item"},
	{Name = "copper-plate", Amount = 200, Type = "item"},
	{Name = "steel-plate", Amount = 200, Type = "item"},
	{Name = "stone", Amount = 200, Type = "item"},
	{Name = "wood", Amount = 200, Type = "item"},
	{Name = "raw-wood", Amount = 200, Type = "item"},
	{Name = "coal", Amount = 200, Type = "item"},
	{Name = "pipe", Amount = 100, Type = "item"},
	{Name = "pipe-to-ground", Amount = 100, Type = "item"},
	{Name = "transport-belt", Amount = 200, Type = "item"},
	{Name = "fast-transport-belt", Amount = 200, Type = "item"},
	{Name = "express-transport-belt", Amount = 200, Type = "item"},
	{Name = "stone-brick", Amount = 200, Type = "item"},
	{Name = "plastic-bar", Amount = 200, Type = "item"},
	{Name = "landfill", Amount = 200, Type = "item"},
}

for k,v in pairs(StackSizes) do
	data.raw[v.Type][v.Name].stack_size = v.Amount
end