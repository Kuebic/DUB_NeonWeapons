class Neon_SingleAttachment extends SingleAttachment;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeaponsV1_0_T.pistol.Ninemm_3rd_SHDR'
	mTracerClass=Class'DUB_NeonWeaponsV1_0.Neon_SingleTracer'
	mMuzFlashClass=Class'DUB_NeonEffectsV1_0.Neon_MuzzleFlash3rdPistol'
	LightType=LT_Steady
	LightHue=135
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000
	LightPeriod=3;
}
