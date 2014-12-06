//----------------------
//Commando perk extension to give the Cyber SCARMK17 its proper bonuses
//----------------------
//Super sneaky way to get the cyber weapons' bonuses consistent with their normal counter parts.
//----------------------
class NeonVetCommando extends KFVetCommando abstract;

static function float GetMagCapacityMod(KFPlayerReplicationInfo KFPRI, KFWeapon Other){
	if(Neon_Bullpup(Other) != None)
		return super.GetMagCapacityMod(KFPRI, Bullpup(Other));
	return super.GetMagCapacityMod(KFPRI, Other);
}
/*
static function float GetAmmoPickupMod(KFPlayerReplicationInfo KFPRI, KFAmmunition Other){
	if(CyberSCARAmmo(Other) != None)
		return super.GetAmmoPickupMod(KFPRI, SCARMK17Ammo(Other));
	return super.GetAmmoPickupMod(KFPRI, Other);
}

static function float AddExtraAmmoFor(KFPlayerReplicationInfo KFPRI, Class<Ammunition> AmmoType){
	if(AmmoType == class'CyberSCARAmmo')
		return super.AddExtraAmmoFor(KFPRI, class'SCARMK17Ammo');
	return super.AddExtraAmmoFor(KFPRI, AmmoType);
}

static function int AddDamage(KFPlayerReplicationInfo KFPRI, KFMonster Injured, KFPawn Instigator, int InDamage, class<DamageType> DmgType)
{
	if(DmgType == class'CyberWeaponsV4.CWDamTypeSCAR')
		return super.AddDamage(KFPRI, Injured, Instigator, InDamage, class'KFMod.DamTypeSCARMK17AssaultRifle');
	return super.AddDamage(KFPRI, Injured, Instigator, InDamage, DmgType);
}*/

static function float ModifyRecoilSpread(KFPlayerReplicationInfo KFPRI, WeaponFire Other, out float Recoil){
	if(Neon_Bullpup(Other.Weapon) != None)
		return super.ModifyRecoilSpread(KFPRI, BullpupFire(Other), Recoil);
	return super.ModifyRecoilSpread(KFPRI, Other, Recoil);
}

static function float GetCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item){
	if(Item == class'Neon_BullpupPickup')
		return super.GetCostScaling(KFPRI, class'BullpupPickup');
	return super.GetCostScaling(KFPRI, Item);
}

// Give Extra Items as default
static function AddDefaultInventory(KFPlayerReplicationInfo KFPRI, Pawn P)
{
	// If Level 5, give them Bullpup
	if ( KFPRI.ClientVeteranSkillLevel == 5 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("DUB_NeonWeapons.Neon_Bullpup", default.StartingWeaponSellPriceLevel5);
	}

	// If Level 6, give them an AK47
	if ( KFPRI.ClientVeteranSkillLevel == 6 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("KFMod.NeonAK47AssaultRifle", default.StartingWeaponSellPriceLevel6);
	}
}

defaultproperties
{
}
