class Neon_Dualies extends Dualies;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.pistol.Ninemm_SHDR'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_DualiesAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_DualiesPickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonDual9mm'
	FireModeClass(0)=Class'DUB_NeonWeapons.Neon_DualiesFire'
	ItemName="Neon Dual 9mm"
	LightHue=135
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000
	LightPeriod=3;
}
