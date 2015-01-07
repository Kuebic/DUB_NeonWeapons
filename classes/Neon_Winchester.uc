class Neon_Winchester extends Winchester;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeaponsV1_0_T.Winchester.Winchester_SHDR'
	Skins[1] =Shader'DUB_NeonWeaponsV1_0_T.Winchester.Winchester_SHDR'
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_WinchesterAttachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_WinchesterPickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonWinchester'
	ItemName="Neon Lever Action Rifle"
	LightHue=30
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
