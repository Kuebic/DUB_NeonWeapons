class Neon_MachetePickup extends MachetePickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.Machete.Machete_3rd_shdr';
	InventoryType=Class'DUB_NeonWeapons.Neon_Machete'
	ItemName="Neon Machete"
	ItemShortName="Neon Machete"
	PickupMessage="You got the Neon Machete";
}