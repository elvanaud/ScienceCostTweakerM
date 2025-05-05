if mods["bobtech"] then
  -- science groups
  data:extend ({
    {
      type = "item-subgroup",
      name = "sct-advanced-logistic-science-pack",
      group = "sct-science",
      order = "h_a[logistic]",
    },
  })

  -- technology
  data:extend({
    {
      type = "technology",
      name = "sct-advanced-logistic-science-pack",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/logistic-science-pack-128.png",
      icon_size = 128,
      essential = true,
      effects =
      {
--[[      
        {
          type = "unlock-recipe",
          recipe = "bob-advanced-logistic-science-pack",
        },
]]--        
        {
          type = "unlock-recipe",
          recipe = "sct-logistic-cargo-unit",
        },
        {
          type = "unlock-recipe",
          recipe = "sct-logistic-memory-unit",
        },
        {
          type = "unlock-recipe",
          recipe = "sct-logistic-unimover",
        },
        {
          type = "unlock-recipe",
          recipe = "sct-logistic-automated-storage",
        },
      },
      prerequisites =
      {
--        "chemical-science-pack"
      },
      unit =
      {
        count = 90,
        ingredients = 
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
        },
        time = 30,
      },
      order = "sct-pack-d[logistic]",
    },
  })
  if not mods["bobelectronics"] then
    sctm.tech_dependency_add("sct-advanced-logistic-science-pack", "circuit-network")
  elseif mods["bobplates"] then 
    sctm.tech_dependency_add("sct-advanced-logistic-science-pack", "processing-unit")
  else
    sctm.tech_dependency_add("sct-advanced-logistic-science-pack", "processing-unit")
    sctm.tech_dependency_add("sct-advanced-logistic-science-pack", "circuit-network")
  end

  -- logistic pack items
  data:extend ({
    {
      type = "item",
      name = "sct-logistic-cargo-unit",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-cargo-unit.png",
      icon_size = 32,
      subgroup = "sct-advanced-logistic-science-pack",
      order = "h_a[logistic]-b[cargo]",
      stack_size = 200,
    },

    {
      type = "item",
      name = "sct-logistic-unimover",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-unimover.png",
      icon_size = 32,
      subgroup = "sct-advanced-logistic-science-pack",
      order = "h_a[logistic]-c[unimover]",
      stack_size = 200,
    },

    {
      type = "item",
      name = "sct-logistic-automated-storage",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-automated-storage.png",
      icon_size = 32,
      subgroup = "sct-advanced-logistic-science-pack",
      order = "h_a[logistic]-d[storage]",
      stack_size = 200,
    },

    {
      type = "item",
      name = "sct-logistic-memory-unit",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-memory-unit.png",
      icon_size = 32,
      subgroup = "sct-advanced-logistic-science-pack",
      order = "h_a[logistic]-e[memory-unit]",
      stack_size = 200,
    },  
  })

  -- logistic science pack
  data:extend({
    {
      type = "recipe",
      name = "sct-advanced-logistic-science-pack",
      subgroup = "sct-advanced-logistic-science-pack",
      order = "h_a[logistic]",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/logistic-science-pack.png",
      icon_size = 32,
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
          { type="item", name="bob-advanced-logistic-science-pack", amount=2 },
        },
      },
      ]]--
      expensive = 
      {
        enabled = false,
        always_show_made_in = true,
        energy_required = 14,
        ingredients = 
        {
          { type="item", name="sct-logistic-cargo-unit", amount=1 },
          { type="item", name="sct-logistic-memory-unit", amount=1 },
        },
        results =
        {
          { type="item", name="bob-advanced-logistic-science-pack", amount=2 },
        },
      },
      normal = 
      {
        enabled = false,
        always_show_made_in = true,
        energy_required = 14,
        ingredients = 
        {
          { type="item", name="sct-logistic-cargo-unit", amount=1 },
          { type="item", name="sct-logistic-memory-unit", amount=1 },
        },
        results =
        {
          { type="item", name="bob-advanced-logistic-science-pack", amount=2 },
        },
      },
    }
  })

  -- logistic intermediate recipes
  data:extend ({
    {
      type = "recipe",
      name = "sct-logistic-cargo-unit",
      subgroup = "sct-advanced-logistic-science-pack",
      order = "h_a[logistic]-b[cargo]",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-cargo-unit.png",
      icon_size = 32,
      --[[
      expensive =
      {
        enabled = false,
        energy_required = 7.5,
        ingredients =
        {
          {"sct-logistic-unimover", 2},
          {"sct-logistic-automated-storage", 3},
        },
        results = 
        {
          {type="item", name="sct-logistic-cargo-unit", amount=1},
        },
      },
      ]]--
      expensive =
      {
        enabled = false,
        energy_required = 3,
        ingredients =
        {
          {"sct-logistic-unimover", 1},
          {"sct-logistic-automated-storage", 1},
        },
        results = 
        {
          {type="item", name="sct-logistic-cargo-unit", amount=1},
        },
      },
      normal =
      {
        enabled = false,
        energy_required = 3,
        ingredients =
        {
          {"sct-logistic-unimover", 1},
          {"sct-logistic-automated-storage", 1},
        },
        results = 
        {
          {type="item", name="sct-logistic-cargo-unit", amount=1},
        },
      },
    },
  })

  if mods["bobplates"] then
    data:extend({
      {
        type = "recipe",
        name = "sct-logistic-automated-storage",
        subgroup = "sct-advanced-logistic-science-pack",
        order = "h_a[logistic]-d[storage]",
        icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-automated-storage.png",
        icon_size = 32,
        expensive =
        {
          enabled = false,
          energy_required = 4,
          ingredients =
          {
            {"bob-titanium-gear-wheel", 6},
            {"bob-cobalt-steel-bearing-ball", 6},
            {"processing-unit", 2},
            {"bob-brass-alloy", 4},
          },
          results = 
          {
            {type="item", name="sct-logistic-automated-storage", amount=1},
          },
        },
        normal =
        {
          enabled = false,
          energy_required = 2,
          ingredients =
          {
            {"bob-titanium-gear-wheel", 3},
            {"bob-cobalt-steel-bearing-ball", 3},
            {"processing-unit", 1},
            {"bob-brass-alloy", 2},
          },
          results = 
          {
            {type="item", name="sct-logistic-automated-storage", amount=1},
          },
        },
      },    
    })

    data:extend({ 
      {
        type = "recipe",
        name = "sct-logistic-unimover",
        subgroup = "sct-advanced-logistic-science-pack",
        order = "h_a[logistic]-c[unimover]",
        category = "crafting-with-fluid",
        icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-unimover.png",
        icon_size = 32,
        expensive =
        {
          enabled = false,
          energy_required = 4,
          ingredients =
          {
            {"advanced-circuit", 8},
            {"bob-titanium-bearing-ball", 12},
            {"bob-cobalt-steel-gear-wheel", 12},
            {"bob-aluminium-plate",15},
            {type="fluid", name="lubricant",amount=50}
          },
          results = 
          {
            {type="item", name="sct-logistic-unimover", amount=1},
          },
        },
        normal =
        {
          enabled = false,
          energy_required = 2,
          ingredients =
          {
            {"advanced-circuit", 4},
            {"bob-titanium-bearing-ball", 6},
            {"bob-cobalt-steel-gear-wheel", 6},
            {"bob-aluminium-plate",8},
            {type="fluid", name="lubricant",amount=20}
          },
          results = 
          {
            {type="item", name="sct-logistic-unimover", amount=1},
          },
        },
      },
    })
    sctm.tech_dependency_add("sct-advanced-logistic-science-pack", "bob-cobalt-processing")
    sctm.tech_dependency_add("sct-advanced-logistic-science-pack", "bob-titanium-processing")
  else
    data:extend({
      {
        type = "recipe",
        name = "sct-logistic-automated-storage",
        subgroup = "sct-advanced-logistic-science-pack",
        order = "h_a[logistic]-d[storage]",
        icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-automated-storage.png",
        icon_size = 32,
        expensive =
        {
          enabled = false,
          energy_required = 4,
          ingredients =
          {
            {"fast-inserter", 1},
            {"steel-chest", 3},
          },
          results = 
          {
            {type="item", name="sct-logistic-automated-storage", amount=1},
          },
        },
        normal =
        {
          enabled = false,
          energy_required = 2,
          ingredients =
          {
            {"fast-inserter", 1},
            {"steel-chest", 2},
          },
          results = 
          {
            {type="item", name="sct-logistic-automated-storage", amount=1},
          },
        },
      },
    })

    data:extend({ 
      {
        type = "recipe",
        name = "sct-logistic-unimover",
        subgroup = "sct-advanced-logistic-science-pack",
        order = "h_a[logistic]-c[unimover]",
        icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-unimover.png",
        icon_size = 32,
        expensive =
        {
          enabled = false,
          energy_required = 4,
          ingredients =
          {
            {"flying-robot-frame", 1},
            {"express-transport-belt", 2},
          },
          results = 
          {
            {type="item", name="sct-logistic-unimover", amount=1},
          },
        },
        normal =
        {
          enabled = false,
          energy_required = 2,
          ingredients =
          {
            {"flying-robot-frame", 1},
            {"express-transport-belt", 2},
          },
          results = 
          {
            {type="item", name="sct-logistic-unimover", amount=1},
          },
        },
      },
    })
    sctm.tech_dependency_add("sct-advanced-logistic-science-pack", "robotics")
    sctm.tech_dependency_add("sct-advanced-logistic-science-pack", "logistics-3")
  end

  if not mods["bobelectronics"] then
    data:extend({
      {
        type = "recipe",
        name = "sct-logistic-memory-unit",
        subgroup = "sct-advanced-logistic-science-pack",
        order = "h_a[logistic]-e[memory-unit]",
        icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-memory-unit.png",
        icon_size = 32,
        expensive =
        {
          enabled = false,
          energy_required = 4,
          ingredients =
          {
            {"arithmetic-combinator", 2},
            {"constant-combinator", 3},
          },
          results = 
          {
            {type="item", name="sct-logistic-memory-unit", amount=1},
          },
        },
        normal =
        {
          enabled = false,
          energy_required = 2,
          ingredients =
          {
            {"arithmetic-combinator", 1},
            {"constant-combinator", 2},
          },
          results = 
          {
            {type="item", name="sct-logistic-memory-unit", amount=1},
          },
        },
      },
    })
  elseif mods["bobplates"] then
    data:extend({
      {
        type = "recipe",
        name = "sct-logistic-memory-unit",
        subgroup = "sct-advanced-logistic-science-pack",
        order = "h_a[logistic]-e[memory-unit]",
        icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-memory-unit.png",
        icon_size = 32,
        expensive =
        {
          enabled = false,
          energy_required = 4,
          ingredients =
          {
            {"bob-gilded-copper-cable", 6},
            {"bob-integrated-electronics", 4},
            {"bob-solder", 4}
          },
          results = 
          {
            {type="item", name="sct-logistic-memory-unit", amount=1},
          },
        },
        normal =
        {
          enabled = false,
          energy_required = 2,
          ingredients =
          {
            {"bob-gilded-copper-cable", 3},
            {"bob-integrated-electronics", 2},
            {"bob-solder", 2}
          },
          results = 
          {
            {type="item", name="sct-logistic-memory-unit", amount=1},
          },
        },
      },
    })
  else
    data:extend({
      {
        type = "recipe",
        name = "sct-logistic-memory-unit",
        subgroup = "sct-advanced-logistic-science-pack",
        order = "h_a[logistic]-e[memory-unit]",
        icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-memory-unit.png",
        icon_size = 32,
        expensive =
        {
          enabled = false,
          energy_required = 4,
          ingredients =
          {
            {"bob-integrated-electronics", 4},
            {"constant-combinator", 3},
          },
          results = 
          {
            {type="item", name="sct-logistic-memory-unit", amount=1},
          },
        },
        normal =
        {
          enabled = false,
          energy_required = 2,
          ingredients =
          {
            {"bob-integrated-electronics", 4},
            {"constant-combinator", 2},
          },
          results = 
          {
            {type="item", name="sct-logistic-memory-unit", amount=1},
          },
        },
      },
    })
  end
end
