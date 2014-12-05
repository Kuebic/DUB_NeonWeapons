class Neon_Winchester extends Winchester;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.Winchester.Winchester_SHDR'
	Skins[1] =Shader'DUB_NeonWeapons_T.Winchester.Winchester_SHDR'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_WinchesterAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_WinchesterPickup';
}
