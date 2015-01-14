class Neon_KatanaPickup extends KatanaPickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.Katana.Katana_3rd_shdr';
	InventoryType=Class'DUB_NeonWeapons.Neon_Katana'
	ItemName="Neon Katana"
	ItemShortName="Neon Katana"
	PickupMessage="You got the Neon Katana";
}