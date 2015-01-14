class Neon_DualDeaglePickup extends DualDeaglePickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.Deagle.Deagle_3rd_SHDR';
	InventoryType=Class'DUB_NeonWeapons.Neon_DualDeagle'
	ItemName="Neon Dual Handcannons"
	ItemShortName="Neon Dual HC"
	PickupMessage="You got the Neon Dual Handcannons"
	
	VariantClasses[0]=class'KFMod.GoldenDualDeaglePickup'
	VariantClasses[1]=class'KFMod.DualDeaglePickup';
}
