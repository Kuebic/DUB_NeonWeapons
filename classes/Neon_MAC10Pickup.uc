class Neon_MAC10Pickup extends MAC10Pickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.MAC10.MAC10_3rd_SHDR';
	InventoryType=Class'DUB_NeonWeapons.Neon_MAC10MP'
	ItemName="Neon MAC10"
	ItemShortName="Neon MAC10"
	PickupMessage="You got the Neon MAC10";
}
