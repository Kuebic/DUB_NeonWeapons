class Neon_MAC10MP extends MAC10MP;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_Neon_Weapons.MAC10.MAC10_SHDR"
	SkinRefs[1] = "DUB_Neon_Weapons.MAC10_SIL_shdr"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_MAC10Attachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_MAC10Pickup';
}
