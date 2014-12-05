class Neon_MAC10MP extends MAC10MP;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeapons_T.MAC10.MAC10_SHDR"
	SkinRefs[1] = "DUB_NeonWeapons_T.MAC10_SIL_shdr"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_MAC10Attachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_MAC10Pickup';
}
