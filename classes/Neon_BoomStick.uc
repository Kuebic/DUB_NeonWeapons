class Neon_BoomStick extends BoomStick;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeapons_T.BoomStick.BoomStick_SHDR"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_BoomStickAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_BoomStickPickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonBoomstick'
	ItemName="Neon Hunting Shotgun"
	LightHue=30
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
