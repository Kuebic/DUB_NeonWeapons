class Neon_M14Attachment extends M14EBRAttachment;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.M14AR.M14_3rd_shdr'
	mMuzFlashClass=Class'DUB_NeonEffects.Neon_MuzzleFlash3rdMP_red'
    mTracerClass=Class'DUB_NeonWeapons.Neon_SingleTracer'
	LightHue=0
	LightSaturation=45
	LightBrightness=120.000000
	LightRadius=10.000000;
}
