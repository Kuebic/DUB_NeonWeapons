//----------------------
//Sharpshooter perk extension to give the Cyber Husk Gun proper bonuses
//----------------------
//Super sneaky way to get the cyber weapons' bonuses consistent with their normal counter parts.
//----------------------
class NeonVetFirebug extends KFVetFirebug
	abstract;
/*
static function float GetAmmoPickupMod(KFPlayerReplicationInfo KFPRI, KFAmmunition Other){
	if(CyberHuskGunAmmo(Other) != None)
		return super.GetAmmoPickupMod(KFPRI, HuskGunAmmo(Other));
	return super.GetAmmoPickupMod(KFPRI, Other);
}

static function float AddExtraAmmoFor(KFPlayerReplicationInfo KFPRI, Class<Ammunition> AmmoType){
	if(AmmoType == class'CyberHuskGunAmmo')
		return super.AddExtraAmmoFor(KFPRI, class'HuskGunAmmo');
	return super.AddExtraAmmoFor(KFPRI, AmmoType);
}

static function int AddDamage(KFPlayerReplicationInfo KFPRI, KFMonster Injured, KFPawn Instigator, int InDamage, class<DamageType> DmgType)
{
	if(DmgType == class'CyberWeaponsV4.CWDamTypeHuskGun')
		return super.AddDamage(KFPRI, Injured, Instigator, InDamage, class'KFMod.DamTypeHuskGun');
	if(DmgType == class'CyberWeaponsV4.CWDamTypeHuskGunImpact')
		return super.AddDamage(KFPRI, Injured, Instigator, InDamage, class'KFMod.DamTypeHuskGunProjectileImpact');
	return super.AddDamage(KFPRI, Injured, Instigator, InDamage, DmgType);
}
*/
static function float GetCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item){
	if(Item == class'Neon_MAC10Pickup')
		return super.GetCostScaling(KFPRI, class'MAC10Pickup');
	return super.GetCostScaling(KFPRI, Item);
}

// Give Extra Items as default
static function AddDefaultInventory(KFPlayerReplicationInfo KFPRI, Pawn P)
{
	// If Level 5, give them a Flame Thrower
	if ( KFPRI.ClientVeteranSkillLevel >= 5 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("KFMod.FlameThrower", default.StartingWeaponSellPriceLevel5);
	}

	// If Level 6, add Body Armor
	if ( KFPRI.ClientVeteranSkillLevel == 6 )
	{
		P.ShieldStrength = 100;
	}
}

defaultproperties
{
}
