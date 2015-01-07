class Neon_M79Pickup extends M79Pickup;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeaponsV1_0_T.M79GL.M79_3rd_shdr';
	InventoryType=Class'DUB_NeonWeaponsV1_0.Neon_M79GL'
	ItemName="Neon M79 Gernade Launcher"
	ItemShortName="Neon M79"
	PickupMessage="You got the Neon M79";
}