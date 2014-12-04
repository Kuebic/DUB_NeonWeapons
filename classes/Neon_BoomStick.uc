class Neon_BoomStick extends BoomStick;

#exec obj load file="DUB_Neon_Weapons.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_Neon_Weapons.BoomStick.BoomStick_SHDR"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_BoomStickAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_BoomStickPickup';
}
