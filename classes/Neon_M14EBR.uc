class Neon_M14EBR extends KFMod.M14EBRBattleRifle;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeaponsV1_0_T.M14AR.M14_shdr"
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_M14Attachment'
	FireModeClass(0)=Class'DUB_NeonWeaponsV1_0.Neon_M14Fire'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_M14Pickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonM14'
	ItemName="Neon M14"
	LightHue=0
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
