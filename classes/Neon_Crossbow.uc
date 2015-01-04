class Neon_Crossbow extends KFMod.Crossbow;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeapons_T.Xbow.Crossbow_shdr"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_CrossbowAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_CrossbowPickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonCrossbow_2'
	ItemName="Neon Crossbow";
}
