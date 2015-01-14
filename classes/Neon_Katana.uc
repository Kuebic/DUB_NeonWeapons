class Neon_Katana extends Katana;

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
	SkinRefs[0] = "DUB_NeonWeapons_T.Katana.Katana_shdr"
	BloodyMaterialRef = "DUB_NeonWeapons_T.Katana.katana_bloody_shdr"
	AttachmentClass=Class'DUB_NeonWeapons.Neon_KatanaAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_KatanaPickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonKatana'
	ItemName="Neon Katana";
}
