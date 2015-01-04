class Neon_BullpupAttachment extends BullpupAttachment;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.Bullpup.Bullpup_3rd_SHDR'
	mMuzFlashClass=Class'DUB_NeonEffects.Neon_MuzzleFlash3rdMP'
    mTracerClass=Class'DUB_NeonWeapons.Neon_SingleTracer'
	LightHue=135
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
