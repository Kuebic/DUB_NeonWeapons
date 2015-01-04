class Neon_Machete extends KFMod.Machete;

#exec obj load file="DUB_NeonWeapons_T.utx"
/*
var Material MySkin;
var Material MySkinBloody;

simulated function WeaponTick(float dt)
{
        super.WeaponTick(dt);
        if(MySkin == None || MySkinBloody == None){
                InitMaterials();
                //'x' being whatever array your weapon's skin is supposed to be on.
                Skins[0] = MySkin;
                BloodyMaterial = MySkinBloody;
                
        }
}

simulated function InitMaterials()
{
	if(Level.NetMode == NM_DedicatedServer)
		return;

    if(MySkin == None)
        MySkin = Combiner(DynamicLoadObject("DUB_NeonWeapons_T.Machete.Machete_cmb", class'Combiner', true));

    if(MySkinBloody == None)
        MySkinBloody = Combiner(DynamicLoadObject("DUB_NeonWeapons_T.Machete.Machete_bloody_cmb", class'Combiner', true));

    Skins[0] = MySkin;
}
*/
DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.Machete.Machete_shdr'
	BloodyMaterial = Shader'DUB_NeonWeapons_T.Machete.Machete_bloody_shdr'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_MacheteAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_MachetePickup'
	TraderInfoTexture=Texture'DUB_NeonWEapons_T.Trader.Trader_NeonMachete'
	ItemName="Neon Machete";
}
