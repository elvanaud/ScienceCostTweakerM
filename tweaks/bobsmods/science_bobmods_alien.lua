if mods["bobtech"] and mods["bobenemies"] and settings.startup["bobmods-enemies-enablenewartifacts"] and settings.startup["bobmods-enemies-enablenewartifacts"].value and settings.startup["bobmods-enemies-enableartifacts"] and settings.startup["bobmods-enemies-enableartifacts"].value then
-- science groups
data:extend ({
	{
		type = "item-subgroup",
		name = "sct-alien-science-pack",
		group = "sct-science",
		order = "k[alien]",
	},
})

-- technology lab
data:extend({
	{
		type = "technology",
		name = "sct-lab-alien",
		icon_size = 128,
		icons =
		{
			{
				icon = "__ScienceCostTweakerM__/graphics/bobmods/alien-lab-128.png",
			},
			{
				icon = "__ScienceCostTweakerM__/graphics/overlays/alien-128.png",
			},
		},		
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "bob-lab-alien",
			},
		},
		prerequisites =
		{
			"chemical-science-pack",
			"military-science-pack",
		},
		unit =
		{
			count = 45,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
			},
			time = 30,
		},
		order = "sct-lab-d[alien]",
	},
})

-- technology science packs
data:extend({
	{
		type = "technology",
		name = "sct-science-pack-gold",
		icon = "__ScienceCostTweakerM__/graphics/bobmods/gold-science-pack-128.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "bob-science-pack-gold",
			},
		},
		prerequisites =
		{
			"chemical-science-pack",
			"military-science-pack",
		},
		unit =
		{
			count = 90,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
			},
			time = 3,
		},
		order = "sct-pack-d[gold]",
	},

	{
		type = "technology",
		name = "sct-alien-science-pack",
		icon = "__ScienceCostTweakerM__/graphics/bobmods/alien-science-pack-128.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "bob-alien-science-pack",
			},
--[[			
			{
				type = "unlock-recipe",
				recipe = "bob-alien-science-pack-blue",
			},
			{
				type = "unlock-recipe",
				recipe = "bob-alien-science-pack-orange",
			},
			{
				type = "unlock-recipe",
				recipe = "bob-alien-science-pack-purple",
			},
			{
				type = "unlock-recipe",
				recipe = "bob-alien-science-pack-yellow",
			},
			{
				type = "unlock-recipe",
				recipe = "bob-alien-science-pack-green",
			},
			{
				type = "unlock-recipe",
				recipe = "bob-alien-science-pack-red",
			},
]]--			
		},
		prerequisites =
		{
			"sct-science-pack-gold",
			"sct-lab-alien",
		},
		unit =
		{
			count = 120,
			ingredients = 
			{
				{"bob-science-pack-gold", 1},
			},
			time = 4,
		},
		order = "sct-pack-e[alien]",
	},
})
sctm.tech_unlock_remove("bob-alien-research", "bob-science-pack-gold")
sctm.tech_unlock_remove("bob-alien-research", "bob-alien-science-pack")
end
