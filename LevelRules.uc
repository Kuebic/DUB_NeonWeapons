class LevelRules extends KFLevelRules;
/*
simulated function bool remove(class<Pickup> pickupClass) 
{
	local int i;
	for(i= 0; i < ItemForSale.Length; i++) 
	{
		if (pickupClass == ItemForSale[i]) 
		{
			ItemForSale.Remove(i, 1);
			return true;
		}
	}
	return false;
}*/
defaultproperties {
	MediItemForSale[0 ]=Class'KFMod.MP7MPickup'            //Medic
	MediItemForSale[1 ]=Class'KFMod.BlowerThrowerPickup'   //Medic
	MediItemForSale[2 ]=Class'KFMod.MP5MPickup'            //Medic
	MediItemForSale[3 ]=Class'KFMod.CamoMP5MPickup'        //Medic
	MediItemForSale[4 ]=Class'KFMod.M7A3MPickup'           //Medic
	MediItemForSale[5 ]=Class'KFMod.KrissMPickup'          //Medic
	MediItemForSale[6 ]=Class'KFMod.NeonKrissMPickup'      //Medic

	SuppItemForSale[0 ]=Class'KFMod.ShotgunPickup'		   	//Support
	SuppItemForSale[1 ]=Class'KFMod.CamoShotgunPickup'     	//Support
	SuppItemForSale[2 ]=Class'KFMod.BoomStickPickup'       	//Support
	SuppItemForSale[3 ]=Class'KFMod.KSGPickup'			  	//Support
	SuppItemForSale[4 ]=Class'KFMod.NeonKSGPickup'		   	//Support
	SuppItemForSale[5 ]=Class'KFMod.NailGunPickup'         	//Support
	SuppItemForSale[6 ]=Class'KFMod.SPShotGunPickup'       	//Support
	SuppItemForSale[7 ]=Class'KFMod.BenelliPickup'	       	//Support
	SuppItemForSale[8 ]=Class'KFMod.GoldenBenelliPickup'   	//Support
	SuppItemForSale[9 ]=Class'KFMod.AA12Pickup'			   	//Support
	SuppItemForSale[10]=Class'KFMod.GoldenAA12Pickup'      	//Support

	//ShrpItemForSale[0 ]=Class'DUB_NeonWeapons.Neon_SinglePickup'	//Sharpshooter
	ShrpItemForSale[0 ]=Class'DUB_NeonWeapons.Neon_DualiesPickup'	//Sharpshooter
	ShrpItemForSale[1 ]=Class'KFMod.WinchesterPickup'	   //Sharpshooter
	ShrpItemForSale[2 ]=Class'KFMod.Magnum44Pickup'		   //Sharpshooter
	ShrpItemForSale[3 ]=Class'DUB_NeonWeapons.Neon_DeaglePickup'	//Sharpshooter
	ShrpItemForSale[4 ]=Class'KFMod.GoldenDeaglePickup'    //Sharpshooter
	ShrpItemForSale[5 ]=Class'KFMod.MK23Pickup'			   //Sharpshooter
	ShrpItemForSale[6 ]=Class'KFMod.CrossbowPickup'		   //Sharpshooter
	ShrpItemForSale[7 ]=Class'KFMod.Dual44MagnumPickup'	   //Sharpshooter
	ShrpItemForSale[8 ]=Class'KFMod.DualMK23Pickup'	       //Sharpshooter
	ShrpItemForSale[9 ]=Class'DUB_NeonWeapons.Neon_DualDeaglePickup' //Sharpshooter
	ShrpItemForSale[10]=Class'KFMod.GoldenDualDeaglePickup'//Sharpshooter
	ShrpItemForSale[11]=Class'KFMod.SPSniperPickup'        //SharpShooter
	ShrpItemForSale[12]=Class'KFMod.M14EBRPickup'		   //Sharpshooter
	ShrpItemForSale[13]=Class'KFMod.M99Pickup'			   //Sharpshooter

	CommItemForSale[0 ]=Class'DUB_NeonWeapons.Neon_BullpupPickup'//Commando
	CommItemForSale[1 ]=Class'KFMod.ThompsonPickup'	            //Commando
	CommItemForSale[2 ]=Class'KFMod.SPThompsonPickup'	        //Commando
	CommItemForSale[3 ]=Class'KFMod.ThompsonDrumPickup'         //Commando
	CommItemForSale[4 ]=Class'KFMod.AK47Pickup'			        //Commando
	CommItemForSale[5 ]=Class'KFMod.GoldenAK47Pickup'			//Commando
	CommItemForSale[6 ]=Class'KFMod.NeonAK47Pickup'			    //Commando
	CommItemForSale[7 ]=Class'KFMod.M4Pickup'			        //Commando
	CommItemForSale[8 ]=Class'KFMod.CamoM4Pickup'			    //Commando
	CommItemForSale[9 ]=Class'KFMod.MKb42Pickup'		        //Commando
	CommItemForSale[10]=Class'KFMod.SCARMK17Pickup'		        //Commando
	CommItemForSale[11]=Class'KFMod.NeonSCARMK17Pickup'		    //Commando
	CommItemForSale[12]=Class'KFMod.FNFAL_ACOG_Pickup'	        //Commando

	BersItemForSale[0 ]=Class'KFMod.KnifePickup'				//Berserker
	BersItemForSale[1 ]=Class'KFMod.MachetePickup'				//Berserker
	BersItemForSale[2 ]=Class'KFMod.AxePickup'					//Berserker
	BersItemForSale[3 ]=Class'KFMod.KatanaPickup'				//Berserker
	BersItemForSale[4 ]=Class'KFMod.GoldenKatanaPickup'		    //Berserker
	BersItemForSale[5 ]=Class'KFMod.ScythePickup'               //Berserker
	BersItemForSale[6 ]=Class'KFMod.ChainsawPickup'				//Berserker
	BersItemForSale[7 ]=Class'KFMod.GoldenChainsawPickup'		//Berserker
	BersItemForSale[8 ]=Class'KFMod.DwarfAxePickup'             //Berserker
	BersItemForSale[9 ]=Class'KFMod.ClaymoreSwordPickup'		//Berserker
	BersItemForSale[10]=Class'KFMod.CrossbuzzsawPickup'			//Berserker

	FireItemForSale[0 ]=Class'DUB_NeonWeapons.Neon_MAC10Pickup' //Firebug
    FireItemForSale[1 ]=Class'KFMod.FlareRevolverPickup'		//Firebug
	FireItemForSale[2 ]=Class'KFMod.FlameThrowerPickup'			//Firebug
	FireItemForSale[3 ]=Class'KFMod.GoldenFTPickup'			    //Firebug
	FireItemForSale[4 ]=Class'KFMod.DualFlareRevolverPickup'    //Firebug
   	FireItemForSale[5 ]=Class'KFMod.TrenchgunPickup'			//Firebug
   	FireItemForSale[6 ]=Class'KFMod.HuskGunPickup'				//Firebug

   	DemoItemForSale[0 ]=Class'KFMod.M79Pickup'					//Demolition
   	DemoItemForSale[1 ]=Class'KFMod.GoldenM79Pickup'		    //Demolition
	DemoItemForSale[2 ]=Class'KFMod.SPGrenadePickup'            //Demolition
	DemoItemForSale[3 ]=Class'KFMod.PipeBombPickup'				//Demolition
	DemoItemForSale[4 ]=Class'KFMod.SealSquealPickup'	        //Demolition
	DemoItemForSale[5 ]=Class'KFMod.SeekerSixPickup'	        //Demolition
	DemoItemForSale[6 ]=Class'KFMod.M4203Pickup'				//Demolition
	DemoItemForSale[7 ]=Class'KFMod.LAWPickup'					//Demolition
    DemoItemForSale[8 ]=Class'KFMod.M32Pickup'					//Demolition
	DemoItemForSale[9 ]=Class'KFMod.CamoM32Pickup'				//Demolition

	NeutItemForSale[0 ]=Class'KFMod.ZEDMKIIPickup'				//No Perk
    NeutItemForSale[1 ]=Class'KFMod.ZEDGunPickup'				//No Perk
	NeutItemForSale[2 ]=Class'KFMod.Potato'         			//No Perk
}
