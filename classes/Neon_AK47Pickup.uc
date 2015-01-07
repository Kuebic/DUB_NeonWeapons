class Neon_AK47Pickup extends AK47Pickup;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeaponsV1_0_T.AK.AK47_3rd_shdr';
	InventoryType=Class'DUB_NeonWeaponsV1_0.Neon_AK47AR'
	ItemName="Neon AK47"
	ItemShortName="Neon AK47"
	PickupMessage="You got the Neon AK47";
}