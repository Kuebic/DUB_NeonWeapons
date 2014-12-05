class Neon_AA12AutoShotgun extends AA12Autoshotgun;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeapons_T.AA12.AA12_SHDR"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_AA12Attachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_AA12Pickup';
}
