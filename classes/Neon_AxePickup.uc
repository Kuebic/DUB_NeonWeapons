class Neon_AxePickup extends AxePickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.Axe.Axe_3rd_shdr';
	InventoryType=Class'DUB_NeonWeapons.Neon_Axe'
	ItemName="Neon Axe"
	ItemShortName="Neon Axe"
	PickupMessage="You got the Neon Axe";
}