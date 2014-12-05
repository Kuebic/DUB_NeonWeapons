class Neon_Knife extends Knife;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Combiner'DUB_NeonWeapons_T.Knife.Knife_cmb'
	BloodyMaterial = Combiner'DUB_NeonWeapons_T.Knife.Knife_bloody_cmb'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_KnifeAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_KnifePickup';
}
