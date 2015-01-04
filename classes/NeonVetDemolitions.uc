class NeonVetDemolitions extends KFVetDemolitions
	abstract;
/*
static function float AddExtraAmmoFor(KFPlayerReplicationInfo KFPRI, Class<Ammunition> AmmoType)
{
	if(AmmoType == class'CyberPipeAmmo')
		return super.AddExtraAmmoFor(KFPRI, class'PipeBombAmmo');
	return super.AddExtraAmmoFor(KFPRI, AmmoType);
}

static function int AddDamage(KFPlayerReplicationInfo KFPRI, KFMonster Injured, KFPawn Instigator, int InDamage, class<DamageType> DmgType)
{
	if(DmgType == class'CyberWeaponsV4.CWDamTypePipeBomb')
		return super.AddDamage(KFPRI, Injured, Instigator, InDamage, class'KFMod.DamTypePipeBomb');
	return super.AddDamage(KFPRI, Injured, Instigator, InDamage, DmgType);
}

static function int ReduceDamage(KFPlayerReplicationInfo KFPRI, KFPawn Injured, Pawn Instigator, int InDamage, class<DamageType> DmgType)
{
	if(DmgType == class'CyberWeaponsV4.CWDamTypePipeBomb')
		return super.ReduceDamage(KFPRI, Injured, Instigator, InDamage, class'KFMod.DamTypePipeBomb');
	return super.ReduceDamage(KFPRI, Injured, Instigator, InDamage, DmgType);
}

// Change the cost of particular items
static function float GetCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item)
{
	if (Item == class'CyberPipePickup')
		return super.GetCostScaling(KFPRI, class'PipeBombPickup');
	return super.GetCostScaling(KFPRI, Item);
}
*/
// Change the cost of particular ammo
static function float GetAmmoCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item)
{
	if (Item == class'Neon_M79Pickup')
		return super.GetAmmoCostScaling(KFPRI, class'M79Pickup');
	return super.GetAmmoCostScaling(KFPRI, Item);
}


// Give Extra Items as default
static function AddDefaultInventory(KFPlayerReplicationInfo KFPRI, Pawn P)
{
	// If Level 5, give them a pipe bomb
	if ( KFPRI.ClientVeteranSkillLevel == 5 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("KFMod.PipeBombExplosive", default.StartingWeaponSellPriceLevel5);
	}

	// If Level 6, give them a M79Grenade launcher and pipe bomb
	if ( KFPRI.ClientVeteranSkillLevel == 6 )
	{
	    // use level 5 sell price for the pipe bombs so the demo doesn't start with two things he can sell
		KFHumanPawn(P).CreateInventoryVeterancy("KFMod.PipeBombExplosive", default.StartingWeaponSellPriceLevel5);
		KFHumanPawn(P).CreateInventoryVeterancy("DUB_NeonWeapons.Neon_M79GL", default.StartingWeaponSellPriceLevel6);
	}
}

defaultproperties
{
}
