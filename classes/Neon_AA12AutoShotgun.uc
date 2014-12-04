class Neon_AA12AutoShotgun extends AA12Autoshotgun;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_Neon_Weapons.AA12.AA12_SHDR"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_AA12Attachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_AA12Pickup';
}
