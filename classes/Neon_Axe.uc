class Neon_Axe extends Axe;

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
	Skins[0] = Shader'DUB_NeonWeaponsV1_0_T.Axe.Axe_shdr'
	BloodyMaterial = Shader'DUB_NeonWeaponsV1_0_T.Axe.Axe_bloody_shdr'
	AttachmentClass=Class'DUB_NeonWeaponsV1_0.Neon_AxeAttachment'
	PickupClass=Class'DUB_NeonWeaponsV1_0.Neon_AxePickup'
	TraderInfoTexture=Texture'DUB_NeonWeaponsV1_0_T.Trader.Trader_NeonAxe'
	ItemName="Neon Axe";
}
