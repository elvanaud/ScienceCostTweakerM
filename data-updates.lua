require("config")
require("tweaks.productivity-limitations")
-- Technology tweaks
require("prototypes/1_recipe")
require("prototypes/1_technology")
-- mod tweaks
require("tweaks.aai.1_update")
require("tweaks.angelsmods.1_update")
require("tweaks.Bio_Industries.1_update")
require("tweaks.bobsmods.1_update")
require("tweaks.omnimatter.1_update")

--require("tweaks.xander.1_update")

for k,v in pairs(data.raw["recipe"]) do
	if v.normal then
		log("SCT: Processing recipe: " .. v.name)
		if v.normal.ingredients then
			newIngredients = {}
			for _, ingr in pairs(v.normal.ingredients) do
				if not ingr["name"] then
					-- log("Bad ingredient !")
				
					newIngredient = {type = "fluid"}
					if data.raw.item[ingr[1]] then
						newIngredient.type = "item"
					end
					newIngredient.name = ingr[1]
					newIngredient.amount = ingr[2]
					table.insert(newIngredients, newIngredient)
				else
					table.insert(newIngredients, ingr)
				end
			end
			--log("Converted to correct ingredients format :")
			--log(serpent.block(newIngredients))
			v.normal.ingredients = newIngredients
		end
		
		for key,value in pairs(v.normal) do
			v[key] = value
		end
		v.normal = nil
		v.expensive = nil
		
		if v.result then
			t = "fluid"
			amount = v.result_count or 1
			if data.raw["item"][v.result] then
				t = "item"
			end
			v.results = {{type = t, name = v.result, amount = amount}}
		end
		v.result = nil
		v.result_count = nil
		
		-- log(serpent.block(v))
	end
end