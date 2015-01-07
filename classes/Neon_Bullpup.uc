class Neon_Bullpup extends Bullpup;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeaponsV1_0_T.Bullpup.Bullpup_SHDR'
	Skins[1] = Shader'DUB_NeonWeaponsV1_0_T.Bullpup.reflex_sight_A_unlit'
	FireModeClass(0)=Class'DUB_NeonWeaponsV1_0.Neon_BullpupFire'
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_BullpupAttachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_BullpupPickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonBullpup'
	ItemName="Neon Bullpup"
	LightHue=135
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000
	LightPeriod=3;
}
