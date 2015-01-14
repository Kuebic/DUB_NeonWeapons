class Neon_Katana extends Katana;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

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
	SkinRefs[0] = "DUB_NeonWeaponsV1_0_T.Katana.Katana_shdr"
	BloodyMaterialRef = "DUB_NeonWeaponsV1_0_T.Katana.katana_bloody_shdr"
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_KatanaAttachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_KatanaPickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonKatana'
	ItemName="Neon Katana";
}
