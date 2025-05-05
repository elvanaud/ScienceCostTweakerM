-- remove angels bio token from lab
if mods["angelsbioprocessing"] then
	if data.raw.tool["token-bio"] or data.raw.recipe["token-bio"] then
		for _i, lab in pairs(data.raw["lab"]) do
			sctm.lab_input_remove(_i, "token-bio")
		end
		if data.raw.tool["token-bio"] then
			data.raw.tool["token-bio"].order = "d_a[bio]-e[token-bio]"
			data.raw.tool["token-bio"].subgroup = "sct-bio-science-pack"
		end
		if data.raw.recipe["token-bio"] then
			data.raw.recipe["token-bio"].order = "d_a[bio]-e[token-bio]"
			data.raw.recipe["token-bio"].subgroup = "sct-bio-science-pack"
		end
		-- replace token-bio with bio science pack
		for i, tech in pairs(data.raw.technology) do
			sctm.tech_pack_replace(tech.name, "token-bio", "sct-bio-science-pack")
		end
	end
end

if mods["angelsindustries"] and angelsmods.industries.components then
  sctm.recipe_ingredient_replace("sct-htech-capbank", "bob-steel-gear-wheel", {name = "grate-steel", amount = 5})
  sctm.recipe_ingredient_replace("sct-htech-random", "bob-titanium-gear-wheel", "angels-spring")
end
