if mods["bobtech"] then
	sctm.tech_pack_add("sct-space-science-pack", {"bob-advanced-logistic-science-pack", 5})
  if mods["angelspetrochem"] then
    sctm.recipe_ingredient_remove("chemical-science-pack", "solid-sodium-hydroxide")
    sctm.recipe_ingredient_remove("production-science-pack", "angels-chemical-plant")
  else
    sctm.recipe_ingredient_remove("chemical-science-pack", "bob-sodium-hydroxide")
  end
	sctm.recipe_ingredient_remove("production-science-pack", "chemical-plant")
	sctm.recipe_ingredient_remove("production-science-pack", "assembling-machine-2")
	sctm.recipe_ingredient_remove("utility-science-pack", "bob-silver-zinc-battery")
	sctm.recipe_ingredient_remove("utility-science-pack", "processing-unit")
	sctm.recipe_ingredient_remove("utility-science-pack", "bob-titanium-bearing")
	sctm.recipe_ingredient_remove("utility-science-pack", "electric-engine-unit")
	if data.raw.item["bob-solar-panel-small"] then
		sctm.recipe_ingredient_remove("utility-science-pack", "bob-solar-panel-small")
	else
		sctm.recipe_ingredient_remove("utility-science-pack", "solar-panel")
	end
end

if mods["bobplates"] then
	sctm.recipe_ingredient_remove("chemical-science-pack", "bob-bronze-alloy")
	sctm.recipe_ingredient_remove("utility-science-pack", "bob-lithium-ion-battery")
	sctm.recipe_ingredient_remove("utility-science-pack", "bob-silicon-nitride")
	sctm.tech_dependency_remove("chemical-science-pack", "bob-alloy-processing")
end
	
if mods["bobmodules"] then
	if sctm.tech_dependency_remove("modular-armor", "modules") then
		sctm.tech_dependency_add("modular-armor","advanced-circuit")
	end
end

if mods["boblogistics"] and settings.startup["bobmods-logistics-inserteroverhaul"].value then
  sctm.tech_dependency_add("bob-turbo-inserter", "bob-express-inserters")
end

if data.raw["technology"]["bob-advanced-logistic-science-pack"] then
  for k,v in pairs(data.raw.lab["lab"].inputs) do
    if v == "bob-advanced-logistic-science-pack" then
      table.remove(data.raw.lab["lab"].inputs, k)
    end
  end
end
