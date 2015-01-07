//----------------------
//Berserker perk extension to give the Neon weapons its proper bonuses
//----------------------
//Super sneaky way to get the Neon weapons' bonuses consistent with their normal counter parts.
//----------------------
class NeonVetBerserker extends KFVetBerserker
	abstract;

static function float GetCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item)
{
	if (Item == class'Neon_MachetePickup')
		return super.GetCostScaling(KFPRI, class'MachetePickup');
	else if (Item == class'Neon_AxePickup')
		return super.GetCostScaling(KFPRI, class'AxePickup');
	else if (Item == class'Neon_KatanaPickup')
		return super.GetCostScaling(KFPRI, class'KatanaPickup');
	return super.GetCostScaling(KFPRI, Item);
}

// Give Extra Items as default
static function AddDefaultInventory(KFPlayerReplicationInfo KFPRI, Pawn P)
{
	// If Level 5, give them Machete
	if ( KFPRI.ClientVeteranSkillLevel == 5 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("DUB_NeonWeaponsV1_0.Neon_Machete", default.StartingWeaponSellPriceLevel5);
	}

	// If Level 6, give them an Axe
	if ( KFPRI.ClientVeteranSkillLevel == 6 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("DUB_NeonWeaponsV1_0.Neon_Axe", default.StartingWeaponSellPriceLevel6);
	}

	// If Level 6, give them Body Armor(Removed from Suicidal and HoE in Balance Round 7)
	if ( KFPRI.Level.Game.GameDifficulty < 5.0 && KFPRI.ClientVeteranSkillLevel == 6 )
	{
		P.ShieldStrength = 100;
	}
}

defaultproperties
{
}
