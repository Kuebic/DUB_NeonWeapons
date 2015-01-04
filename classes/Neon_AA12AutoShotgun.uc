class Neon_AA12AutoShotgun extends AA12Autoshotgun;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeapons_T.AA12.AA12_SHDR"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_AA12Attachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_AA12Pickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonAA12'
	ItemName="Neon AA12"
	LightHue=30
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
