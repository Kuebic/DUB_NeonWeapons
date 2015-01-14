class Neon_Axe extends Axe;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.Axe.Axe_shdr'
	BloodyMaterial = Shader'DUB_NeonWeapons_T.Axe.Axe_bloody_shdr'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_AxeAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_AxePickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonAxe'
	ItemName="Neon Axe";
}
