class Neon_DualDeaglePickup extends DualDeaglePickup;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeaponsV1_0_T.Deagle.Deagle_3rd_SHDR';
	InventoryType=Class'DUB_NeonWeaponsV1_0.Neon_DualDeagle'
	ItemName="Neon Dual Handcannons"
	ItemShortName="Neon Dual Handcannons"
	PickupMessage="You got the Neon Dual Handcannons"
	
	VariantClasses[0]=class'KFMod.GoldenDualDeaglePickup';
}
