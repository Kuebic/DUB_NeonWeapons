class Neon_Knife extends Knife;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeaponsV1_0_T.Knife.Knife_shdr'
	BloodyMaterial = Shader'DUB_NeonWeaponsV1_0_T.Knife.Knife_bloody_shdr'
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_KnifeAttachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_KnifePickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonKnife'
	ItemName="Neon Knife";
}
