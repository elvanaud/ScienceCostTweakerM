if mods["angelsbioprocessing"] then
  -- science groups
  data:extend ({
    {
      type = "item-subgroup",
      name = "sct-bio-science-pack",
      group = "sct-science",
      order = "d_a[bio]",
    },
  })

  -- bio pack items
  data:extend ({
    {
      type = "tool",
      name = "sct-bio-science-pack",
      icon = "__ScienceCostTweakerM__/graphics/angelsmods/sct-bio-science-pack-64.png",
      icon_size = 64,
      subgroup = "sct-bio-science-pack",
      order = "d_a[bio]",
      stack_size = 200,
      durability = 1,
      durability_description_key = "description.science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value",
    },

    {
      type = "item",
      name = "sct-bio-ground-sample",
      icon = "__ScienceCostTweakerM__/graphics/angelsmods/sct-bio-ground-sample.png",
      icon_size = 32,
      subgroup = "sct-bio-science-pack",
      order = "d_a[bio]-b[groundsample]",
      stack_size = 200,
    },

    {
      type = "item",
      name = "sct-bio-sample-scaffold",
      icon = "__ScienceCostTweakerM__/graphics/angelsmods/sct-bio-sample-scaffold.png",
      icon_size = 32,
      subgroup = "sct-bio-science-pack",
      order = "d_a[bio]-c[scaffold]",
      stack_size = 200,
    },

    {
      type = "item",
      name = "sct-bio-sample-filling",
      icon = "__ScienceCostTweakerM__/graphics/angelsmods/sct-bio-sample-filling.png",
      icon_size = 32,
      subgroup = "sct-bio-science-pack",
      order = "d_a[bio]-d[filling]",
      stack_size = 200,
    },
  })

  -- bio pack & intermediate recipes
  data:extend (
  {
    {
      type = "recipe",
      name = "sct-bio-science-pack",
      subgroup = "sct-bio-science-pack",
      order = "d_a[bio]",
      icon = "__ScienceCostTweakerM__/graphics/angelsmods/sct-bio-science-pack-64.png",
      icon_size = 64,
      expensive =
      {
        enabled = false,
        always_show_made_in = true,
        energy_required = 5,
        ingredients =
        {
          {"sct-bio-ground-sample", 1},
          {"token-bio", 1},
        },
        results = 
        {
          {type="item", name="sct-bio-science-pack", amount=1},
        },
      },
      
      normal = {
        enabled = false,
        always_show_made_in = true,
        energy_required = 5,
        ingredients =
        {
          {type = "item", name = "sct-bio-ground-sample", amount = 1},
          {type = "item", name = "token-bio", amount = 1},
        },
        results = 
        {
          {type="item", name="sct-bio-science-pack", amount=1},
        },
      },
    },
    
    {
      type = "recipe",
      name = "sct-bio-ground-sample",
      subgroup = "sct-bio-science-pack",
      order = "d_a[bio]-b[groundsample]",
      icon = "__ScienceCostTweakerM__/graphics/angelsmods/sct-bio-ground-sample.png",
      icon_size = 32,
      expensive =
      {
        enabled = false,
        energy_required = 10,
        ingredients =
        {
          {"sct-bio-sample-scaffold", 2},
          {"sct-bio-sample-filling", 1},
        },
        results = 
        {
          {type="item", name="sct-bio-ground-sample", amount=1},
        },
      },
      normal =
      {
        enabled = false,
        energy_required = 5,
        ingredients =
        {
          {"sct-bio-sample-scaffold", 1},
          {"sct-bio-sample-filling", 1},
        },
        results = 
        {
          {type="item", name="sct-bio-ground-sample", amount=1},
        },
      },
    },
    
    {
      type = "recipe",
      name = "sct-bio-sample-scaffold",
      subgroup = "sct-bio-science-pack",
      order = "d_a[bio]-c[scaffold]",
      icon = "__ScienceCostTweakerM__/graphics/angelsmods/sct-bio-sample-scaffold.png",
      icon_size = 32,
      expensive =
      {
        enabled = false,
        energy_required = 4,
        ingredients =
        {
          {"wood", 2},
          {"solid-paper", 4},
        },
        results = 
        {
          {type="item", name="sct-bio-sample-scaffold", amount=1},
        },
      },
      normal =
      {
        enabled = false,
        energy_required = 2,
        ingredients =
        {
          {"wood", 1},
          {"solid-paper", 2},
        },
        results = 
        {
          {type="item", name="sct-bio-sample-scaffold", amount=1},
        },
      },
    },

    {
      type = "recipe",
      name = "sct-bio-sample-filling",
      subgroup = "sct-bio-science-pack",
      order = "d_a[bio]-d[filling]",
      category = "liquifying",
      icon = "__ScienceCostTweakerM__/graphics/angelsmods/sct-bio-sample-filling.png",
      icon_size = 32,
      expensive =
      {
        enabled = false,
        energy_required = 4,
        ingredients =
        {
          {"solid-soil", 2},
          {"solid-compost", 4},
          {type="fluid", name="water", amount=200},
        },
        results = 
        {
          {type="item", name="sct-bio-sample-filling", amount=1},
        },
      },
      normal =
      {
        enabled = false,
        energy_required = 2,
        ingredients =
        {
          {"solid-soil", 1},
          {"solid-compost", 2},
          {type="fluid", name="water", amount=100},
        },
        results = 
        {
          {type="item", name="sct-bio-sample-filling", amount=1},
        },
      },
    },
  })

  -- bio pack technology
  data:extend({
    {
      type = "technology",
      name = "sct-bio-science-pack",
      icon = "__ScienceCostTweakerM__/graphics/angelsmods/sct-bio-science-pack-128.png",
      icon_size = 128,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "sct-bio-science-pack",
        },
        {
          type = "unlock-recipe",
          recipe = "sct-bio-ground-sample",
        },
        {
          type = "unlock-recipe",
          recipe = "sct-bio-sample-scaffold",
        },
        {
          type = "unlock-recipe",
          recipe = "sct-bio-sample-filling",
        },
      },
      prerequisites =
      {
        "gardens",
        "bio-paper-1",
      },
      unit =
      {
        count = 60,
        ingredients = 
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
        },
        time = 20,
      },
      order = "sct-pack-b[bio]",
    },
  })
  angelsmods.functions.allow_productivity("sct-bio-science-pack")
end
