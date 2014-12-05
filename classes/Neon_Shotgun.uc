class Neon_Shotgun extends Shotgun;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.Shotgun.Shotgun_SHDR';
	AttachmentClass=Class'DUB_NeonWeapons.Neon_ShotgunAttachment';
	PickupClass=Class'DUB_NeonWeapons.Neon_ShotgunPickup';
}
