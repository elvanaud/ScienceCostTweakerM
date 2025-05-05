--require ("technologies.labs")
--require ("technologies.sciencepacks")

sctm.tech_dependency_add("rocket-silo", "electric-engine")

scttechmap = 
{
-- vanilla
	["automation-science-pack"] = "sct-automation-science-pack",
	["logistic-science-pack"] = "logistic-science-pack",
	["chemical-science-pack"] = "chemical-science-pack",
	["military-science-pack"] = "military-science-pack",
	["production-science-pack"] = "production-science-pack",
	["utility-science-pack"] = "utility-science-pack",
	["space-science-pack"] = "space-science-pack",
-- omni	
	["omni-pack"] = "omnipack-technology",
-- angels	
	["sct-bio-science-pack"] = "sct-bio-science-pack",
-- bobs	
	["steam-science-pack"] = "sct-research-steam", -- technology placeholder, doesn't exists
	["bob-advanced-logistic-science-pack"] = "bob-advanced-logistic-science-pack",
	["bob-science-pack-gold"] = "sct-science-pack-gold",
	["bob-efficiency-processor"] = "modules",
	["bob-module-case"] = "modules",
	["bob-module-circuit-board"] = "modules",
	["bob-pollution-clean-processor"] = "modules",
	["bob-pollution-create-processor"] = "modules",
	["bob-productivity-processor"] = "modules",
	["bob-speed-processor"] = "modules",
	["bob-alien-science-pack"] = "sct-alien-science-pack",
	["bob-alien-science-pack-blue"] = "alien-reseach",
	["bob-alien-science-pack-green"] = "alien-reseach",
	["bob-alien-science-pack-orange"] = "alien-reseach",
	["bob-alien-science-pack-purple"] = "alien-reseach",
	["bob-alien-science-pack-red"] = "alien-reseach",
	["bob-alien-science-pack-yellow"] = "alien-reseach",
-- aai
	["sct-science-pack-0"] = "sct-research-t0", -- technology placeholder, doesn't exists
}

local function checkpacks(tech, checkpacklist, deptech, packmap)
	local techmap = packmap
	local packlist = checkpacklist
	sctm.debug("checking packs for " .. tech)
	sctm.debug(serpent.block(packlist))
	local checktech = data.raw.technology[tech]
	if checktech then
		if checktech.unit and checktech.unit.ingredients and  table_size(checktech.unit.ingredients) > 0 then
			local deepcheck = 0
			for tpack, known in pairs(packlist) do
				if known == 0 then
					deepcheck = deepcheck + 1
					for _i, pack in pairs(checktech.unit.ingredients) do
						local dpack = pack.name or pack[1]
						if (dpack == tpack) or (techmap[dpack] and techmap[tpack] and (techmap[dpack] == techmap[tpack])) then
--						if (pack[1] == tpack) then
							packlist[tpack] = 1
							deepcheck = deepcheck - 1
							break
						end
					end
				end
-- todo someday, recursive check, instead of direct dependencies, takes too long even in vanilla, need better algo				
--[[
				if deepcheck > 0 and checktech.prerequisites and #checktech.prerequisites > 0 then
					for _i, prereq in pairs(checktech.prerequisites) do
						local newpacklist = checkpacks(prereq, packlist, tech, techmap)
						packlist = newpacklist
					end
				end
]]--				
			end
		else
			sctm.debug("unable to determine science packs for technology " .. tech)
		end
	else
		sctm.debug("unknown technology " .. tech .. " in dependencies for " .. deptech);
	end
	sctm.debug(serpent.block(packlist))
	return packlist
end

function connect_sciencepack(sciencepackmap, first_science)
	local techmap = sciencepackmap

	if (techmap == nil) then
		techmap = scttechmap
	end
	
	for tech, _obj in pairs(data.raw.technology) do
		if _obj.unit then
			if _obj.unit.ingredients and table_size(_obj.unit.ingredients) > 0 then
				sctm.debug("connect packs for " .. tech)
				local packlist = {} 
				for _packid, _packobj in pairs(_obj.unit.ingredients) do
					local packname 
						if _packobj.name == nil then
							packname = _packobj[1]
						else
							packname = _packobj.name
						end
					packlist[packname] = 0
				end
				sctm.debug(serpent.block(packlist))
				sctm.debug("checking deps for " .. tech)
				if _obj.prerequisites and  table_size(_obj.prerequisites) > 0 then
					for _i, reqtech in pairs(_obj.prerequisites) do
						local newpacklist = checkpacks(reqtech, packlist, tech, techmap)
						packlist = newpacklist
					end
				end
				sctm.debug(serpent.block(packlist))
				for packname, known in pairs(packlist) do
					local deptech = techmap[packname]
					if deptech == nil and not packname == first_science then
						sctm.log("unhandled SP " .. packname .. " in tech " .. tech)
					end
					if deptech ~= nil and data.raw.technology[deptech] == nil then
--							log("tech " .. deptech .. " for " .. packname .. " unavailable")
					end
					if known == 0 and deptech and data.raw.technology[deptech] then					
						local prereqfound = false
						if _obj.prerequisites and table_size(_obj.prerequisites) > 0 then
							for _j, prereq in pairs(_obj.prerequisites) do
								if prereq == deptech then
									prereqfound = true
									break
								end
							end
						end
						if prereqfound == false then
							sctm.tech_dependency_add(tech, deptech)
						end
					end
				end
			else
				sctm.debug("unable to determine science packs for " .. tech);
			end
		else
			sctm.debug(tech .. " has not defined requirements")
		end
	end
end

--vanilla
--sctm.tech_replace("automation-science-pack", "sct-automation-science-pack")
sctm.tech_replace("logistic-science-pack", "sct-logistic-science-pack")
sctm.tech_replace("chemical-science-pack", "sct-chemical-science-pack")
sctm.tech_replace("military-science-pack", "sct-military-science-pack")
sctm.tech_replace("production-science-pack", "sct-production-science-pack")
sctm.tech_replace("utility-science-pack", "sct-utility-science-pack")
sctm.tech_replace("space-science-pack", "sct-space-science-pack")
--bob mods
sctm.tech_replace("bob-advanced-logistic-science-pack", "sct-advanced-logistic-science-pack")

if settings.startup["sct-connect-science"] and settings.startup["sct-connect-science"].value == true then
	sctm.log("science connect started")
	local first_science = "sct-automation-science-pack"
	if data.raw.tool["steam-science-pack"] then 
		first_science = "steam-science-pack"
	end
	if data.raw.tool["sct-science-pack-0"] then 
		first_science = "sct-science-pack-0"
	end
	if data.raw.tool["science-pack-0"] then 
		first_science = "science-pack-0"
	end
	connect_sciencepack(nil, first_science)
	sctm.log("science connect finished - processed " .. tostring(table_size(data.raw.technology)) .. " technologies")
end

-- remove known science pack unlocks from other technologies
local knownpackmatchlist = {
	{ partial = false, name = "automation-science-pack" },
	{ partial = false, name = "logistic-science-pack" },
	{ partial = false, name = "chemical-science-pack" },
	{ partial = false, name = "production-science-pack" },
	{ partial = false, name = "military-science-pack" },
	{ partial = false, name = "utility-science-pack" },
	{ partial = false, name = "space-science-pack" },
	{ partial = false, name = "bob-advanced-logistic-science-pack" }, -- bobs
	{ partial = false, name = "bob-science-pack-gold" }, -- bobs
	{ partial = false, name = "bob-alien-science-pack" }, -- bobs
--	{ partial = true, name = "bob-alien-science-pack-" },	-- bobs - leaving them under alien research
	{ partial = false, name = "sct-bio-science-pack" }, -- angels
--	{ partial = false, name = "omni-pack" }, -- omnimatter - leaving under omnipack-technology
--	{ partial = false, name = "science-pack-t0" }, -- aai - should not have unlock at all
}

for _i, _tech in pairs(data.raw.technology) do
--	if (not name == _i and (_i:len() < 13 or _i:find("sct-research",1,true) == nil)) then
	if (not name == _i and not name == ("sct-" .. _i)) then
		sctm.tech_remove_known_packs(_i, knownpackmatchlist)
	end
end
