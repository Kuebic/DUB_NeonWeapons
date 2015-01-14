class Neon_Knife extends Knife;

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
	Skins[0] = Shader'DUB_NeonWeapons_T.Knife.Knife_shdr'
	BloodyMaterial = Shader'DUB_NeonWeapons_T.Knife.Knife_bloody_shdr'
	AttachmentClass=Class'DUB_NeonWeapons.Neon_KnifeAttachment'
	PickupClass=Class'DUB_NeonWeapons.Neon_KnifePickup'
	TraderInfoTexture=Texture'DUB_NeonWeapons_T.Trader.Trader_NeonKnife'
	ItemName="Neon Knife"
	GroupOffset=1
	Priority=45;
}
