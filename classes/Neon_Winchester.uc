class Neon_Winchester extends Winchester;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.Winchester.Winchester_SHDR'
	Skins[1] =Shader'DUB_NeonWeapons_T.Winchester.Winchester_SHDR'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_WinchesterAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_WinchesterPickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonWinchester'
	ItemName="Neon Lever Action Rifle"
	LightHue=30
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
