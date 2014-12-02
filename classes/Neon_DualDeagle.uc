class Neon_DualDeagle extends DualDeagle;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
Skins[0] = Shader'DUB_Neon_Weapons.Deagle.Deagle_SHDR'
AttachmentClass=Class'DUB_NeonWeapons.Neon_DualDeagleAttachment'
PickupClass=Class'DUB_NeonWeapons.Neon_DualDeaglePickup';
}