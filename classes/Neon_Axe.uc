class Neon_Axe extends Axe;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Combiner'DUB_NeonWeapons_T.Axe.Axe_cmb'
	BloodyMaterial = Combiner'DUB_NeonWeapons_T.Axe.Axe_bloody_cmb'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_AxeAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_AxePickup';
}
