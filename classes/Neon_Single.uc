class Neon_Single extends Single;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.pistol.Ninemm_SHDR'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_SingleAttachment'
	FireModeClass(0)=Class'DUB_NeonWeapons.Neon_SingleFire'
	PickupClass=Class'DUB_NeonWeapons.Neon_SinglePickup';
}
