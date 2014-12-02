class Neon_Deagle extends Deagle;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_Neon_Weapons.Deagle.Deagle_SHDR"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_DeagleAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_DeaglePickup';
}
