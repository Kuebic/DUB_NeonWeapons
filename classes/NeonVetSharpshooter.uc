//----------------------
//Sharpshooter perk extension to give the Cyber MK23 and Cyber Dual MK23s proper bonuses
//----------------------
//Super sneaky way to get the cyber weapons' bonuses consistent with their normal counter parts.
//----------------------
class NeonVetSharpshooter extends KFVetSharpshooter
	abstract;
/*
static function float GetHeadShotDamMulti(KFPlayerReplicationInfo KFPRI, KFPawn P, class<DamageType> DmgType)
{
	if(DmgType == class'CyberWeaponsV4.CWDamTypeMK23Pistol')
		return super.GetHeadShotDamMulti(KFPRI, P, class'KFMod.DamTypeMK23Pistol');
	if(DmgType == class'CyberWeaponsV4.CWDamTypeDualMK23Pistol')
		return super.GetHeadShotDamMulti(KFPRI, P, class'KFMod.DamTypeDualMK23Pistol');
	return super.GetHeadShotDamMulti(KFPRI, P, DmgType);
}

static function float ModifyRecoilSpread(KFPlayerReplicationInfo KFPRI, WeaponFire Other, out float Recoil){
	if(CyberMK23Pistol(Other.Weapon) != none)
		return super.ModifyRecoilSpread(KFPRI, MK23Fire(Other), Recoil);
	else if(CyberDualMK23Pistols(Other.Weapon) != none)
		return super.ModifyRecoilSpread(KFPRI, DualMK23Fire(Other), Recoil);
	return super.ModifyRecoilSpread(KFPRI, Other, Recoil);
}

static function float GetReloadSpeedModifier(KFPlayerReplicationInfo KFPRI, KFWeapon Other){
	if (CyberMK23Pistol(Other) != none)
		return super.GetReloadSpeedModifier(KFPRI, MK23Pistol(Other));
	else if(CyberDualMK23Pistols(Other) != none)
		return super.GetReloadSpeedModifier(KFPRI, DualMK23Pistol(Other));
	return super.GetReloadSpeedModifier(KFPRI, Other);
}
*/
static function float GetCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item){
	if(Item == class'Neon_DualiesPickup')
		return super.GetCostScaling(KFPRI, class'DualiesPickup');
	else if(Item == class'Neon_DeaglePickup')
		return super.GetCostScaling(KFPRI, class'DeaglePickup');
	else if(Item == class'Neon_DualDeaglePickup')
		return super.GetCostScaling(KFPRI, class'DualDeaglePickup');
	else if(Item == class'Neon_WinchesterPickup')
		return super.GetCostScaling(KFPRI, class'WinchesterPickup');
	return super.GetCostScaling(KFPRI, Item);
}

defaultproperties
{
}
