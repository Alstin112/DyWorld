
local dy = "dyworld-"
local dyworld_path_item_group = "__DyWorld__/graphics/item-group/"

Data_Table_Item_Group = {
	{
		Name = "items-2",
		Type = "main",
		Icon = "items.png"
	},
	{
		Name = "gears",
		Type = "sub",
		Main = "items-2"
	},
	{
		Name = "circuit-01-cables",
		Type = "sub",
		Main = "items-2"
	},
	{
		Name = "circuit-02-coils",
		Type = "sub",
		Main = "items-2"
	},
	{
		Name = "circuit-03-pcbs",
		Type = "sub",
		Main = "items-2"
	},
	{
		Name = "circuit-04-circuits",
		Type = "sub",
		Main = "items-2"
	},
}

function DyWorld_Item_Main_Group(NAME, ICON)
  local result =
  {
    type = "item-group",
    name = dy..NAME,
    icon = dyworld_path_item_group..ICON,
    icon_size = 64,
    order = "z-"..dy..NAME,
  }
  return result
end

function DyWorld_Item_Sub_Group(NAME, MAIN)
  local result =
  {
    type = "item-subgroup",
    name = dy..NAME,
    group = dy..MAIN,
    order = dy..NAME
  }
  return result
end

for k,v in pairs(Data_Table_Item_Group) do
	if v.Type == "main" then
		data:extend(
			{
				DyWorld_Item_Main_Group(v.Name, v.Icon)
			})
	elseif v.Type == "sub" then
		data:extend(
			{
				DyWorld_Item_Sub_Group(v.Name, v.Main)
			})
	end
end