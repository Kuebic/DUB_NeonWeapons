class Neon_SinglePickup extends SinglePickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.pistol.Ninemm_3rd_SHDR';
	InventoryType=Class'DUB_NeonWeapons.Neon_Single'
	ItemName="Neon 9mm Pistol"
	ItemShortName="Neon 9mm"
	PickupMessage="You got the Neon 9mm Pistol";
}
