class Neon_BoomStick extends BoomStick;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeaponsV1_0_T.BoomStick.BoomStick_SHDR"
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_BoomStickAttachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_BoomStickPickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonBoomstick'
	ItemName="Neon Hunting Shotgun"
	LightHue=30
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
