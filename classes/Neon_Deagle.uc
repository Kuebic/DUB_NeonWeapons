class Neon_Deagle extends Deagle;

#exec obj load file="DUB_NeonWeapons_T.utx"

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
	SkinRefs[0] = "DUB_NeonWeapons_T.Deagle.Deagle_SHDR"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_DeagleAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_DeaglePickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonHandcannon'
	FireModeClass(0)=Class'DUB_NeonWeapons.Neon_DeagleFire'
	ItemName="Neon Handcannon"
	LightHue=135
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000
	LightPeriod=3;;
}
