class Neon_M14Pickup extends M14EBRPickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.M14AR.M14_3rd_shdr';
	InventoryType=Class'DUB_NeonWeapons.Neon_M14EBR'
	ItemName="Neon M14EBR"
	ItemShortName="Neon M14EBR"
	PickupMessage="You got the Neon M14EBR";
}