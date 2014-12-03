class Neon_Deagle extends Deagle;

#exec obj load file="DUB_Neon_Weapons.utx"

simulated function bool PutDown()
{
	if ( Instigator.PendingWeapon.class == class'DUB_NeonWeapons.Neon_DualDeagle' )
	{
		bIsReloading = false;
	}
	
	return super(KFWeapon).PutDown();
}

DefaultProperties
{
	SkinRefs[0] = "DUB_Neon_Weapons.Deagle.Deagle_SHDR"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_DeagleAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_DeaglePickup';
}
