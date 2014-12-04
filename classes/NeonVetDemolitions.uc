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

// Change the cost of particular ammo
static function float GetAmmoCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item)
{
	if (Item == class'CyberPipePickup')
		return super.GetAmmoCostScaling(KFPRI, class'PipeBombPickup');
	return super.GetAmmoCostScaling(KFPRI, Item);
}
*/
defaultproperties
{
}
