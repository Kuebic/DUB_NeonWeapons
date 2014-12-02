class Neon_Bullpup extends Bullpup;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_Neon_Weapons.Bullpup.Bullpup_SHDR'
	Skins[1] = Shader'DUB_Neon_Weapons.Bullpup.reflex_sight_A_unlit'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_BullpupAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_BullpupPickup';
}
