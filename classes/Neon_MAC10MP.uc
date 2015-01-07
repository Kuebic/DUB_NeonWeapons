class Neon_MAC10MP extends MAC10MP;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	SkinRefs[0] = "DUB_NeonWeaponsV1_0_T.MAC10.MAC10_SHDR"
	SkinRefs[1] = "DUB_NeonWeaponsV1_0_T.MAC10_SIL_shdr"
	FireModeClass(0)=Class'DUB_NeonWeaponsV1_0.Neon_MAC10Fire'
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_MAC10Attachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_MAC10Pickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonMAC10'
	ItemName="Neon MAC10"
	LightHue=135
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000
	LightPeriod=3;
}
