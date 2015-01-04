class Neon_AK47AR extends KFMod.AK47AssaultRifle;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeapons_T.AK.AK47_shdr"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_AK47Attachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_AK47Pickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonAK47'
	ItemName="Neon AK47"
	LightHue=0
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
