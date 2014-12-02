class Neon_Single extends Single;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
Skins[0] = Shader'DUB_Neon_Weapons.pistol.Ninemm_SHDR'
AttachmentClass=Class'DUB_NeonWeapons.Neon_SingleAttachment'
PickupClass=Class'DUB_NeonWeapons.Neon_SinglePickup';
}