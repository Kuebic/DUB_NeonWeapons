//----------------------
//Support perk extension to give the Neon Weapons their proper bonuses
//----------------------
//Super sneaky way to get the Neon weapons' bonuses consistent with their normal counter parts.
//----------------------
class NeonVetSupportSpec extends KFVetSupportSpec abstract;

static function float GetCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item){
	if(Item == class'Neon_ShotgunPickup')
		return super.GetCostScaling(KFPRI, class'ShotgunPickup');
	else if(Item == class'Neon_BoomstickPickup')
		return super.GetCostScaling(KFPRI, class'BoomstickPickup');
	else if(Item == class'Neon_AA12Pickup')
		return super.GetCostScaling(KFPRI, class'AA12Pickup');
	return super.GetCostScaling(KFPRI, Item);
}
// Give Extra Items as Default
static function AddDefaultInventory(KFPlayerReplicationInfo KFPRI, Pawn P)
{
	// If Level 5, give them Assault Shotgun
	if ( KFPRI.ClientVeteranSkillLevel == 5 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("DUB_NeonWeaponsV1_0.Neon_Shotgun", default.StartingWeaponSellPriceLevel5);
	}

	// If Level 6, give them Hunting Shotgun
	if ( KFPRI.ClientVeteranSkillLevel == 6 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("DUB_NeonWeaponsV1_0.Neon_BoomStick", default.StartingWeaponSellPriceLevel6);
	}
}
defaultproperties
{
}
