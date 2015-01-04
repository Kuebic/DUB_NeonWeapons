class Neon_AK47Pickup extends AK47Pickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.AK.AK47_3rd_shdr';
	InventoryType=Class'DUB_NeonWeapons.Neon_AK47AR'
	ItemName="Neon AK47"
	ItemShortName="Neon AK47"
	PickupMessage="You got the Neon AK47";
}