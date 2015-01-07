class Neon_Dualies extends Dualies;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeaponsV1_0_T.pistol.Ninemm_SHDR'
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_DualiesAttachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_DualiesPickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonDual9mm'
	FireModeClass(0)=Class'DUB_NeonWeaponsV1_0.Neon_DualiesFire'
	ItemName="Neon Dual 9mm"
	LightHue=135
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000
	LightPeriod=3;
}
