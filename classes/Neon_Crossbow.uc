class Neon_Crossbow extends KFMod.Crossbow;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	SkinRefs[0] = Shader'DUB_NeonWeapons_T.Xbow.Crossbow_shdr'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_CrossbowAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_CrossbowPickup';
}
