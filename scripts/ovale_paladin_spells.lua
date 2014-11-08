local OVALE, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "ovale_paladin_spells"
	local desc = "[6.0.2] Ovale: Paladin spells"
	local code = [[
# Paladin spells and functions.

# Learned spells.
Define(judgments_of_the_wise 105424)
	SpellInfo(judgments_of_the_wise learn=1 level=28 specialization=protection)
Define(sanctity_of_battle 25956)
	SpellInfo(sanctity_of_battle learn=1 level=58)

Define(ardent_defender 31850)
	SpellInfo(ardent_defender cd=180 gcd=0)
	SpellInfo(ardent_defender addcd=-60 itemset=T14_tank itemcount=2)
	SpellInfo(ardent_defender buff_cdr=cooldown_reduction_tank_buff)
	SpellAddBuff(ardent_defender ardent_defender_buff=1)
Define(ardent_defender_buff 31850)
	SpellInfo(ardent_defender_buff duration=10)
Define(avengers_shield 31935)
	SpellInfo(avengers_shield holy=0 cd=15)
	SpellInfo(avengers_shield buff_holy=grand_crusader_buff if_spell=grand_crusader)
	SpellInfo(avengers_shield buff_holy=holy_avenger_buff buff_holy_amount=-2 if_spell=grand_crusader if_spell=holy_avenger)
	SpellInfo(avengers_shield cd_haste=melee if_spell=sanctity_of_battle)
	SpellAddBuff(avengers_shield grand_crusader_buff=0 if_spell=grand_crusader)
Define(avenging_wrath_melee 31884)
	SpellInfo(avenging_wrath_melee cd=180 gcd=0)
	SpellInfo(avenging_wrath_melee addcd=-65 itemset=T14_melee itemcount=4)
	SpellInfo(avenging_wrath_melee buff_cdr=cooldown_reduction_strength_buff)
	SpellAddBuff(avenging_wrath_melee avenging_wrath_melee_buff=1)
Define(avenging_wrath_melee_buff 31884)
	SpellInfo(avenging_wrath_melee_buff duration=20)
	SpellInfo(avenging_wrath_melee_buff addduration=10 if_spell=sanctified_wrath)
Define(bastion_of_glory_buff 114637)
	SpellInfo(bastion_of_glory_buff duration=20 maxstacks=5)
Define(bastion_of_power_buff 144569)
	SpellInfo(bastion_of_power_buff duration=20)
Define(blazing_contempt_buff 166831)
	SpellInfo(blazing_contempt_buff duration=20)
Define(blessing_of_kings 20217)
	SpellAddBuff(blessing_of_kings blessing_of_kings_buff=1)
Define(blessing_of_kings_buff 20217)
	SpellInfo(blessing_of_kings_buff duration=3600)
Define(blessing_of_might 19740)
	SpellAddBuff(blessing_of_might blessing_of_might_buff=1)
Define(blinding_light 115750)
	SpellInfo(blinding_light cd=120 interrupt=1)
Define(consecration 26573)
	SpellInfo(consecration cd=9)
	SpellInfo(consecration cd_haste=melee if_spell=sanctity_of_battle)
	SpellInfo(consecration replace=consecration_glyph_of_consecration unusable=1 glyph=glyph_of_consecration)
	SpellInfo(consecration replace=consecration_glyph_of_the_consecrator unusable=1 glyph=glyph_of_the_consecrator)
Define(consecration_debuff 81298)
	SpellInfo(consecration_debuff duration=9 tick=1)
	SpellInfo(consecration_debuff haste=melee if_spell=sanctity_of_battle)
Define(consecration_glyph_of_consecration 116467)
	SpellInfo(consecration_glyph_of_consecration cd=9)
	SpellInfo(consecration_glyph_of_consecration cd_haste=melee if_spell=sanctity_of_battle)
	SpellInfo(consecration_glyph_of_consecration unusable=1 glyph=!glyph_of_consecration)
Define(consecration_glyph_of_the_consecrator 159556)
	SpellInfo(consecration_glyph_of_the_consecrator cd=9)
	SpellInfo(consecration_glyph_of_the_consecrator cd_haste=melee if_spell=sanctity_of_battle)
	SpellInfo(consecration_glyph_of_the_consecrator unusable=1 glyph=!glyph_of_the_consecrator)
Define(crusader_strike 35395)
	SpellInfo(crusader_strike holy=-1 cd=4.5)
	SpellInfo(crusader_strike buff_holy=holy_avenger_buff buff_holy_amount=-2 if_spell=holy_avenger)
	SpellInfo(crusader_strike cd_haste=melee if_spell=sanctity_of_battle)
Define(divine_crusader_buff 144595)
	SpellInfo(divine_crusader_buff duration=12)
Define(divine_protection 498)
	SpellInfo(divine_protection cd=60 gcd=0)
	SpellInfo(divine_protection cd=30 if_spell=unbreakable_spirit)
	SpellInfo(divine_protection buff_cdr=cooldown_reduction_strength_buff specialization=retribution)
	SpellInfo(divine_protection buff_cdr=cooldown_reduction_tank_buff specialization=protection)
	SpellAddBuff(divine_protection divine_protection_buff=1)
Define(divine_protection_buff 498)
	SpellInfo(divine_protection_buff duration=8)
Define(divine_purpose 86172)
Define(divine_purpose_buff 90174)
	SpellInfo(divine_purpose_buff duration=8)
Define(divine_storm 53385)
	SpellInfo(divine_storm holy=3)
	SpellRequire(divine_storm holy 0=buff,divine_crusader_buff itemset=T16_melee itemcount=4)
	SpellRequire(divine_storm holy 0=buff,divine_purpose_buff if_spell=divine_purpose)
	SpellAddBuff(divine_storm divine_crusader_buff=0 itemset=T16_melee itemcount=4)
	SpellAddBuff(divine_storm divine_purpose_buff=0 if_spell=divine_purpose)
	SpellAddBuff(divine_storm final_verdict_buff=0 if_spell=final_verdict)
Define(empowered_hammer_of_wrath 157496)
Define(empowered_seals 152263)
Define(empowered_seals_talent 19)
Define(eternal_flame 114163)
	SpellInfo(eternal_flame holy=finisher max_holy=3)
	SpellRequire(eternal_flame holy 0=buff,bastion_of_power_buff if_spell=shield_of_the_righteous itemset=T16_tank itemcount=4)
	SpellRequire(eternal_flame holy 0=buff,divine_purpose_buff if_spell=divine_purpose)
	SpellAddBuff(eternal_flame bastion_of_glory_buff=0 if_spell=shield_of_the_righteous)
	SpellAddBuff(eternal_flame bastion_of_power_buff=0 if_spell=shield_of_the_righteous itemset=T16_tank itemcount=4)
	SpellAddBuff(eternal_flame divine_purpose_buff=0 if_spell=divine_purpose)
	SpellAddTargetBuff(eternal_flame eternal_flame_buff=1)
Define(eternal_flame_buff 114163)
	SpellInfo(eternal_flame_buff duration=30 haste=spell tick=3)
Define(execution_sentence 114157)
	SpellInfo(execution_sentence cd=60)
Define(exorcism 879)
	SpellInfo(exorcism holy=-1 cd=15)
	SpellInfo(exorcism buff_holy=holy_avenger_buff buff_holy_amount=-2 if_spell=holy_avenger)
	SpellInfo(exorcism cd_haste=melee if_spell=sanctity_of_battle)
	SpellInfo(exorcism replace=exorcism_glyphed unusable=1 glyph=glyph_of_mass_exorcism)
Define(exorcism_glyphed 122032)
	SpellInfo(exorcism_glyphed holy=-1 cd=15)
	SpellInfo(exorcism_glyphed buff_holy=holy_avenger_buff buff_holy_amount=-2 if_spell=holy_avenger)
	SpellInfo(exorcism_glyphed cd_haste=melee if_spell=sanctity_of_battle)
	SpellInfo(exorcism_glyphed unusable=1 glyph=!glyph_of_mass_exorcism)
Define(final_verdict 157048)
	SpellInfo(final_verdict holy=3)
	SpellRequire(final_verdict holy 0=buff,divine_purpose_buff if_spell=divine_purpose)
	SpellAddBuff(final_verdict divine_purpose_buff=0 if_spell=divine_purpose)
	SpellAddBuff(final_verdict final_verdict_buff=1)
Define(final_verdict_buff 157048)
	SpellInfo(final_verdict_buff duration=30)
Define(final_verdict_talent 21)
Define(fist_of_justice 105593)
	SpellInfo(fist_of_justice cd=30 interrupt=1)
Define(flash_of_light 19750)
	SpellAddBuff(flash_of_light selfless_healer_buff=0 if_spell=selfless_healer)
Define(glyph_of_consecration 54928)
Define(glyph_of_the_consecrator 159557)
Define(glyph_of_final_wrath 54935)
Define(glyph_of_focused_shield 54930)
Define(glyph_of_rebuke 54925)
Define(glyph_of_mass_exorcism 122028)
Define(grand_crusader 85043)
Define(grand_crusader_buff 85416)
	SpellInfo(grand_crusader_buff duration=6)
Define(guardian_of_ancient_kings 86659)
	SpellInfo(guardian_of_ancient_kings cd=180 gcd=0)
	SpellInfo(guardian_of_ancient_kings buff_cdr=cooldown_reduction_tank_buff)
	SpellAddBuff(guardian_of_ancient_kings guardian_of_ancient_kings_buff=1)
Define(guardian_of_ancient_kings_buff 86659)
	SpellInfo(guardian_of_ancient_kings_buff duration=8)
Define(hammer_of_justice 853)
	SpellInfo(hammer_of_justice cd=60 interrupt=1)
Define(hammer_of_the_righteous 53595)
	SpellInfo(hammer_of_the_righteous holy=-1 cd=4.5)
	SpellInfo(hammer_of_the_righteous buff_holy=holy_avenger_buff buff_holy_amount=-2 if_spell=holy_avenger)
	SpellInfo(hammer_of_the_righteous cd_haste=melee if_spell=sanctity_of_battle)
Define(hammer_of_wrath 24275)
	SpellInfo(hammer_of_wrath cd=6 target_health_pct=20)
	SpellInfo(hammer_of_wrath cd=3 specialization=retribution if_spell=sanctified_wrath)
	SpellInfo(hammer_of_wrath holy=-1 specialization=retribution)
	SpellInfo(hammer_of_wrath buff_holy=holy_avenger_buff buff_holy_amount=-2 if_spell=holy_avenger)
	SpellInfo(hammer_of_wrath cd_haste=melee if_spell=sanctity_of_battle)
	SpellInfo(hammer_of_wrath replace=hammer_of_wrath_empowered unusable=1 if_spell=empowered_hammer_of_wrath)
	SpellRequire(hammer_of_wrath target_health_pct 100=buff,avenging_wrath_melee_buff specialization=retribution)
Define(hammer_of_wrath_empowered 158392)
	SpellInfo(hammer_of_wrath_empowered cd=6 target_health_pct=35)
	SpellInfo(hammer_of_wrath_empowered cd=3 specialization=retribution if_spell=sanctified_wrath)
	SpellInfo(hammer_of_wrath_empowered holy=-1 specialization=retribution)
	SpellInfo(hammer_of_wrath_empowered buff_holy=holy_avenger_buff buff_holy_amount=-2 if_spell=holy_avenger)
	SpellInfo(hammer_of_wrath_empowered cd_haste=melee if_spell=sanctity_of_battle)
	SpellRequire(hammer_of_wrath_empowered target_health_pct 100=buff,avenging_wrath_melee_buff specialization=retribution)
Define(hand_of_freedom 1044)
	SpellInfo(hand_of_freedom cd=25)
	SpellInfo(hand_of_freedom buff_cdr=cooldown_reduction_strength_buff specialization=retribution)
Define(holy_avenger 105809)
	SpellInfo(holy_avenger cd=120 gcd=0)
Define(holy_avenger_buff 105809)
	SpellInfo(holy_avenger_buff duration=18)
Define(holy_prism 114165)
	SpellInfo(holy_prism cd=20)
Define(holy_wrath 119072)
	SpellInfo(holy_wrath cd=15)
	SpellInfo(holy_wrath holy=-1 if_spell=sanctified_wrath_tank)
	SpellInfo(holy_wrath cd_haste=melee if_spell=sanctity_of_battle)
Define(judgment 20271)
	SpellInfo(judgment cd=6)
	SpellInfo(judgment holy=-1 if_spell=judgments_of_the_wise)
	SpellInfo(judgment buff_holy=holy_avenger_buff buff_holy_amount=-2 if_spell=holy_avenger)
	SpellInfo(judgment cd_haste=melee if_spell=sanctity_of_battle)
	SpellInfo(judgment selfless_healer_buff=1 if_spell=selfless_healer)
	SpellAddBuff(judgment liadrins_righteousness_buff=1 if_stance=paladin_seal_of_righteousness if_spell=empowered_seals)
	SpellAddBuff(judgment maraads_truth_buff=1 if_stance=paladin_seal_of_truth if_spell=empowered_seals)
	SpellAddBuff(judgment uthers_insight_buff=1 if_stance=paladin_seal_of_insight if_spell=empowered_seals)
Define(liadrins_righteousness_buff 156989)
	SpellInfo(liadrins_righteousness_buff duration=20)
Define(lights_hammer 114158)
	SpellInfo(lights_hammer cd=60)
Define(maraads_truth_buff 156990)
	SpellInfo(maraads_truth_buff duration=20)
Define(rebuke 96231)
	SpellInfo(rebuke cd=15 gcd=0 interrupt=1)
	SpellInfo(rebuke addcd=5 glyph=glyph_of_rebuke)
Define(righteous_fury 25780)
Define(sacred_shield 20925)
	SpellInfo(sacred_shield cd=6)
	SpellAddBuff(sacred_shield sacred_shield_buff=1)
Define(sacred_shield_buff 20925)
	SpellInfo(sacred_shield duration=30 haste=spell tick=6)
Define(sanctified_wrath 53376)
Define(sanctified_wrath_tank 171648)
Define(sanctified_wrath_talent 14)
Define(seal_of_insight 20165)
	SpellInfo(seal_of_insight to_stance=paladin_seal_of_insight)
	SpellInfo(seal_of_insight unusable=1 if_stance=paladin_seal_of_insight)
Define(seal_of_righteousness 20154)
	SpellInfo(seal_of_righteousness to_stance=paladin_seal_of_righteousness)
	SpellInfo(seal_of_righteousness unusable=1 if_stance=paladin_seal_of_righteousness)
	SpellAddBuff(seal_of_righteousness seal_of_righteousness_buff=1)
Define(seal_of_righteousness_buff 20154)
Define(seal_of_truth 31801)
	SpellInfo(seal_of_truth to_stance=paladin_seal_of_truth)
	SpellInfo(seal_of_truth unusable=1 if_stance=paladin_seal_of_truth)
	SpellAddBuff(seal_of_truth seal_of_truth_buff=1)
Define(seal_of_truth_buff 31801)
Define(selfless_healer 85804)
Define(selfless_healer_buff 114250)
	SpellInfo(selfless_healer_buff duration=15 maxstacks=3)
Define(selfless_healer_talent 7)
Define(seraphim 152262)
	SpellInfo(seraphim cd=30 gcd=0 holy=5)
Define(seraphim_buff 152262)
	SpellInfo(seraphim_buff duration=15)
Define(seraphim_talent 20)
Define(shield_of_the_righteous 53600)
	SpellInfo(shield_of_the_righteous cd=1.5 gcd=0 holy=3)
	SpellInfo(shield_of_the_righteous cd_haste=melee haste=melee if_spell=sanctity_of_battle)
	SpellRequire(shield_of_the_righteous holy 0=buff,divine_purpose_buff if_spell=divine_purpose)
	SpellAddBuff(shield_of_the_righteous bastion_of_glory_buff=1 shield_of_the_righteous_buff=1)
	SpellAddBuff(shield_of_the_righteous divine_purpose_buff=0 if_spell=divine_purpose)
Define(shield_of_the_righteous_buff 132403)
	SpellInfo(shield_of_the_righteous_buff duration=3)
Define(speed_of_light 85499)
	SpellInfo(speed_of_light cd=45 gcd=0)
Define(templars_verdict 85256)
	SpellInfo(templars_verdict holy=3)
	SpellRequire(templars_verdict holy 0=buff,divine_purpose_buff if_spell=divine_purpose)
	SpellAddBuff(templars_verdict divine_purpose_buff=0 if_spell=divine_purpose)
Define(unbreakable_spirit 114154)
Define(uthers_insight_buff 156988)
	SpellInfo(uthers_insight_buff duration=20)
SpellList(word_of_glory_no_holy_buff bastion_of_power_buff divine_purpose_buff)
]]

	OvaleScripts:RegisterScript("PALADIN", name, desc, code, "include")
end
