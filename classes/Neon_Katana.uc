class Neon_Katana extends Katana;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_Neon_Weapons.Katana.Katana_cmb"
	BloodyMaterialRef = "DUB_Neon_Weapons.Katana.Katana_bloody_cmb"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_KatanaAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_KatanaPickup';
}
