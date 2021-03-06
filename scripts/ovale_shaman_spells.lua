local OVALE, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "ovale_shaman_spells"
	local desc = "[7.0] Ovale: Shaman spells"
	local code = [[
# Shaman spells and functions.

#TODO Temp
Define(augmentation 175456)

# Learned spells.
Define(fulmination 88766)
	SpellInfo(fulmination learn=1 level=20 specialization=elemental)
Define(shamanism 62099)
	SpellInfo(shamanism learn=1 level=10 specialization=elemental)
Define(spiritual_insight 123099)
	SpellInfo(spiritual_insight learn=1 level=10 specialization=elemental)

Define(ancestral_guidance 108281)
	SpellInfo(ancestral_guidance cd=120 gcd=0 offgcd=1)
	SpellAddBuff(ancestral_guidance ancestral_guidance_buff=1)
Define(ancestral_guidance_buff 108281)
	SpellInfo(ancestral_guidance_buff duration=10)
Define(ancestral_swiftness 16188)
	SpellInfo(ancestral_swiftness cd=90 gcd=0 offgcd=1)
	SpellAddBuff(ancestral_swiftness ancestral_swiftness_buff=1)
Define(ancestral_swiftness_buff 16188)
Define(ascendance 114049)
	SpellInfo(ascendance cd=180 gcd=0 offgcd=1)
	SpellInfo(ascendance cd=120 specialization=elemental)
	SpellInfo(ascendance replace=ascendance_caster if_spell=ascendance_caster)
	SpellInfo(ascendance replace=ascendance_heal if_spell=ascendance_heal)
	SpellInfo(ascendance replace=ascendance_melee if_spell=ascendance_melee)
	SpellAddBuff(ascendance ascendance_caster_buff=1 if_spell=ascendance_caster)
	SpellAddBuff(ascendance ascendance_heal_buff=1 if_spell=ascendance_heal)
	SpellAddBuff(ascendance ascendance_melee_buff=1 if_spell=ascendance_melee)
Define(ascendance_caster 114050)
	SpellInfo(ascendance_caster cd=180 gcd=0 offgcd=1)
	SpellAddBuff(ascendance_caster ascendance_caster_buff=1)
Define(ascendance_caster_buff 114050)
	SpellInfo(ascendance_caster_buff duration=15)
Define(ascendance_heal 114052)
	SpellInfo(ascendance_heal cd=180 gcd=0 offgcd=1)
	SpellAddBuff(ascendance_heal ascendance_heal_buff=1)
Define(ascendance_heal_buff 114052)
	SpellInfo(ascendance_heal_buff duration=15)
Define(ascendance_melee 114051)
	SpellInfo(ascendance_melee cd=180 gcd=0 offgcd=1)
	SpellAddBuff(ascendance_melee ascendance_melee_buff=1)
Define(ascendance_melee_buff 114051)
	SpellInfo(ascendance_melee_buff duration=15)
Define(bloodlust 2825)
	SpellInfo(bloodlust cd=300 gcd=0)
	SpellAddBuff(bloodlust bloodlust_buff=1)
Define(bloodlust_buff 2825)
	SpellInfo(bloodlust_buff duration=40)
Define(boulderfist 201897)
	SpellInfo(boulderfist cd=6 cd_haste=melee charges=2 maelstrom=-25)
	SpellAddBuff(boulderfist boulderfist_buff=1)
Define(boulderfist_buff 218825)
	SpellInfo(boulderfist_buff duration=10)
Define(chain_heal 1064)
	SpellAddBuff(chain_heal ancestral_swiftness_buff=0 if_spell=ancestral_swiftness)
	SpellAddBuff(chain_heal maelstrom_weapon_buff=0 if_spell=maelstrom_weapon)
	SpellAddBuff(chain_heal tidal_waves_buff=2 if_spell=tidal_waves)
	SpellAddBuff(chain_heal unleash_life_buff=0 if_spell=unleash_life)
Define(chain_lightning 421)
	SpellInfo(chain_lightning cd=3)
	SpellInfo(chain_lightning cd=0 if_spell=shamanism)
	SpellRequire(chain_lightning replace lava_beam=buff,ascendance_caster_buff if_spell=ascendance_caster)
	SpellAddBuff(chain_lightning ancestral_swiftness_buff=0 if_spell=ancestral_swiftness)
	SpellAddBuff(chain_lightning maelstrom_weapon_buff=0 if_spell=maelstrom_weapon)
	SpellAddBuff(chain_lightning enhanced_chain_lightning_buff=1 if_spell=enhanced_chain_lightning)
	SpellAddBuff(chain_lightning stormkeeper_buff=-1)
Define(cloudburst_totem 157153)
	SpellInfo(cloudburst_totem cd=30 duration=15 totem=water)
Define(crash_lightning 187874)
	SpellInfo(crash_lightning maelstrom=20 cd=6 cd_haste=melee)
Define(crash_lightning_buff 187878)
Define(doom_winds 204945)
	SpellInfo(doom_winds cd=60 gcd=0 offgcd=1)
	SpellAddBuff(doom_winds doom_winds_buff=1)
Define(doom_winds_buff 204945)
	SpellInfo(doom_winds_buff duration=6)
Define(earth_elemental_totem 2062)
	SpellInfo(earth_elemental_totem cd=300 duration=60 totem=earth)
	SpellInfo(earth_elemental_totem buff_cdr=cooldown_reduction_agility_buff specialization=enhancement)
Define(earth_elemental_totem_reinforce 118347)
	SpellInfo(earth_elemental_totem_reinforce gcd=0 offgcd=1)
	SpellAddBuff(earth_elemental_totem_reinforce earth_elemental_totem_reinforce_buff=1)
Define(earth_elemental_totem_reinforce_buff 118347)
	SpellInfo(earth_elemental_totem_reinforce_buff duration=60)
Define(earth_shield 974)
	SpellAddTargetBuff(earth_shield earth_shield_buff=1)
Define(earth_shield_buff 974)
	SpellInfo(earth_shield_buff duration=600 max_stacks=9)
Define(earth_shock 8042)
	SpellInfo(earth_shock cd=6 sharedcd=shock)
	SpellInfo(earth_shock addcd=-1 if_spell=spiritual_insight)
	SpellInfo(earth_shock cd_haste=melee gcd_haste=melee if_spell=flurry)
	SpellAddBuff(earth_shock elemental_fusion_buff=0 if_spell=elemental_fusion)
	SpellAddBuff(earth_shock lava_surge_buff=1 if_spell=fulmination itemset=T17 itemcount=4 specialization=elemental)
Define(earthen_spike 188089)
	SpellInfo(earthen_spike cd=20 maelstrom=30)
Define(earthquake 61882)
	SpellInfo(earthquake cd=10)
	SpellRequire(earthquake cd 0=buff,echo_of_the_elements_buff if_spell=echo_of_the_elements)
	SpellAddBuff(earthquake ancestral_swiftness_buff=0 if_spell=ancestral_swiftness)
	SpellAddBuff(earthquake echo_of_the_elements_buff=0 if_spell=echo_of_the_elements)
	SpellAddBuff(earthquake enhanced_chain_lightning_buff=0 if_spell=enhanced_chain_lightning)
	SpellAddTargetDebuff(earthquake earthquake_debuff=1)
Define(earthquake_debuff 61882)
	SpellInfo(earthquake_debuff duration=10 haste=spell tick=1)
Define(earthquake_totem 61882)
	SpellInfo(earthquake_totem maelstrom=50)
Define(echo_of_the_elements 108283)
Define(echo_of_the_elements_buff 159101)
	SpellInfo(echo_of_the_elements_buff duration=15)
Define(elemental_blast 117014)
	SpellInfo(elemental_blast cd=12 travel_time=1)
	SpellAddBuff(elemental_blast ancestral_swiftness_buff=0 if_spell=ancestral_swiftness)
	SpellAddBuff(elemental_blast elemental_blast_spirit_buff=1 specialization=restoration)
	SpellAddBuff(elemental_blast maelstrom_weapon_buff=0 if_spell=maelstrom_weapon)
	SpellAddBuff(elemental_blast unleash_flame_buff=0 if_spell=unleash_flame)
Define(elemental_blast_spirit_buff 173187)
	SpellInfo(elemental_blast_spirit_buff duration=8)
Define(elemental_focus_buff 16246)
	SpellAddBuff(icefury elemental_focus_buff=-1)
	SpellAddBuff(chain_lightning elemental_focus_buff=-1)
	SpellAddBuff(lava_burst elemental_focus_buff=-1)
	SpellAddBuff(earth_shock elemental_focus_buff=-1)
	SpellAddBuff(lightning_bolt elemental_focus_buff=-1)
	SpellAddBuff(elemental_blast elemental_focus_buff=-1)
	SpellAddBuff(chain_lightning elemental_focus_buff=-1)
	SpellAddBuff(healing_surge elemental_focus_buff=-1)
	SpellAddBuff(frost_shock elemental_focus_buff=-1)
	SpellAddBuff(thunderstorm elemental_focus_buff=-1)
Define(elemental_fusion 152257)
Define(elemental_fusion_buff 157174)
	SpellInfo(elemental_fusion_buff duration=15 max_stacks=2)
Define(elemental_mastery 16166)
	SpellInfo(elemental_mastery cd=120 gcd=0)
	SpellAddBuff(elemental_mastery elemental_mastery_buff=1)
Define(elemental_mastery_buff 16166)
	SpellInfo(elemental_mastery_buff duration=20)
Define(enhanced_chain_lightning 157765)
Define(enhanced_chain_lightning_buff 157766)
	SpellInfo(enhanced_chain_lightning_buff duration=15) # max_stacks=?
Define(feral_lunge 196884)
	SpellInfo(feral_lunge cd=30)
Define(feral_spirit 51533)
	SpellInfo(feral_spirit cd=120 duration=15)
Define(fire_elemental 198067)
	SpellInfo(fire_elemental cd=300)
Define(fire_elemental_totem 2894)
	SpellInfo(fire_elemental_totem cd=300 duration=60 totem=fire)
	SpellInfo(fire_elemental_totem buff_cdr=cooldown_reduction_agility_buff specialization=enhancement)
Define(fire_elemental_totem_empower 118350)
	SpellInfo(fire_elemental_totem_empower gcd=0 offgcd=1)
	SpellAddBuff(fire_elemental_totem_empower fire_elemental_totem_empower_buff=1)
Define(fire_elemental_totem_empower_buff 118350)
	SpellInfo(fire_elemental_totem_empower_buff duration=60)
Define(fire_nova 1535)
	SpellInfo(fire_nova cd=4)
	SpellInfo(fire_nova cd_haste=melee gcd_haste=melee if_spell=flurry)
	SpellRequire(fire_nova cd 0=buff,echo_of_the_elements_buff if_spell=echo_of_the_elements)
	SpellAddBuff(fire_nova echo_of_the_elements_buff=0 if_spell=echo_of_the_elements)
Define(flame_shock 188389)
	SpellInfo(flame_shock cd=6 sharedcd=shock)
	SpellInfo(flame_shock addcd=-1 if_spell=spiritual_insight)
	SpellInfo(flame_shock cd_haste=melee gcd_haste=melee if_spell=flurry)
	SpellAddBuff(flame_shock elemental_fusion_buff=0 if_spell=elemental_fusion)
	SpellAddBuff(flame_shock unleash_flame_buff=0 if_spell=unleash_flame)
	SpellAddTargetDebuff(flame_shock flame_shock_debuff=1)
Define(flame_shock_debuff 188389)
	SpellInfo(flame_shock_debuff duration=30 haste=spell tick=3)
Define(flametongue 193796)
	SpellInfo(flametongue cd=12 cd_haste=melee)
	SpellAddBuff(flametongue flametongue_buff=1)
Define(flametongue_buff 193796)
	SpellInfo(flametongue_buff duration=16)
Define(flurry 16282)
Define(frost_shock 196840)
	SpellInfo(frost_shock cd=6 sharedcd=shock)
	SpellInfo(frost_shock cd_haste=melee gcd_haste=melee if_spell=flurry)
	SpellRequire(frost_shock cd 0=buff,echo_of_the_elements_buff if_spell=echo_of_the_elements)
	SpellAddBuff(frost_shock echo_of_the_elements_buff=0 if_spell=echo_of_the_elements)
	SpellAddBuff(frost_shock elemental_fusion_buff=0 if_spell=elemental_fusion)
	SpellAddBuff(frost_shock icefury_buff=-1)
Define(frostbrand 196834)
	SpellInfo(frostbrand maelstrom=20)
	SpellAddBuff(frostbrand frostbrand_buff=1)
Define(frostbrand_buff 196834)
Define(fury_of_air 197211)
	SpellInfo(fury_of_air maelstrom=5)
	SpellAddBuff(fury_of_air fury_of_air_buff=1)
	SpellAddTargetDebuff(fury_of_air fury_of_air_debuff=1)
	SpellRequire(fury_of_air unusable 1=buff,fury_of_air_buff)
Define(fury_of_air_buff 197211)
Define(fury_of_air_debuff 197385)
	SpellInfo(fury_of_air_debuff duration=3)
Define(fury_of_air_talent 17)
Define(ghost_wolf 2645)
Define(harmony_of_the_elements_buff 167703)
	SpellInfo(harmony_of_the_elements_buff duration=10)
Define(healing_rain 73920)
	SpellInfo(healing_rain cd=10)
	SpellAddBuff(healing_rain ancestral_swiftness_buff=0 if_spell=ancestral_swiftness)
	SpellAddBuff(healing_rain maelstrom_weapon_buff=0 if_spell=maelstrom_weapon)
Define(healing_stream_totem 5394)
	SpellInfo(healing_stream_totem cd=30 duration=15 totem=water)
Define(healing_surge 8004)
	SpellAddBuff(healing_surge ancestral_swiftness_buff=0 if_spell=ancestral_swiftness)
	SpellAddBuff(healing_surge tidal_waves_buff=-1 if_spell=tidal_waves)
	SpellAddBuff(healing_surge unleash_life_buff=0 if_spell=unleash_life)
Define(healing_tide_totem 108280)
	SpellInfo(healing_tide_totem cd=180 duration=10 totem=water)
Define(healing_wave 77472)
	SpellAddBuff(healing_wave ancestral_swiftness_buff=0 if_spell=ancestral_swiftness)
	SpellAddBuff(healing_wave tidal_waves_buff=-1 if_spell=tidal_waves)
	SpellAddBuff(healing_wave unleash_life_buff=0 if_spell=unleash_life)
Define(heroism 32182)
	SpellInfo(heroism cd=300 gcd=0)
	SpellAddBuff(heroism heroism_buff=1)
Define(heroism_buff 32182)
	SpellInfo(heroism_buff duration=40)
Define(hot_hand_buff 215785)
Define(icefury 210714)
	SpellInfo(icefury maelstrom=-24)
	SpellAddBuff(icefury icefury_buff=4)
Define(icefury_buff 210714)
	SpellInfo(icefury_buff duration=15)
Define(improved_flame_shock 157804)
Define(improved_riptide 157812)
Define(landslide_buff 202004)
Define(landslide_talent 20)
Define(lava_beam 114074)
	SpellRequire(lava_beam unusable 1=buff,!ascendance_caster_buff if_spell=ascendance_caster)
	SpellAddBuff(lava_beam unleash_flame_buff=0 if_spell=unleash_flame)
Define(lava_burst 51505)
	SpellInfo(lava_burst cd=8 travel_time=1 maelstrom=-12)
	SpellRequire(lava_burst cd 0=buff,lava_burst_no_cooldown_buff specialization=elemental)
	SpellAddBuff(lava_burst lava_surge_buff=0)
	SpellAddBuff(lava_burst echo_of_the_elements_buff=0 if_spell=echo_of_the_elements)
	SpellAddBuff(lava_burst unleash_flame_buff=0 if_spell=unleash_flame)
SpellList(lava_burst_no_cooldown_buff ascendance_caster_buff echo_of_the_elements_buff)
Define(lava_lash 60103)
	SpellInfo(lava_lash maelstrom=30)
	SpellRequire(lava_lash maelstrom 0=buff,hot_hand_buff talent=hot_hand_talent)
Define(lava_surge_buff 77762)
	SpellInfo(lava_surge_buff duration=10)
Define(lightning_bolt 188196)
	SpellInfo(lightning_bolt maelstrom=-8)
	SpellInfo(lightning_bolt replace=lightning_bolt_enhancement specialization=enhancement)
Define(lightning_bolt_enhancement 187837)
	SpellInfo(lightning_bolt cd=9 cd_haste=melee talent=overcharge_talent)
Define(lightning_rod_debuff 197209)
Define(lightning_rod_talent 20)
Define(lightning_shield 192106)
	SpellAddBuff(lightning_shield lightning_shield_buff=1)
	SpellRequire(lightning_shield unusable 1=buff,lightning_shield_buff)
Define(lightning_shield_buff 192106)
	SpellInfo(lightning_shield_buff duration=3600)
Define(liquid_magma 152255)
	SpellInfo(liquid_magma cd=45)
	SpellAddBuff(liquid_magma liquid_magma_buff=1)
Define(liquid_magma_buff 152255)
Define(maelstrom_weapon_buff 53817)
	SpellInfo(maelstrom_weapon_buff duration=30 max_stacks=5)
	SpellInfo(maelstrom_weapon_buff max_stacks=10 itemset=T18 itemcount=4 specialization=enhancement)
Define(liquid_magma_totem 192222)
	SpellInfo(liquid_magma_totem cd=60)
Define(magma_totem 8190)
	SpellInfo(magma_totem duration=60 totem=fire)
Define(pet_empower 118350)
Define(pet_empower_buff 118350)
Define(pet_reinforce 118347)
Define(pet_reinforce_buff 118347)
Define(primal_strike 73899)
	SpellInfo(primal_strike cd=8)
Define(resonance_totem_buff 202192)
Define(riptide 61295)
	SpellInfo(riptide cd=6)
	SpellAddBuff(riptide tidal_waves_buff=2 if_spell=tidal_waves)
	SpellAddTargetBuff(riptide riptide_buff=1)
Define(riptide_buff 61295)
	SpellInfo(riptide_buff duration=18 haste=spell tick=3)
Define(rockbiter 193786)
	SpellInfo(rockbiter maelstrom=-15)
	SpellInfo(rockbiter replace=boulderfist talent=boulderfist_talent)
Define(searing_totem 3599)
	SpellInfo(searing_totem duration=60 totem=fire)
Define(spirit_link_totem 98008)
	SpellInfo(spirit_link_totem cd=180 duration=6 totem=air)
Define(spirit_walk 58875)
	SpellInfo(spirit_walk cd=60)
Define(spiritwalkers_grace 79206)
	SpellInfo(spiritwalkers_grace cd=120 gcd=0)
	SpellInfo(spiritwalkers_grace buff_cdr=cooldown_reduction_agility_buff specialization=enhancement)
Define(storm_elemental 192249)
	SpellInfo(fire_elemental cd=300 replace=storm_elemental talent=storm_elemental_talent)
Define(stormbringer 201845)
Define(stormbringer_buff 201846)
	SpellInfo(stormbringer_buff duration=12)
Define(stormkeeper 205495)
	SpellInfo(stormkeeper cd=60)
	SpellAddBuff(stormkeeper stormkeeper_buff=3)
Define(stormkeeper_buff 205495)
	SpellInfo(stormkeeper_buff duration=15)
Define(stormstrike 17364)
	SpellInfo(stormstrike cd=16 cd_haste=melee maelstrom=40)
	SpellInfo(stormstrike buff_maelstrom_half=stormbringer_buff)
	SpellAddBuff(stormstrike stormbringer_buff=-1)
	SpellRequire(stormstrike cd 0=buff,stormbringer_buff if_spell=stormbringer)
	SpellRequire(stormstrike replace windstrike=buff,ascendance_melee_buff if_spell=ascendance_melee)
Define(sundering 197214)
	SpellInfo(sundering maelstrom=60 cd=40)
Define(t18_class_trinket 124521)
Define(thunderstorm 51490)
	SpellInfo(thunderstorm cd=45)
Define(tidal_waves_buff 53390)
	SpellInfo(tidal_waves_buff duration=15 max_stacks=2)
Define(totem_mastery 210643)
	SpellInfo(totem_mastery cd=120)
Define(totemic_recall 36936)
Define(tremor_totem 8143)
	SpellInfo(tremor_totem cd=60 duration=10 totem=earth)
Define(unleash_elements 73680)
	SpellInfo(unleash_elements cd=15)
	SpellInfo(unleash_elements cd_haste=melee gcd_haste=melee if_spell=flurry)
	SpellAddBuff(unleash_elements unleash_flame_buff=1)
	SpellAddBuff(unleash_elements unleashed_fury_melee_buff=1 talent=unleashed_fury_talent)
Define(unleash_flame 165462)
	SpellInfo(unleash_flame cd=15)
	SpellAddBuff(unleash_flame unleash_flame_buff=1)
Define(unleash_flame_buff 165462)
	SpellInfo(unleash_flame_buff duration=20)
Define(unleash_life 73685)
	SpellInfo(unleash_life cd=15)
	SpellAddBuff(unleash_life unleash_life_buff=1)
Define(unleash_life_buff 73685)
	SpellInfo(unleash_life_buff duration=10)
Define(unleashed_fury_melee_buff 118472)
	SpellInfo(unleashed_fury_melee_buff duration=8)
Define(water_shield 52127)
	SpellAddBuff(water_shield water_shield_buff=1)
Define(water_shield_buff 52127)
	SpellInfo(water_shield duration=3600)
Define(wind_shear 57994)
	SpellInfo(wind_shear cd=12 gcd=0 offgcd=1 interrupt=1)
Define(windsong 201898)
	SpellInfo(windsong cd=45)	
Define(windstrike 115356)
	SpellInfo(windstrike cd=16 cd_haste=melee)
	SpellInfo(windstrike buff_maelstrom_half=stormbringer_buff)
	SpellAddBuff(windstrike stormbringer_buff=-1)
	SpellRequire(windstrike cd 8=buff,stormbringer_buff if_spell=stormbringer)
	SpellRequire(windstrike unusable 1=buff,!ascendance_melee_buff if_spell=ascendance_melee)

Define(windwalk_totem 108273)
	SpellInfo(windwalk_totem cd=60 duration=6 totem=air)

# Legendary items
Define(echoes_of_the_great_sundering_buff 208723)
	SpellAddBuff(earthquake_totem echoes_of_the_great_sundering_buff=0)
Define(power_of_the_maelstrom_buff 191877)
	SpellAddBuff(lightning_bolt power_of_the_maelstrom_buff=-1)

# Artifact traits
Define(alpha_wolf 198434)

Define(hot_hand_talent 2)
Define(boulderfist_talent 3)
Define(totemic_persistence_talent 8)
Define(hailstorm_talent 12)
Define(echo_of_the_elements_talent 12)
Define(overcharge_talent 14)
Define(icefury_talent 15)
Define(unleashed_fury_talent 16)
Define(crashing_storm_talent 16)
Define(cloudburst_totem_talent 19)
Define(primal_elementalist_talent 17)
Define(elemental_blast_talent 18)
Define(elemental_fusion_talent 19)
Define(ascendance_talent 19)
Define(storm_elemental_talent 20)
Define(high_tide_talent 21)
Define(liquid_magma_talent 21)

# Non-default tags for OvaleSimulationCraft.
	SpellInfo(elemental_mastery tag=shortcd)
]]

	OvaleScripts:RegisterScript("SHAMAN", nil, name, desc, code, "include")
end
