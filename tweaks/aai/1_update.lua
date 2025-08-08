--
if mods["aai-industry"] then
	local aaitech0 = {
		"basic-automation",
		"basic-logistics",
		"electricity",
		"basic-fluid-handling",
		"electric-mining",
        "fuel-processing",
	}
	if mods["omnimatter_water"] then
		aaitech0[#aaitech0+1] = "omniwaste"
	end
	
	for _i, tech in pairs(aaitech0) do
		sctm.tech_pack_replace(tech, "automation-science-pack", "sct-science-pack-0")
	end

	if data.raw.lab["burner-lab"] then
		sctm.lab_input_add("burner-lab", "sct-science-pack-0")
		sctm.tech_pack_add("sct-automation-science-pack", {"sct-science-pack-0", 1})
		sctm.tech_pack_add("sct-lab-t1", {"sct-science-pack-0", 1})
		sctm.lab_input_add("lab", "sct-science-pack-0")
		data.raw.technology["sct-automation-science-pack"].unit.time = 10
		data.raw.technology["sct-lab-t1"].unit.time = 20
		data.raw.item["burner-lab"].order = "a[labs]-a[lab0]"
		data.raw.item["burner-lab"].subgroup = "sct-labs"
		data.raw.recipe["burner-lab"].order = "a[labs]-a[lab0]"
		data.raw.recipe["burner-lab"].subgroup = "sct-labs"
		data.raw.item["burner-lab"].icons = 
		{
			{
				icon_size = 64,
				icon = "__ScienceCostTweakerM__/graphics/aai/burner-lab-64.png",
			},
			{
				icon_size = 64,
				icon = "__ScienceCostTweakerM__/graphics/overlays/flame-64.png",
			},
		}
		data.raw.lab["burner-lab"].icons =
		{
			{
				icon_size = 64,
				icon = "__ScienceCostTweakerM__/graphics/aai/burner-lab-64.png",
			},
			{
				icon_size = 64,
				icon = "__ScienceCostTweakerM__/graphics/overlays/flame-64.png",
			},
		}			
	end
	sctm.tech_dependency_add("sct-lab-t1", "electricity")
	sctm.recipe_ingredient_replace("sct-lab1-mechanization", "electronic-circuit", "electric-motor")
  sctm.recipe_ingredient_add("lab", { type = "item", name = "burner-lab", amount = 1 } )

  sctm.tech_dependency_add("sand-processing", "sct-automation-science-pack")
  sctm.tech_dependency_add("toolbelt", "sct-automation-science-pack")


	if not mods["boblogistics"] or not settings.startup["bobmods-logistics-beltoverhaul"] or not settings.startup["bobmods-logistics-beltoverhaul"].value then
		sctm.tech_dependency_add("sct-lab-t1", "basic-logistics")
	end
	
	if mods["angelsrefining"] then
		sctm.recipe_ingredient_replace("sct-t0-crate", "stone", "stone-crushed")
		sctm.recipe_ingredient_replace("sct-t0-solvent", "iron-ore", "angels-ore1-crushed")
	end

	if mods["omnimatter"] then
		sctm.recipe_ingredient_replace("sct-t0-solvent", "iron-ore", "crushed-omnite")
	end
	
	if mods["omnimatter_wood"] then
		sctm.recipe_ingredient_replace("sct-t0-solvent", "wood", "omniwood")
	end

	-- bobs steam phase and aai
	if mods["bobtech"] and data.raw.tool["steam-science-pack"] then
		data.raw.recipe["steam-science-pack"].enabled = false
		data.raw.tool["steam-science-pack"].enabled = false
		for _i, tech in pairs(data.raw.technology) do
			sctm.tech_pack_replace(tech.name, "steam-science-pack", "sct-science-pack-0")
		end
		if not data.raw.recipe["steam-assembling-machine"] then
			sctm.tech_disable("steam-automation")
			sctm.tech_unlock_remove("steam-automation", "steam-assembling-machine")
		end
	end
end
