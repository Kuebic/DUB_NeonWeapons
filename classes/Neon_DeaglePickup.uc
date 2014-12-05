class Neon_DeaglePickup extends DeaglePickup;

#exec obj load file="DUB_NeonWeapons_T.utx"

function inventory SpawnCopy(pawn Other)
{
	local Inventory I;

	for ( I = Other.Inventory; I != none; I = I.Inventory )
	{
		if( Neon_Deagle (I) != None )
		{
			if( Inventory != none )
				Inventory.Destroy();
			InventoryType = Class'DUB_NeonWeapons.Neon_DualDeagle';
            AmmoAmount[0] += Neon_Deagle(I).AmmoAmount(0);
            MagAmmoRemaining += Neon_Deagle(I).MagAmmoRemaining;
			I.Destroyed();
			I.Destroy();
			Return Super(KFWeaponPickup).SpawnCopy(Other);
		}
	}

	InventoryType = Default.InventoryType;
	Return Super(KFWeaponPickup).SpawnCopy(Other);
}

function bool CheckCanCarry(KFHumanPawn Hm) {
	local Inventory CurInv;
	local bool bHasHandCannon;
	
	for ( CurInv = Hm.Inventory; CurInv != none; CurInv = CurInv.Inventory ) {
		if ( KFWeapon(CurInv) != none && KFWeapon(CurInv).class == class'DUB_NeonWeapons.Neon_DualDeagle' ) {
			bHasHandCannon = true;
		}
	}

	if ( !Hm.CanCarry(Class<KFWeapon>(InventoryType).Default.Weight) && Class<KFWeapon>(InventoryType) != class'DUB_NeonWeapons.Neon_DualDeagle') {
		if ( LastCantCarryTime < Level.TimeSeconds && PlayerController(Hm.Controller) != none ) {
			LastCantCarryTime = Level.TimeSeconds + 0.5;
			PlayerController(Hm.Controller).ReceiveLocalizedMessage(Class'KFMainMessages', 2);
		}
	
		return false;
	}
	
	if ( Class<KFWeapon>(InventoryType) == class'DUB_NeonWeapons.Neon_DualDeagle' ) {
		if ( !bHasHandCannon && !Hm.CanCarry(Class<KFWeapon>(InventoryType).Default.Weight) ) {
			LastCantCarryTime = Level.TimeSeconds + 0.5;
			PlayerController(Hm.Controller).ReceiveLocalizedMessage(Class'KFMainMessages', 2);

			return false;
		}
	}

	return true;
}

DefaultProperties
{
	Skins[0]=Shader'DUB_NeonWeapons_T.Deagle.Deagle_3rd_SHDR';
	InventoryType=Class'DUB_NeonWeapons.Neon_Deagle';
}
