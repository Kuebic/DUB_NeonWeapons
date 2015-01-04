class Neon_CrossbowPickup extends CrossbowPickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.Xbow.Crossbow_3rd_shdr';
	InventoryType=Class'DUB_NeonWeapons.Neon_Crossbow'
	ItemName="Neon Crossbow"
	ItemShortName="Neon Crossbow"
	PickupMessage="You got the Neon Crossbow";
}