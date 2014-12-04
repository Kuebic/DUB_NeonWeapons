//----------------------
//Commando perk extension to give the Cyber SCARMK17 its proper bonuses
//----------------------
//Super sneaky way to get the cyber weapons' bonuses consistent with their normal counter parts.
//----------------------
class NeonVetCommando extends KFVetCommando abstract;
/*
static function float GetMagCapacityMod(KFPlayerReplicationInfo KFPRI, KFWeapon Other){
	if(CyberSCAR(Other) != None)
		return super.GetMagCapacityMod(KFPRI, SCARMK17AssaultRifle(Other));
	return super.GetMagCapacityMod(KFPRI, Other);
}

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
}

static function float ModifyRecoilSpread(KFPlayerReplicationInfo KFPRI, WeaponFire Other, out float Recoil){
	if(CyberSCAR(Other.Weapon) != None)
		return super.ModifyRecoilSpread(KFPRI, SCARMK17Fire(Other), Recoil);
	return super.ModifyRecoilSpread(KFPRI, Other, Recoil);
}

static function float GetCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item){
	if(Item == class'CyberSCARPickup')
		return super.GetCostScaling(KFPRI, class'SCARMK17Pickup');
	return super.GetCostScaling(KFPRI, Item);
}
*/
defaultproperties
{
}
