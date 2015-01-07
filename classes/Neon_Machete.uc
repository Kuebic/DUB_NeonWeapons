class Neon_Machete extends KFMod.Machete;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeaponsV1_0_T.Machete.Machete_shdr'
	BloodyMaterial = Shader'DUB_NeonWeaponsV1_0_T.Machete.Machete_bloody_shdr'
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_MacheteAttachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_MachetePickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonMachete'
	ItemName="Neon Machete"
	GroupOffset=2
	Priority=50;
}
