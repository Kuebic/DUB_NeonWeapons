class Neon_Machete extends Machete;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	Skins[0] = Combiner'DUB_Neon_Weapons.Machete.Machete_cmb'
	BloodyMaterial = Combiner'DUB_Neon_Weapons.Machete.Machete_bloody_cmb'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_MacheteAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_MachetePickup';
}
