require ("recipes.sciencepacks-intermediates")
require ("recipes.sciencepacks")
require ("recipes.labs-intermediates")
require ("recipes.labs")

local sciencepack1 = table.deepcopy(data.raw.recipe["sct-automation-science-pack"])
sctm.hide_recipe("sct-automation-science-pack")
sciencepack1.name = "automation-science-pack"
data.raw.recipe["automation-science-pack"] = sciencepack1

local sciencepack2 = table.deepcopy(data.raw.recipe["sct-logistic-science-pack"])
sctm.hide_recipe("sct-logistic-science-pack")
sciencepack2.name = "logistic-science-pack"
data.raw.recipe["logistic-science-pack"] = sciencepack2

local sciencepack3 = table.deepcopy(data.raw.recipe["sct-chemical-science-pack"])
sctm.hide_recipe("sct-chemical-science-pack")
sciencepack3.name = "chemical-science-pack"
data.raw.recipe["chemical-science-pack"] = sciencepack3

local sciencepackm = table.deepcopy(data.raw.recipe["sct-military-science-pack"])
sctm.hide_recipe("sct-military-science-pack")
sciencepackm.name = "military-science-pack"
data.raw.recipe["military-science-pack"] = sciencepackm

local sciencepackp = table.deepcopy(data.raw.recipe["sct-production-science-pack"])
sctm.hide_recipe("sct-production-science-pack")
sciencepackp.name = "production-science-pack"
data.raw.recipe["production-science-pack"] = sciencepackp

local sciencepackh = table.deepcopy(data.raw.recipe["sct-utility-science-pack"])
sctm.hide_recipe("sct-utility-science-pack")
sciencepackh.name = "utility-science-pack"
data.raw.recipe["utility-science-pack"] = sciencepackh

for k,v in pairs(SCTTweaks.item_icons) do
    if data.raw.recipe[v.name] then
        recipe = data.raw.recipe[v.name]
        if not recipe.icon and not recipe.icons then 
            if v.icon then
                recipe.icon = v.icon
                recipe.icon_size = v.icon_size
            elseif v.icons then
                recipe.icons = v.icons
            end
        end
    end
end