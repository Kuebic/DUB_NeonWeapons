class Neon_KatanaPickup extends KatanaPickup;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeaponsV1_0_T.Katana.Katana_3rd_shdr';
	InventoryType=Class'DUB_NeonWeaponsV1_0.Neon_Katana'
	ItemName="Neon Katana"
	ItemShortName="Neon Katana"
	PickupMessage="You got the Neon Katana";
}