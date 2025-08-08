if mods["bobelectronics"] or mods["boblogistics"] or mods["bobplates"] then
  sctm.recipe_ingredient_remove("sct-t3-flash-fuel", "petroleum-gas")
  sctm.recipe_ingredient_add("sct-t3-flash-fuel", {type="fluid", name="heavy-oil", amount=10}, {type="fluid", name="heavy-oil", amount=20})
  sctm.recipe_ingredient_add("sct-t3-flash-fuel", {type="fluid", name="light-oil", amount=10}, {type="fluid", name="light-oil", amount=20})
  sctm.tech_dependency_remove("sct-production-science-pack", "advanced-oil-processing")
end

if mods["boblibrary"] then
  if data.raw["recipe-category"]["bob-electronics"] then
    sctm.set_category("sct-t2-instruments", "bob-electronics")
    sctm.set_category("sct-t2-wafer-stamp", "bob-electronics")
    sctm.set_category("sct-mil-circuit1", "bob-electronics")
    sctm.set_category("sct-mil-circuit2", "bob-electronics")
    sctm.set_category("sct-mil-circuit3", "bob-electronics")
    sctm.set_category("sct-prod-bioprocessor", "bob-electronics")
  end

  if data.raw["recipe-category"]["bob-electronics-with-fluid"] then
    sctm.set_category("sct-prod-overclocker", "bob-electronics-with-fluid")
    sctm.set_category("sct-prod-chipcase", "bob-electronics-with-fluid")
  end
end

if mods["bobplates"] then

  -- Red Science Pack:
  -- =============================

  sctm.tech_dependency_remove("steel-processing", "sct-automation-science-pack")

  sctm.tech_dependency_add("bob-air-compressor-1", "sct-automation-science-pack")
  sctm.tech_dependency_add("bob-alloy-processing", "sct-automation-science-pack")
  sctm.tech_dependency_add("bob-chemical-processing-1", "sct-automation-science-pack")
  sctm.tech_dependency_add("bob-electrolysis-1", "sct-automation-science-pack")
  sctm.tech_dependency_add("bob-water-bore-1", "sct-automation-science-pack")

  -- Green Science Pack:
  -- =============================

  if data.raw.item["bob-tin-plate"] then
    sctm.recipe_ingredient_replace("sct-t2-instruments", "iron-plate", "bob-tin-plate")
  end

  if data.raw.item["bob-lead-plate"] then
    sctm.recipe_ingredient_replace("sct-t2-micro-wafer", "iron-plate", "bob-lead-plate")
  end

  if data.raw.item["bob-tinned-copper-cable"] then
    sctm.recipe_ingredient_replace("sct-t2-reaction-nodes", "sct-t1-magnet-coils", "bob-tinned-copper-cable")
  end
  
  -- Blue Science Pack:
  -- =============================

  if data.raw.fluid["bob-nitrogen"] then
    sctm.recipe_ingredient_replace("sct-t3-femto-lasers", "water", "bob-nitrogen")
    sctm.tech_dependency_add("sct-lab-t3", "bob-nitrogen-processing")
  end
  
  if data.raw.item["bob-glass"] and data.raw.item["bob-silver-plate"] then
    data.raw.recipe["sct-t3-laser-foci"].ingredients =
    {
      {type="item", name="copper-plate", amount=5},
      {type="item", name="bob-glass", amount=8},
      {type="item", name="bob-silver-plate", amount=2}
    }
    -- data.raw.recipe["sct-t3-laser-foci"].expensive.ingredients =
    -- {
    --   {type="item", name="copper-plate", amount=10},
    --   {type="item", name="bob-glass", amount=15},
    --   {type="item", name="bob-silver-plate", amount=5}
    -- }
    if mods["angelssmelting"] then
      sctm.tech_dependency_add("sct-lab-t3", "angels-silver-smelting-1")
    elseif mods["angelsrefining"] then
      sctm.tech_dependency_add("sct-lab-t3", "bob-lead-processing")
    end
  end

  if data.raw.item["bob-glass"] then
    sctm.recipe_ingredient_replace("sct-t3-sulfur-lightsource", "plastic-bar", "bob-glass")
    sctm.tech_dependency_remove("sct-lab-t3", "plastics")
  end

  if data.raw.item["bob-glass"] and data.raw.item["bob-aluminium-plate"] then
    data.raw.recipe["sct-t3-laser-emitter"].ingredients =
    {
      {type="item", name="electronic-circuit", amount=6},
      {type="item", name="copper-plate", amount=8},
      {type="item", name="bob-glass", amount=4},
      {type="item", name="bob-aluminium-plate", amount=5}
    }
    data.raw.recipe["sct-t3-laser-emitter"].results = 
    {
      {type="item", name="sct-t3-laser-emitter", amount=1},
      {type="item", name="sct-waste-copperonly", amount=1}
    }
    -- data.raw.recipe["sct-t3-laser-emitter"].expensive.ingredients =
    -- {
    --   {type="item", name="electronic-circuit", amount=10},
    --   {type="item", name="copper-plate", amount=15},
    --   {type="item", name="bob-glass", amount=6},
    --   {type="item", name="bob-aluminium-plate", amount=10}
    -- }
    -- data.raw.recipe["sct-t3-laser-emitter"].expensive.results = 
    -- {
    --   {type="item", name="sct-t3-laser-emitter", amount=1},
    --   {type="item", name="sct-waste-copperonly", amount=1}
    -- }
    if mods["angelssmelting"] then
      sctm.tech_dependency_add("sct-lab-t3", "angels-aluminium-smelting-1")
      sctm.tech_dependency_add("sct-lab-t3", "angels-glass-smelting-1")
    else
      sctm.tech_dependency_add("sct-lab-t3", "bob-aluminium-processing")
    end
  end
  
  if data.raw.item["bob-silver-plate"] and data.raw.item["bob-aluminium-plate"] and data.raw.fluid["bob-nitrogen"] then
    data.raw.recipe["sct-t3-atomic-sensors"].ingredients =
    {
      {type="item", name="advanced-circuit", amount=1},
      {type="item", name="bob-aluminium-plate", amount=5},
      {type="item", name="bob-silver-plate", amount=2},
      {type="item", name="copper-plate", amount=12},
      {type="fluid", name="bob-nitrogen", amount=15}
    }
    data.raw.recipe["sct-t3-atomic-sensors"].results = 
    {
      {type="item", name="sct-t3-atomic-sensors", amount=1},
      {type="item", name="sct-waste-copperonly", amount=1}
    }
    -- data.raw.recipe["sct-t3-atomic-sensors"].expensive.ingredients =
    -- {
    --   {type="item", name="advanced-circuit", amount=1},
    --   {type="item", name="bob-aluminium-plate", amount=10},
    --   {type="item", name="bob-silver-plate", amount=5},
    --   {type="item", name="copper-plate", amount=20},
    --   {type="fluid", name="bob-nitrogen", amount=30}
    -- }
    -- data.raw.recipe["sct-t3-atomic-sensors"].expensive.results = 
    -- {
    --   {type="item", name="sct-t3-atomic-sensors", amount=1},
    --   {type="item", name="sct-waste-copperonly", amount=1}
    -- }
    sctm.tech_dependency_remove("chemical-science-pack", "bob-alloy-processing")
  end
  
  -- Military Science Pack:
  -- =============================
  if data.raw.item["bob-invar-alloy"] then
    sctm.recipe_ingredient_replace("sct-mil-subplating", "iron-plate", { type="item", name="bob-invar-alloy", amount = 0})
    sctm.recipe_ingredient_replace("sct-mil-plating", "iron-plate", { type="item", name="bob-invar-alloy", amount = 0})
    if mods["angelssmelting"] then
      sctm.tech_dependency_add("sct-military-science-pack", "angels-invar-smelting-1")
    else
      sctm.tech_dependency_add("sct-military-science-pack", "bob-invar-processing")
    end
  end
    
  if data.raw.item["bob-brass-alloy"] then
    sctm.recipe_ingredient_replace("sct-mil-subplating", "copper-plate", { type="item", name="bob-brass-alloy", amount = 0})
    sctm.recipe_ingredient_replace("sct-mil-plating", "copper-plate", { type="item", name="bob-brass-alloy", amount = 0})
    if mods["angelssmelting"] then
      sctm.tech_dependency_add("sct-military-science-pack", "angels-brass-smelting-1")
    else
      sctm.tech_dependency_add("sct-military-science-pack", "bob-zinc-processing")
    end
  end

  if data.raw.item["bob-carbon"] then
    sctm.recipe_ingredient_add("sct-mil-circuit3" , { type="item", name="bob-carbon", amount=4 }, { type="item", name="bob-carbon", amount=10 })
    sctm.recipe_ingredient_add("sct-mil-circuit2", { type="item", name="bob-carbon", amount=3 }, { type="item", name="bob-carbon", amount=8 })
--    table.insert(data.raw.recipe["sct-mil-circuit1"].normal.ingredients, { type="item", name="bob-carbon", amount=2 })
--    table.insert(data.raw.recipe["sct-mil-circuit1"].expensive.ingredients, { type="item", name="bob-carbon", amount=5 })   
    sctm.recipe_ingredient_replace("sct-mil-circuit1", "coal", { type="item", name="bob-carbon", amount=0 })
  end
  
  -- Production Science Pack:
  -- =============================
  if data.raw.item["bob-tin-plate"] and data.raw.item["bob-lead-plate"] and data.raw.item["bob-gold-plate"] and data.raw.fluid["bob-sulfur-dioxide"] then
    data.raw.recipe["sct-prod-overclocker"].ingredients = 
    {
      {type="item", name="bob-tin-plate", amount=10},
      {type="item", name="bob-lead-plate", amount=10},
      {type="item", name="bob-gold-plate", amount=10},
      {type="item", name="sct-prod-chipcase", amount=1},
      {type="fluid", name="bob-sulfur-dioxide", amount=120},
    }
    data.raw.recipe["sct-prod-overclocker"].results = 
    {
      {type="item", name="sct-prod-overclocker", amount=1},
      {type="item", name="sulfur", amount=4}
    }
    -- data.raw.recipe["sct-prod-overclocker"].expensive.ingredients = 
    -- {
    --   {type="item", name="bob-tin-plate", amount=20},
    --   {type="item", name="bob-lead-plate", amount=20},
    --   {type="item", name="bob-gold-plate", amount=20},
    --   {type="item", name="sct-prod-chipcase", amount=1},
    --   {type="fluid", name="bob-sulfur-dioxide", amount=200},
    -- }
    -- data.raw.recipe["sct-prod-overclocker"].expensive.results = 
    -- {
    --   {type="item", name="sct-prod-overclocker", amount=1},
    --   {type="item", name="sulfur", amount=4}
    -- }
    sctm.tech_dependency_add("sct-production-science-pack", "bob-gold-processing")
  end
  if data.raw.item["bob-insulated-cable"] then
    data.raw.recipe["sct-prod-bioprocessor"].ingredients = 
    {
      {type="item", name="sct-prod-baked-biopaste", amount=1},
	  	{type="item", name="bob-insulated-cable", amount=6},
	  	{type="item", name="processing-unit", amount=1}
    }
    -- data.raw.recipe["sct-prod-bioprocessor"].expensive.ingredients = 
    -- {
    --   {type="item", name="sct-prod-baked-biopaste", amount=1},
	  -- 	{type="item", name="bob-insulated-cable", amount=10},
	  -- 	{type="item", name="processing-unit", amount=1}
    -- }
    
    data.raw.recipe["sct-prod-chipcase"].ingredients = 
    {
      {type="item", name="plastic-bar", amount=5},
      {type="item", name="bob-insulated-cable", amount=5},
      {type="item", name="advanced-circuit", amount=1},
      {type="fluid", name="heavy-oil", amount=120}
    }
    -- data.raw.recipe["sct-prod-chipcase"].expensive.ingredients = 
    -- {
    --   {type="item", name="plastic-bar", amount=10},
    --   {type="item", name="bob-insulated-cable", amount=8},
    --   {type="item", name="advanced-circuit", amount=1},
    --   {type="fluid", name="heavy-oil", amount=250}
    -- }
  end

  -- High-Tech Science Pack:
  -- =============================
  
  if data.raw.item["bob-lithium-ion-battery"] and data.raw.item["bob-silicon-nitride"] and data.raw.item["bob-steel-gear-wheel"] then
    sctm.recipe_ingredient_replace("sct-htech-capbank", "iron-plate", "bob-steel-gear-wheel")
    sctm.recipe_ingredient_replace("sct-htech-capbank", "battery", "bob-lithium-ion-battery")
    sctm.recipe_ingredient_add("sct-htech-capbank", { type="item", name="bob-silicon-nitride", amount=10},{ type="item", name="bob-silicon-nitride", amount=25})
    sctm.tech_dependency_remove("sct-utility-science-pack", "battery")
    sctm.tech_dependency_add("sct-utility-science-pack", "bob-battery-2")
    sctm.tech_dependency_add("sct-utility-science-pack", "bob-ceramics")
  end
  
  if data.raw.item["bob-titanium-plate"] and data.raw.item["bob-powdered-tungsten"] and data.raw.item["bob-ruby-5"] then
    data.raw.recipe["sct-htech-injector"].ingredients =
    {
      {type="item", name="copper-cable", amount=20},
      {type="item", name="processing-unit", amount=5},
      {type="item", name="bob-titanium-plate", amount=20},
      {type="item", name="bob-powdered-tungsten", amount=20},
      {type="item", name="bob-ruby-5", amount=1}
    }
    -- data.raw.recipe["sct-htech-injector"].expensive.ingredients =
    -- {
    --   {type="item", name="copper-cable", amount=30},
    --   {type="item", name="processing-unit", amount=10},
    --   {type="item", name="bob-titanium-plate", amount=40},
    --   {type="item", name="bob-powdered-tungsten", amount=40},
    --   {type="item", name="bob-ruby-5", amount=1}
    -- }
    sctm.tech_dependency_add("sct-lab-t4", "bob-gem-processing-3")
    sctm.tech_dependency_add("sct-lab-t4", "bob-titanium-processing")
    sctm.tech_dependency_add("sct-lab-t4", "bob-tungsten-processing")
    if mods["angelsrefining"] then
      sctm.tech_pack_add("sct-lab-t4", {"production-science-pack", 1})
      sctm.tech_pack_add("sct-utility-science-pack", {"production-science-pack", 1})
      sctm.tech_unlock_remove("sct-utility-science-pack", "sct-waste-processing-mixed")
      
      if data.raw.item["bob-advanced-processing-unit"] then
        sctm.recipe_ingredient_replace("sct-lab4-manipulators", "processing-unit", "bob-advanced-processing-unit")
        sctm.tech_dependency_add("sct-lab-t4", "bob-advanced-processing-unit")
      end
    end
  end

  if data.raw.item["bob-tinned-copper-cable"] then
    sctm.recipe_ingredient_replace("sct-htech-injector", "copper-cable", "bob-tinned-copper-cable")
  end

  if data.raw.item["bob-tungsten-plate"] and data.raw.item["bob-cobalt-steel-alloy"] then
    data.raw.recipe["sct-htech-thermalstore"].ingredients =
    {
      {type="item", name="bob-tungsten-plate", amount=20},
      {type="item", name="bob-cobalt-steel-alloy", amount=20}
    }
    -- data.raw.recipe["sct-htech-thermalstore"].expensive.ingredients =
    -- {
    --   {type="item", name="bob-tungsten-plate", amount=40},
    --   {type="item", name="bob-cobalt-steel-alloy", amount=40}
    -- }
    if mods["angelssmelting"] then
      sctm.tech_dependency_add("sct-utility-science-pack", "angels-cobalt-steel-smelting-1")
    end
  end
  
  if data.raw.item["bob-titanium-gear-wheel"] and data.raw.item["bob-tungsten-gear-wheel"] then
    sctm.recipe_ingredient_replace("sct-htech-random", "iron-gear-wheel", "bob-tungsten-gear-wheel")
    sctm.recipe_ingredient_add("sct-htech-random", { type="item", name="bob-titanium-gear-wheel", amount=5}, { type="item", name="bob-titanium-gear-wheel", amount=10})
    sctm.recipe_ingredient_add("sct-htech-random", { type="item", name="bob-titanium-bearing", amount=10}, { type="item", name="bob-titanium-bearing", amount=15}) 
  end
  
  -- lab intermediates
  if data.raw.item["bob-steel-gear-wheel"] then
    sctm.recipe_ingredient_replace("sct-lab2-construction", "iron-gear-wheel", "bob-steel-gear-wheel")
  end
  
  if data.raw.item["bob-brass-alloy"] then
    sctm.recipe_ingredient_replace("sct-lab3-construction", "steel-plate", "bob-brass-alloy")
    if mods["angelssmelting"] then
      sctm.tech_dependency_add("sct-lab-t3", "angels-brass-smelting-1")
    else
      sctm.tech_dependency_add("sct-lab-t3", "bob-zinc-processing")
    end
  end

  if data.raw.item["bob-tungsten-plate"] then
    sctm.recipe_ingredient_replace("sct-lab4-construction", "steel-plate", "bob-tungsten-plate")
  end
end

if mods["bobelectronics"] then
  sctm.tech_dependency_add("sct-lab-t2", "bob-electronics")
  if settings.startup["sct-military"].value == "tier2" then
    sctm.recipe_ingredient_replace("sct-mil-circuit3", "advanced-circuit", "electronic-circuit")
    sctm.tech_dependency_remove("sct-military-science-pack", "advanced-circuit")
  end
  if data.raw.item["bob-basic-circuit-board"] then
    sctm.recipe_ingredient_replace("sct-t2-instruments", "electronic-circuit", "bob-basic-circuit-board")
    sctm.recipe_ingredient_replace("sct-lab1-mechanization", "electronic-circuit", "bob-basic-circuit-board")
    sctm.recipe_ingredient_replace("sct-mil-circuit1", "electronic-circuit", "bob-basic-circuit-board")
    sctm.recipe_ingredient_replace("sct-lab2-automatization", "electronic-circuit", "bob-basic-circuit-board")
  end
  if data.raw.item["bob-insulated-cable"] then
    sctm.recipe_ingredient_replace("sct-htech-capbank", "copper-cable", "bob-insulated-cable")
    sctm.recipe_ingredient_replace("sct-htech-injector", "copper-cable", "bob-insulated-cable")
  end

  if data.raw["recipe-category"]["bob-electronics"] then
    data.raw.recipe["sct-t1-ironcore"].category = "bob-electronics"
    data.raw.recipe["sct-t1-magnet-coils"].category = "bob-electronics"
    data.raw.recipe["sct-t2-microcircuits"].category = "bob-electronics"
    data.raw.recipe["sct-t2-micro-wafer"].category = "bob-electronics"
    data.raw.recipe["sct-t2-reaction-nodes"].category = "bob-electronics"
    data.raw.recipe["sct-mil-circuit3"].category = "bob-electronics"
    data.raw.recipe["sct-mil-circuit2"].category = "bob-electronics"
    data.raw.recipe["sct-mil-circuit1"].category = "bob-electronics"
    if data.raw.recipe["sct-logistic-memory-unit"] then
      data.raw.recipe["sct-logistic-memory-unit"].category = "bob-electronics"
    end
  end
end

if mods["bobpower"] then
  if not mods["bobtech"] or not settings.startup["bobmods-burnerphase"].value then
    sctm.tech_dependency_add("steam-power", "sct-automation-science-pack")
  end
  
  if data.raw.item["bob-solar-panel-large"] then
    sctm.recipe_ingredient_replace("sct-lab3-construction", "solar-panel", "bob-solar-panel-large")
  end
end

-- add bob logistic pack if found - for now, might replace with qol later
if mods["bobtech"] then
  sctm.tech_dependency_add("sct-lab-alien", "bob-advanced-research")
  -- hide bob lab mk2 
  if data.raw.lab["bob-lab-2"] then
    --table.insert(data.raw.item["bob-lab-2"].flags, "hidden")
    sctm.tech_unlock_remove("bob-advanced-research", "bob-lab-2")
    -- if someone enables it, move it to sct labs group, and make it hightest tier lab
    data.raw.item["bob-lab-2"].subgroup = "sct-labs"
    data.raw.item["bob-lab-2"].order = "b[labs]-e[lab5]"
    data.raw.item["bob-lab-2"].icons =
    {
      {
        icon = "__ScienceCostTweakerM__/graphics/bobmods/lab2-64.png",
        icon_size = 64,
      },
      {
        icon = "__ScienceCostTweakerM__/graphics/overlays/beta-64.png",
        icon_size = 64,
      },
    }
    data.raw.lab["bob-lab-2"].icons =
    {
      {
        icon_size = 64,
        icon = "__ScienceCostTweakerM__/graphics/bobmods/lab2-64.png",
      },
      {
        icon_size = 64,
        icon = "__ScienceCostTweakerM__/graphics/overlays/beta-64.png",
      },
    }
    data.raw.recipe["bob-lab-2"].subgroup = "sct-labs"
    data.raw.recipe["bob-lab-2"].order = "b[labs]-e[lab5]"
    sctm.recipe_ingredient_replace("bob-lab-2", "lab", "sct-lab-t4")
    sctm.lab_input_remove("sct-lab-t4", "space-science-pack")
    if settings.startup["sct-lab-scaling"].value == true then
      data.raw.lab["bob-lab-2"].researching_speed = 2
    else
      data.raw.lab["bob-lab-2"].researching_speed = 1
    end
    data.raw.lab["sct-lab-t4"].next_upgrade = "bob-lab-2"
    data.raw.lab["lab"].next_upgrade = "sct-lab-t2"
  end
  if data.raw.item["bob-lab-alien"] then
    data.raw.item["bob-lab-alien"].subgroup = "sct-labs"
    data.raw.item["bob-lab-alien"].order = "b[labs]-f[lab6]"
    data.raw.item["bob-lab-alien"].icons =
    {
      {
        icon_size = 64,
        icon = "__ScienceCostTweakerM__/graphics/bobmods/alien-lab-64.png",
      },
      {
        icon_size = 64,
        icon = "__ScienceCostTweakerM__/graphics/overlays/alien-64.png",
      },
    }
    data.raw.lab["bob-lab-alien"].icons =
    {
      {
        icon_size = 64,
        icon = "__ScienceCostTweakerM__/graphics/bobmods/alien-lab-64.png",
      },
      {
        icon_size = 64,
        icon = "__ScienceCostTweakerM__/graphics/overlays/alien-64.png",
      },
    }
    data.raw.recipe["bob-lab-alien"].subgroup = "sct-labs"
    data.raw.recipe["bob-lab-alien"].order = "b[labs]-f[lab6]"
    sctm.recipe_ingredient_replace("bob-lab-alien", "lab", "sct-lab-t3")
    sctm.tech_unlock_remove("bob-alien-research", "bob-lab-alien")
    sctm.tech_dependency_add("bob-alien-research", "sct-alien-science-pack")
    sctm.tech_dependency_remove("bob-alien-research", "bob-advanced-research")
    sctm.tech_pack_replace("bob-alien-research", "automation-science-pack", "bob-science-pack-gold")
    sctm.tech_pack_replace("bob-alien-research", "logistic-science-pack", "bob-alien-science-pack")
    sctm.tech_pack_remove("bob-alien-research", "military-science-pack")
    sctm.tech_pack_remove("bob-alien-research", "chemical-science-pack")
  end
  if data.raw.tool["bob-advanced-logistic-science-pack"] and  data.raw.recipe["bob-advanced-logistic-science-pack"] then
    -- remove logistic pack from tier 1 lab
    sctm.lab_input_remove("lab", "bob-advanced-logistic-science-pack")
    sctm.lab_input_add("sct-lab-t3", "bob-advanced-logistic-science-pack")
    sctm.lab_input_add("sct-lab-t4", "bob-advanced-logistic-science-pack")

    data.raw.tool["bob-advanced-logistic-science-pack"].subgroup = "sct-advanced-logistic-science-pack"
    data.raw.tool["bob-advanced-logistic-science-pack"].order = "h_a[logistic]"
    data.raw.tool["bob-advanced-logistic-science-pack"].icon_size = 64
    data.raw.tool["bob-advanced-logistic-science-pack"].icon = "__ScienceCostTweakerM__/graphics/bobmods/logistic-science-pack-64.png"
    local logisticrecipe = table.deepcopy(data.raw.recipe["sct-advanced-logistic-science-pack"])
    sctm.hide_recipe("sct-advanced-logistic-science-pack")
    logisticrecipe.name = "bob-advanced-logistic-science-pack"
    data.raw.recipe["bob-advanced-logistic-science-pack"] = logisticrecipe
  end
  if data.raw.tool["bob-science-pack-gold"] then
    data.raw.tool["bob-science-pack-gold"].subgroup = "sct-alien-science-pack"
    data.raw.tool["bob-science-pack-gold"].order = "0-gold-science-pack"
    data.raw.tool["bob-science-pack-gold"].icon_size = 64
    data.raw.tool["bob-science-pack-gold"].icon = "__ScienceCostTweakerM__/graphics/bobmods/gold-science-pack-64.png"
    data.raw.recipe["bob-science-pack-gold"].subgroup = "sct-alien-science-pack"
    data.raw.recipe["bob-science-pack-gold"].order = "0-gold-science-pack"
  end
  if data.raw.tool["bob-alien-science-pack"] then
    data.raw.tool["bob-alien-science-pack"].subgroup = "sct-alien-science-pack"
    data.raw.tool["bob-alien-science-pack"].icon_size = 64
    data.raw.tool["bob-alien-science-pack"].icon = "__ScienceCostTweakerM__/graphics/bobmods/alien-science-pack-64.png"
    data.raw.tool["bob-alien-science-pack-blue"].subgroup = "sct-alien-science-pack"
    data.raw.tool["bob-alien-science-pack-orange"].subgroup = "sct-alien-science-pack"
    data.raw.tool["bob-alien-science-pack-purple"].subgroup = "sct-alien-science-pack"
    data.raw.tool["bob-alien-science-pack-yellow"].subgroup = "sct-alien-science-pack"
    data.raw.tool["bob-alien-science-pack-green"].subgroup = "sct-alien-science-pack"
    data.raw.tool["bob-alien-science-pack-red"].subgroup = "sct-alien-science-pack"
  end

  if data.raw.item["bob-brass-chest"] then
    sctm.recipe_ingredient_replace("sct-logistic-automated-storage", "steel-chest", "bob-brass-chest")
    sctm.tech_dependency_add("sct-advanced-logistic-science-pack", "bob-zinc-processing")
  end
  
  if mods["bobelectronics"] and mods["bobplates"] then
    sctm.tech_unlock_add("bob-gold-processing", "bob-gilded-copper-cable")
    sctm.tech_unlock_remove("bob-advanced-processing-unit", "bob-gilded-copper-cable")
  end
end

if mods["bobplates"] and mods["bobelectronics"] and mods["bobtech"] then
  sctm.recipe_ingredient_add("sct-logistic-memory-unit2", {type="item", name="bob-silicon-wafer", amount=2}, {type="item", name="bob-silicon-wafer", amount=4})
end

if mods["boblogistics"] then
  if settings.startup["bobmods-logistics-inserteroverhaul"] and settings.startup["bobmods-logistics-inserteroverhaul"].value then
    sctm.tech_dependency_remove("sct-lab-t2", "fast-inserter")
    if data.raw.recipe["inserter"] then
      sctm.recipe_ingredient_replace("sct-lab2-automatization", "fast-inserter", "inserter")
      sctm.tech_dependency_add("sct-lab-t2", "bob-electronics")
    else
      sctm.recipe_ingredient_replace("sct-lab2-automatization", "fast-inserter", "inserter")
    end
--    sctm.tech_pack_add("bob-bulk-inserter-2", {"production-science-pack",1})
--    sctm.log(serpent.block(data.raw.recipe["sct-lab4-manipulators"]))
--    sctm.recipe_ingredient_replace("sct-lab4-manipulators", "bulk-inserter", "bob-red-bulk-inserter")
    sctm.tech_dependency_add("sct-lab-t4", "bob-bulk-inserter-2")
  end
  if settings.startup["bobmods-logistics-beltoverhaul"] and settings.startup["bobmods-logistics-beltoverhaul"].value then
    if not (mods["bobtech"] and settings.startup["bobmods-burnerphase"].value) then
      sctm.tech_dependency_remove("logistics", "sct-automation-science-pack")
      sctm.tech_dependency_add("logistics-0", "sct-automation-science-pack")
    end
    sctm.recipe_ingredient_replace("sct-lab1-mechanization", "transport-belt", "bob-basic-transport-belt")
  end
end

if mods["bobtech"] and settings.startup["bobmods-burnerphase"].value then
  if (data.raw.recipe["steam-science-pack"]) then -- removed 
    data.raw.recipe["steam-science-pack"].subgroup = "sct-science-pack-0"   
  end
  if (data.raw.tool["steam-science-pack"]) then
    data.raw.tool["steam-science-pack"].subgroup = "sct-science-pack-0"   
  end
  sctm.tech_disable("lab")
  if (data.raw.technology["lab"]) then
    local deps = sctm.tech_dependency_get("lab")
    if (deps and #deps) then
--      sctm.log(serpent.block(deps))
      for _i, prereq in pairs(deps) do
        sctm.tech_dependency_add("sct-lab-t1", prereq)
      end
    end
  end
  sctm.tech_disable("automation-science-pack")
  if (data.raw.technology["automation-science-pack"]) then
    local deps = sctm.tech_dependency_get("automation-science-pack")
--    sctm.log(serpent.block(deps))
    if (deps and #deps) then
      for _i, prereq in pairs(deps) do
        sctm.tech_dependency_add("sct-automation-science-pack", prereq)
      end
    end
  end
  if (data.raw.tool["steam-science-pack"] and not data.raw.tool["sct-science-pack-0"]) then
    data.raw.technology["sct-automation-science-pack"].unit.time = 20
    sctm.tech_pack_add("sct-automation-science-pack", {"steam-science-pack", 1})
    data.raw.technology["sct-lab-t1"].unit.time = 20
    sctm.tech_pack_add("sct-lab-t1", {"steam-science-pack", 10})    
  end
  if (data.raw.recipe["bob-burner-lab"]) then
    data.raw.recipe["bob-burner-lab"].subgroup = "sct-labs"
  end
  if (data.raw.item["bob-burner-lab"]) then
    data.raw.item["bob-burner-lab"].subgroup = "sct-labs"
  end

  if (data.raw.technology["steam-automation"]) then
    sctm.tech_dependency_remove("automation", "basic-automation")
    sctm.tech_dependency_add("automation", "steam-automation")
  end

  if (data.raw.technology["steam-automation"]) then
    sctm.tech_dependency_remove("automation", "basic-automation")
  end
    
elseif mods["bobassembly"] and settings.startup["bobmods-assembly-burner"].value then
  sctm.tech_dependency_add("basic-automation", "sct-automation-science-pack")
end

if mods["bobrevamp"] then
  if data.raw.item["bob-silver-zinc-battery"] then
    sctm.tech_dependency_remove("sct-space-science-pack", "electric-energy-accumulators")
    sctm.tech_dependency_add("sct-space-science-pack", "bob-battery-3")
  end
  if data.raw.item["bob-rtg"] then
    sctm.tech_dependency_remove("sct-space-science-pack", "solar-energy")
    sctm.tech_dependency_add("sct-space-science-pack", "bob-rtg")
  end
end

if mods["bobmining"] then
  if data.raw.technology["bob-water-miner-1"] then
    sctm.tech_dependency_add("bob-water-miner-1", "sct-automation-science-pack")
  end
end

if mods["bobgreenhouse"] then
  sctm.tech_dependency_add("bob-greenhouse", "sct-automation-science-pack")
end

if mods["bobwarfare"] then
  sctm.tech_dependency_add("sct-space-science-pack", "bob-radars-5")
end
