class Neon_WinchesterPickup extends WinchesterPickup;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeaponsV1_0_T.Winchester.Winchester_3rd_SHDR';
	InventoryType=Class'DUB_NeonWeaponsV1_0.Neon_Winchester'
	ItemName="Neon Lever Action Rifle"
	ItemShortName="Neon Lever Action"
	PickupMessage="You got the Neon Lever Action Rifle";
}
