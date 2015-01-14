class Neon_Single extends Single;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.pistol.Ninemm_SHDR'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_SingleAttachment'
	FireModeClass(0)=Class'DUB_NeonWeapons.Neon_SingleFire'
	PickupClass=Class'DUB_NeonWeapons.Neon_SinglePickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_Neon9mm'
	ItemName="Neon 9mm"
	LightHue=135
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000
	LightPeriod=3;
}
