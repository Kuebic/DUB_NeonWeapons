class Neon_AK47AR extends KFMod.AK47AssaultRifle;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeaponsV1_0_T.AK.AK47_shdr"
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_AK47Attachment'
	FireModeClass(0)=Class'DUB_NeonWeaponsV1_0.Neon_AK47Fire'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_AK47Pickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonAK47'
	ItemName="Neon AK47"
	LightHue=0
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
