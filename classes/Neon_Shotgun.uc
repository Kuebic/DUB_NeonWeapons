class Neon_Shotgun extends Shotgun;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_Neon_Weapons.Shotgun.Shotgun_SHDR';
	AttachmentClass=Class'DUB_NeonWeapons.Neon_ShotgunAttachment';
	PickupClass=Class'DUB_NeonWeapons.Neon_ShotgunPickup';
}
