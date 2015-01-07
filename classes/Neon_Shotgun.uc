class Neon_Shotgun extends Shotgun;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeaponsV1_0_T.Shotgun.Shotgun_SHDR';
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_ShotgunAttachment';
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_ShotgunPickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonShotgun'
	ItemName="Neon Shotgun"
	LightHue=30
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
