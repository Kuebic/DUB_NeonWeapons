class Neon_Shotgun extends Shotgun;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.Shotgun.Shotgun_SHDR';
	AttachmentClass=Class'DUB_NeonWeapons.Neon_ShotgunAttachment';
	PickupClass=Class'DUB_NeonWeapons.Neon_ShotgunPickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonShotgun'
	ItemName="Neon Shotgun"
	LightHue=30
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
