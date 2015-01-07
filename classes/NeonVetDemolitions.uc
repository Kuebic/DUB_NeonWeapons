class NeonVetDemolitions extends KFVetDemolitions
	abstract;

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
		KFHumanPawn(P).CreateInventoryVeterancy("DUB_NeonWeaponsV1_0.Neon_M79GL", default.StartingWeaponSellPriceLevel6);
	}
}

defaultproperties
{
}
