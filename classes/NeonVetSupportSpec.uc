//----------------------
//Support perk extension to give the Cyber AA12 and Cyber Vlad their proper bonuses
//----------------------
//Super sneaky way to get the cyber weapons' bonuses consistent with their normal counter parts.
//----------------------
class NeonVetSupportSpec extends KFVetSupportSpec abstract;
/*
static function float AddExtraAmmoFor(KFPlayerReplicationInfo KFPRI, Class<Ammunition> AmmoType){
	if(AmmoType == class'CyberAA12Ammo')
		return super.AddExtraAmmoFor(KFPRI, class'AA12Ammo');
	else if(AmmoType == class'CyberVladAmmo')
		return super.AddExtraAmmoFor(KFPRI, class'NailGunAmmo');
	return super.AddExtraAmmoFor(KFPRI, AmmoType);
}

static function int AddDamage(KFPlayerReplicationInfo KFPRI, KFMonster Injured, KFPawn Instigator, int InDamage, class<DamageType> DmgType)
{
	if(DmgType == class'CyberWeaponsV4.CWDamTypeAA12Shotgun')
		return super.AddDamage(KFPRI, Injured, Instigator, InDamage, class'KFMod.DamTypeAA12Shotgun');
	if(DmgType == class'CyberWeaponsV4.CWDamTypeVlad')
		return super.AddDamage(KFPRI, Injured, Instigator, InDamage, class'KFMod.DamTypeNailGun');
	return super.AddDamage(KFPRI, Injured, Instigator, InDamage, DmgType);
}
*/
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
		KFHumanPawn(P).CreateInventoryVeterancy("Dub_NeonWeapons.Neon_Shotgun", default.StartingWeaponSellPriceLevel5);
	}

	// If Level 6, give them Hunting Shotgun
	if ( KFPRI.ClientVeteranSkillLevel == 6 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("Dub_NeonWeapons.Neon_BoomStick", default.StartingWeaponSellPriceLevel6);
	}
}
defaultproperties
{
}
