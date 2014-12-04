class Neon_Axe extends Axe;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	Skins[0] = Combiner'DUB_Neon_Weapons.Axe.Axe_cmb'
	BloodyMaterial = Combiner'DUB_Neon_Weapons.Axe.Axe_bloody_cmb'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_AxeAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_AxePickup';
}
