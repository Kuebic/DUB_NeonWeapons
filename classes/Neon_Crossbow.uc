class Neon_Crossbow extends KFMod.Crossbow;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeaponsV1_0_T.Xbow.Crossbow_shdr"
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_CrossbowAttachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_CrossbowPickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonCrossbow_2'
	ItemName="Neon Crossbow";
}
