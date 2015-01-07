class Neon_CrossbowPickup extends CrossbowPickup;

#exec obj load file="DUB_NeonWeaponsV1_0_T.utx"

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeaponsV1_0_T.Xbow.Crossbow_3rd_shdr';
	InventoryType=Class'DUB_NeonWeaponsV1_0.Neon_Crossbow'
	ItemName="Neon Crossbow"
	ItemShortName="Neon Crossbow"
	PickupMessage="You got the Neon Crossbow";
}