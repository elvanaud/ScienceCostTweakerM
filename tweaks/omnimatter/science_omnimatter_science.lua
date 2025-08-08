if mods["omnimatter_science"] and mods["omnimatter_crystal"] then
	-- science groups
	data:extend ({
		{
			type = "item-subgroup",
			name = "sct-omni-science-pack",
			group = "sct-science",
			order = "e_a[omni]",
		},
	})
	-- omnipack technology - replaced with omnipack-technology in omniscience mod
	--[[
	data:extend({
		{
			type = "technology",
			name = "sct-research-omni",
			icon = "__ScienceCostTweakerM__/graphics/omni/omni-pack-128.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "omni-pack",
				},
			},
			prerequisites =
			{
				"crystallology-1", 
				"logistic-science-pack",
				"logistics-2",
			},
			unit =
			{
				count = 60,
				ingredients = 
				{
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
				},
				time = 20,
			},
			order = "sct-pack-c[omni]",
		},
	})
	]]--

	-- omni pack intermediates
	data:extend ({
		{
			type = "item",
			name = "sct-omni-pack-minerals",
			icon = "__omnimatter_crystal__/graphics/icons/shattered-omnine.png",
			icon_size = 32,
			subgroup = "sct-omni-science-pack",
			order = "e_a[omni]-b[minerals]",
			stack_size = 200,
		},

		{
			type = "item",
			name = "sct-omni-pack-tools",
			icon = "__omnimatter_crystal__/graphics/icons/crystal-reactor.png",
			icon_size = 32,
			subgroup = "sct-omni-science-pack",
			order = "e_a[omni]-c[tools]",
			stack_size = 200,
		},
	})

	-- logistic science pack
	data:extend({
		{
			type = "recipe",
			name = "sct-omni-science-pack",
			subgroup = "sct-omni-science-pack",
			order = "e_a[omni]",
			--[[
			expensive = 
			{
				enabled = false,
				energy_required = 20,
				ingredients = 
				{
					{ type="item", name="sct-logistic-cargo-unit", amount=3 },
					{ type="item", name="sct-logistic-memory-unit", amount=2 },
				},
				results =
				{
					{ type="item", name="advanced-logistic-science-pack", amount=2 },
				},
			},
			]]--
			-- expensive = 
			-- {
			-- 	enabled = false,
			-- 	energy_required = 10,
			-- 	ingredients = 
			-- 	{
			-- 		{ type="item", name="sct-omni-pack-tools", amount=1 },
			-- 		{ type="item", name="sct-omni-pack-minerals", amount=1 },
			-- 	},
			-- 	results =
			-- 	{
			-- 		{ type="item", name="omni-pack", amount=2 },
			-- 	},
			-- },
			enabled = false,
			energy_required = 10,
			ingredients = 
			{
				{ type="item", name="sct-omni-pack-tools", amount=1 },
				{ type="item", name="sct-omni-pack-minerals", amount=1 },
			},
			results =
			{
				{ type="item", name="omni-pack", amount=2 },
			},
		}
	})

	-- omnipack intermediate recipes
	data:extend ({
		{
			type = "recipe",
			name = "sct-omni-pack-minerals",
			subgroup = "sct-omni-science-pack",
			order = "e_a[omni]-b[minerals]",
			category = "crafting-with-fluid",
			-- expensive =
			-- {
			-- 	enabled = false,
			-- 	energy_required = 5,
			-- 	ingredients =
			-- 	{
			-- 		{type="fluid", name="omniston", amount=80},
			-- 		{"iron-ore-crystal", 4},
			-- 	},
			-- 	results = 
			-- 	{
			-- 		{type="item", name="sct-omni-pack-minerals", amount=1},
			-- 	},
			-- },
			enabled = false,
			energy_required = 3,
			ingredients =
			{
				{type="fluid", name="omniston", amount=20},
				{type = "item", name = "iron-ore-crystal", amount = 2},
			},
			results = 
			{
				{type="item", name="sct-omni-pack-minerals", amount=1},
			},
		},
		{
			type = "recipe",
			name = "sct-omni-pack-tools",
			subgroup = "sct-omni-science-pack",
			order = "e_a[omni]-c[tools]",
			-- expensive =
			-- {
			-- 	enabled = false,
			-- 	energy_required = 5,
			-- 	ingredients =
			-- 	{
			-- 		{"fast-transport-belt", 4},
			-- 		{"fast-inserter", 4},
			-- 	},
			-- 	results = 
			-- 	{
			-- 		{type="item", name="sct-omni-pack-tools", amount=1},
			-- 	},
			-- },
			enabled = false,
			energy_required = 3,
			ingredients =
			{
				{type = "item", name = "fast-transport-belt", amount = 2},
				{type = "item", name = "fast-inserter", amount = 2},
			},
			results = 
			{
				{type="item", name="sct-omni-pack-tools", amount=1},
			},
		},
	})
end
