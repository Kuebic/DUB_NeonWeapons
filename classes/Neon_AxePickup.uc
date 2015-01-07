class Neon_AxePickup extends AxePickup;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeaponsV1_0_T.Axe.Axe_3rd_shdr';
	InventoryType=Class'DUB_NeonWeaponsV1_0.Neon_Axe'
	ItemName="Neon Axe"
	ItemShortName="Neon Axe"
	PickupMessage="You got the Neon Axe";
}