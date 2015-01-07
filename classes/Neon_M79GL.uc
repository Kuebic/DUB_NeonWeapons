class Neon_M79GL extends KFMod.M79GrenadeLauncher;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeaponsV1_0_T.M79GL.M79_shdr"
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_M79Attachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_M79Pickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonM79'
	ItemName="Neon M79";
}
