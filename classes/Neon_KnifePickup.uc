class Neon_KnifePickup extends KnifePickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.Knife.Knife_3rd_shdr';
	InventoryType=Class'DUB_NeonWeapons.Neon_Knife'
	ItemName="Neon Knife"
	ItemShortName="Neon Knife"
	PickupMessage="You got the Neon Knife";
}