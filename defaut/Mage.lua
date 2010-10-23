Ovale.defaut["MAGE"]=
[[
#Spells
Define(ARCANEBARRAGE 44425) #arcane instant
	SpellAddDebuff(ARCANEBARRAGE ARCANEBLASTDEBUFF=0)
Define(ARCANEBLAST 30451) #arcane stacks*4 cost increased
	SpellAddDebuff(ARCANEBLAST ARCANEBLASTDEBUFF=10)
Define(ARCANEMISSILES 5143) #arcane channel
	SpellAddDebuff(ARCANEMISSILES ARCANEBLASTDEBUFF=0 ARCANEMISSILEBUFF=0)
Define(ARCANEPOWER 12042) #arcane cd 
	SpellInfo(ARCANEPOWER cd=84)
Define(COLDSNAP 11958) #frost reset cd
Define(COMBUSTION 11129) #fire cd consume dot
	SpellInfo(COMBUSTION cd=180)
Define(DEEPFREEZE 44572) #frost instant
	SpellAddBuff(DEEPFREEZE FINGERSOFFROST=-1)
Define(EVOCATION 12051)
	SpellInfo(EVOCATION cd=240)
Define(FIREBLAST 2136) #fire instant
Define(FIREBALL 133) #fire 2.5
Define(FLAMEORB 82731)
	SpellInfo(FLAMEORB cd=60)
Define(FROSTBOLT 116) #frost
Define(FROSTFIREBOLT 44614) #frost+fire
	SpellAddBuff(FROSTFIREBOLT BRAINFREEZE=-1 FINGERSOFFROST=-1)
Define(ICEARMOR 7302)
Define(ICELANCE 30455) #frost instant
	SpellAddBuff(ICELANCE FINGERSOFFROST=-1)
Define(ICYVEINS 12472) #frost cd
	SpellInfo(ICYVEINS cd=144)
Define(LIVINGBOMB 44457) #fire dot
	SpellAddTargetDebuff(LIVINGBOMB LIVINGBOMB=12)
Define(MAGEARMOR 6117)
Define(MIRRORIMAGE 55342)
	SpellInfo(MIRRORIMAGE cd=180)
Define(MOLTENARMOR 30482)
Define(PRESENCEOFMIND 12043) #arcane next spell instant
Define(PYROBLAST 11366) #fire dot
	SpellAddTargetDebuff(PYROBLAST PYROBLAST=12)
	SpellAddBuff(PYROBLAST HOTSTREAK=0)
Define(SCORCH 2948) #fire 1.5 (cast while moving with firestarter talent)
Define(SUMMONWATERELEMENTAL 31687) #frost pet
	SpellInfo(SUMMONWATERELEMENTAL cd=180)

#Buff
Define(BRAINFREEZE 57761) #frost (instant fireball/frostfire bolt)
Define(FINGERSOFFROST 44544) #frost boost ice lance/deep freeze
Define(HOTSTREAK 48108) #fire instant pyroblast
Define(ARCANEBLASTDEBUFF 36032)
Define(ARCANEMISSILEBUFF 79683)

#Item
Define(MANAGEMITEM 36799)

#Debuff
Define(IGNITE 12654)

#Talent
Define(FIRESTARTERTALENT 11431)

ScoreSpells(SCORCH PYROBLAST LIVINGBOMB FROSTFIREBOLT FIREBALL SUMMONWATERELEMENTAL FROSTBOLT ARCANEBLAST ARCANEMISSILES ARCANEBARRAGE
			DEEPFREEZE ICELANCE)

AddIcon help=main mastery=1
{
	unless InCombat() if BuffExpires(MAGEARMOR 400) and BuffExpires(MOLTENARMOR 400) and BuffExpires(ICEARMOR 400) Spell(MAGEARMOR)
	
	Spell(FLAMEORB)
	if Speed(more 0) Spell(ARCANEBARRAGE)
	unless 15s before Spell(EVOCATION)
	{
		#Mana conserve
		if DebuffPresent(ARCANEBLASTDEBUFF stacks=4) or
			{ManaPercent(less 90) and DebuffPresent(ARCANEBLASTDEBUFF stacks=3)} or
			{ManaPercent(less 85) and DebuffPresent(ARCANEBLASTDEBUFF stacks=2)}
		{
			if BuffPresent(ARCANEMISSILEBUFF) Spell(ARCANEMISSILES usable=1) 
			Spell(ARCANEBARRAGE)
		}
		if ManaPercent(less 60) Item(MANAGEMITEM usable=1)
		Spell(ARCANEBLAST)
	}
	if 15s before Spell(EVOCATION)
	{
		if ManaPercent(less 40) Spell(EVOCATION)
		Spell(ARCANEBLAST)
	}
}

AddIcon help=main mastery=2
{
	unless InCombat() if BuffExpires(MAGEARMOR 400) and BuffExpires(MOLTENARMOR 400) and BuffExpires(ICEARMOR 400) Spell(MOLTENARMOR)

	Spell(FLAMEORB)
	if TalentPoints(FIRESTARTERTALENT more 0) and Speed(more 0) Spell(SCORCH)
	if BuffPresent(HOTSTREAK) Spell(PYROBLAST)
	if TargetDebuffExpires(LIVINGBOMB 0 mine=1) and TargetDeadIn(more 12) Spell(LIVINGBOMB)
	if TargetDebuffExpires(PYROBLAST 2.5 haste=spell mine=1) Spell(PYROBLAST)
	Spell(FIREBALL)
}

AddIcon help=main mastery=3
{
	unless InCombat() if BuffExpires(MAGEARMOR 400) and BuffExpires(MOLTENARMOR 400) and BuffExpires(ICEARMOR 400) Spell(MOLTENARMOR)

	Spell(FLAMEORB)
	if PetPresent(no) Spell(SUMMONWATERELEMENTAL)
	if BuffPresent(FINGERSOFFROST) or Speed(more 0) {Spell(DEEPFREEZE) Spell(ICELANCE)}
	if BuffPresent(BRAINFREEZE) Spell(FROSTFIREBOLT)
	Spell(FROSTBOLT)
}

AddIcon help=cd mastery=1
{
	if DebuffPresent(ARCANEBLAST stacks=3) Spell(ARCANEPOWER)
	Spell(PRESENCEOFMIND)
	Item(Trinket0Slot usable=1)
	Item(Trinket1Slot usable=1)
	Spell(MIRRORIMAGE)
}

AddIcon help=cd mastery=2
{
	if TargetDebuffPresent(LIVINGBOMB mine=1) and TargetDebuffPresent(IGNITE mine=1)
			and TargetDebuffPresent(PYROBLAST mine=1)
		Spell(COMBUSTION)
	Item(Trinket0Slot usable=1)
	Item(Trinket1Slot usable=1)
	Spell(MIRRORIMAGE)
}

AddIcon help=cd mastery=3
{
	Spell(ICYVEINS)
	Item(Trinket0Slot usable=1)
	Item(Trinket1Slot usable=1)
	Spell(MIRRORIMAGE)
}

]]