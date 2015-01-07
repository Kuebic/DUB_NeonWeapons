class Neon_KnifePickup extends KnifePickup;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeaponsV1_0_T.Knife.Knife_3rd_shdr';
	InventoryType=Class'DUB_NeonWeaponsV1_0.Neon_Knife'
	ItemName="Neon Knife"
	ItemShortName="Neon Knife"
	PickupMessage="You got the Neon Knife";
}