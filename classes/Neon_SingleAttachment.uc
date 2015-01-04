class Neon_SingleAttachment extends SingleAttachment;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.pistol.Ninemm_3rd_SHDR'
	mTracerClass=Class'DUB_NeonWeapons.Neon_SingleTracer'
	mMuzFlashClass=Class'DUB_NeonEffects.Neon_MuzzleFlash3rdPistol'
	LightType=LT_Steady
	LightHue=135
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000
	LightPeriod=3;
}
