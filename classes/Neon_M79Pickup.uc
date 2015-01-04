class Neon_M79Pickup extends M79Pickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.M79GL.M79_3rd_shdr';
	InventoryType=Class'DUB_NeonWeapons.Neon_M79GL'
	ItemName="Neon M79 Gernade Launcher"
	ItemShortName="Neon M79"
	PickupMessage="You got the Neon M79";
}