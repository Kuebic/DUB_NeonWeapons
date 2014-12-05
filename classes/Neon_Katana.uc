class Neon_Katana extends Katana;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeapons_T.Katana.Katana_cmb"
	BloodyMaterialRef = "DUB_NeonWeapons_T.Katana.Katana_bloody_cmb"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_KatanaAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_KatanaPickup';
}
