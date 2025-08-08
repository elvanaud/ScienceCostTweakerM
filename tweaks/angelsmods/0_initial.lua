require("science_angels")
if mods["angelsbioprocessing"] then
  sctm.lab_input_add("sct-lab-t2", "sct-bio-science-pack")
  sctm.lab_input_add("sct-lab-t3", "sct-bio-science-pack")
  sctm.lab_input_add("sct-lab-t4", "sct-bio-science-pack")

  angelsmods.trigger.paper = true
  angelsmods.trigger.water_red_waste = true
end

if mods["angelsindustries"] and angelsmods.industries.components then -- TODO : test with angelsindustries
  sctm.tech_dependency_add("angels-components-mechanical-1", "sct-automation-science-pack")
  sctm.tech_dependency_add("angels-components-weapons-basic", "sct-automation-science-pack")
  sctm.tech_dependency_add("angels-solder-smelting-basic", "sct-automation-science-pack")
  sctm.tech_dependency_add("angels-water-treatment", "sct-automation-science-pack")
  -- Remove mixed waste processing as it will already have been unlocked with Military Science
  sctm.tech_unlock_remove("sct-production-science-pack", "sct-waste-processing-mixed")
  sctm.tech_unlock_remove("sct-utility-science-pack", "sct-waste-processing-mixed")
end
