class Neon_Dualies extends Dualies;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
Skins[0] = Shader'DUB_Neon_Weapons.pistol.Ninemm_SHDR'
AttachmentClass=Class'DUB_NeonWeapons.Neon_DualiesAttachment'
PickupClass=Class'DUB_NeonWeapons.Neon_DualiesPickup';
}