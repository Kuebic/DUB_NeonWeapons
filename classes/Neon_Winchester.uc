class Neon_Winchester extends Winchester;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_Neon_Weapons.Winchester.Winchester_SHDR'
	Skins[1] =Shader'DUB_Neon_Weapons.Winchester.Winchester_SHDR'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_WinchesterAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_WinchesterPickup';
}
