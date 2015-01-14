class Neon_Machete extends KFMod.Machete;

#exec obj load file="DUB_NeonWeapons_T.utx"

static function PreloadAssets(Inventory Inv, optional bool bSkipRefCount)
{
        super(KFWeapon).PreloadAssets(Inv, bSkipRefCount);
 
        default.BloodyMaterial = Shader(DynamicLoadObject(default.BloodyMaterialRef, class'Shader', true));
 
        if ( KFMeleeGun(Inv) != none )
        {
                KFMeleeGun(Inv).BloodyMaterial = default.BloodyMaterial;
        }
}

DefaultProperties
{
	Skins[0] = Shader'DUB_NeonWeapons_T.Machete.Machete_shdr'
	BloodyMaterial = Shader'DUB_NeonWeapons_T.Machete.Machete_bloody_shdr'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_MacheteAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_MachetePickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonMachete'
	ItemName="Neon Machete"
	GroupOffset=2
	Priority=50;
}
