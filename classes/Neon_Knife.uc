class Neon_Knife extends Knife;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	Skins[0] = Combiner'DUB_Neon_Weapons.Knife.Knife_cmb'
	BloodyMaterial = Combiner'DUB_Neon_Weapons.Knife.Knife_bloody_cmb'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_KnifeAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_KnifePickup';
}
