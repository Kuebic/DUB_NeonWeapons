//----------------------
//Sharpshooter perk extension to give the Neon weapons proper bonuses
//----------------------
//Super sneaky way to get the Neon weapons' bonuses consistent with their normal counter parts.
//----------------------
class NeonVetSharpshooter extends KFVetSharpshooter
	abstract;

static function float GetCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item){
	if(Item == class'Neon_DualiesPickup')
		return super.GetCostScaling(KFPRI, class'DualiesPickup');
	else if(Item == class'Neon_DeaglePickup')
		return super.GetCostScaling(KFPRI, class'DeaglePickup');
	else if(Item == class'Neon_DualDeaglePickup')
		return super.GetCostScaling(KFPRI, class'DualDeaglePickup');
	else if(Item == class'Neon_WinchesterPickup')
		return super.GetCostScaling(KFPRI, class'WinchesterPickup');
	else if(Item == class'Neon_CrossbowPickup')
		return super.GetCostScaling(KFPRI, class'CrossbowPickup');
	else if(Item == class'Neon_M14Pickup')
		return super.GetCostScaling(KFPRI, class'M14EBRPickup');
	return super.GetCostScaling(KFPRI, Item);
}

// Give Extra Items as default
static function AddDefaultInventory(KFPlayerReplicationInfo KFPRI, Pawn P)
{
	// If Level 5, give them a  Lever Action Rifle
	if ( KFPRI.ClientVeteranSkillLevel == 5 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("DUB_NeonWeapons.Neon_Winchester", default.StartingWeaponSellPriceLevel5);
	}

	// If Level 6, give them a Crossbow
	if ( KFPRI.ClientVeteranSkillLevel == 6 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("DUB_NeonWeapons.Neon_Crossbow", default.StartingWeaponSellPriceLevel6);
	}
}
defaultproperties
{
}
