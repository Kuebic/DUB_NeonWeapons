class Neon_AA12AutoShotgun extends AA12Autoshotgun;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeaponsV1_0_T.AA12.AA12_SHDR"
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_AA12Attachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_AA12Pickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonAA12'
	ItemName="Neon AA12"
	LightHue=30
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
