require("science_bobmods_logistic")
require("science_bobmods_tech")
require("science_bobmods_alien")
require("science_bobmods_burner")

if mods["bobtech"] then
  -- bobtech renames logistic science to transport science.
  -- Undo this so we use the "Single use ATMOS" localization string
  data.raw.tool["logistic-science-pack"].localised_name = nil
  data.raw.technology["logistic-science-pack"].localised_name = nil

  if data.raw.tool["bob-advanced-logistic-science-pack"] then
    data.raw.tool["bob-advanced-logistic-science-pack"].localised_name = nil
  end
end

if mods["bobplates"] then
  -- Production Science Pack:
  -- =============================
  if data.raw.item["bob-silicon-plate"] then
    sctm.recipe_ingredient_replace("sct-prod-biosilicate", "stone", {type="item", name="bob-silicon-plate", amount = 2})
    sctm.tech_dependency_add("advanced-material-processing-2", "bob-silicon-processing")
  end
end
