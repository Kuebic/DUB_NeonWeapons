class Neon_Bullpup extends Bullpup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.Bullpup.Bullpup_SHDR'
	Skins[1] = Shader'DUB_NeonWeapons_T.Bullpup.reflex_sight_A_unlit'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_BullpupAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_BullpupPickup';
}
