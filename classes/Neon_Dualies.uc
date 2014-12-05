class Neon_Dualies extends Dualies;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.pistol.Ninemm_SHDR'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_DualiesAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_DualiesPickup';
}
