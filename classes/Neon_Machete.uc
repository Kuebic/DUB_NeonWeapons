class Neon_Machete extends Machete;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Combiner'DUB_NeonWeapons_T.Machete.Machete_cmb'
	BloodyMaterial = Combiner'DUB_NeonWeapons_T.Machete.Machete_bloody_cmb'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_MacheteAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_MachetePickup';
}
