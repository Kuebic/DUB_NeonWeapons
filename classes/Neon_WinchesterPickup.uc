class Neon_WinchesterPickup extends WinchesterPickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.Winchester.Winchester_3rd_SHDR';
	InventoryType=Class'DUB_NeonWeapons.Neon_Winchester'
	ItemName="Neon Lever Action Rifle"
	ItemShortName="Neon Lever Action"
	PickupMessage="You got the Neon Lever Action Rifle";
}
