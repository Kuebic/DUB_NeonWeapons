//----------------------
//Neon Weapons Version 2.0 by Kenei Menning (Kuebic), following outline from Jean-David Veilleux-Foppiano (Skell*)
//Original models and textures by Tripwire Interactive and IJC development teams.
//Special thanks to Scary_ghost, Skell*, and a1eat0r!
//I've learned so much from the previously mentioned.  This pack wouldn't be remotely possible without them.
//Adds Neon weapon reskins to the trader buy menu.
//----------------------

class MutDUB_NeonWeaponReplacer extends Mutator;

//This mutator does a few things:
//	-Replaces perks with neon-compatible ones
//	-Locates the game's Level Rules then modifies it (rather than replacing it like previous versions)
//	-hack-fix trader returning default 9mm/handcannon when selling neon dual versions
//	-replaces random spawns

struct ReplacementPair 
{
	var class<Object> oldClass;
	var class<Object> newClass;
};
var array<ReplacementPair> pickupReplacements;
var Array< Class<KFVeterancyTypes> > Vet_Array;
var array<string> NeonWepList, DefaultWepList, CleanNameList;
var int CountTimer;

simulated function PostBeginPlay()
{
	local KFGameType GT;
	Super.PostBeginPlay();
	
	GT = KFGameType(Level.Game);
	if (GT != None) {
		if (!ClassIsChildOf(GT.PlayerControllerClass, class'NeonPlayerController')) {
			GT.PlayerControllerClass = class'NeonPlayerController';
			GT.PlayerControllerClassName = string(class'NeonPlayerController');
		}
	}
	
	SetTimer(0.1,false);
}

static function Class<KFVeterancyTypes> GetVetReplacement(Class<KFVeterancyTypes> VetSkill)
{
	local byte i;
	
	for (i = 0; i < default.Vet_Array.length; i++) {
		if (ClassIsChildOf(default.Vet_Array[i], VetSkill)) {
			return default.Vet_Array[i];
		}
	}
	
	return VetSkill;
}

simulated function Timer() 
{ 
	local KFLevelRules KFLR; 

	if ( (CountTimer>30) && (Level.NetMode != NM_Client) ){
		CreateLevelRules();
	}
	else{
		CountTimer++;
	}

	foreach DynamicActors(class'KFLevelRules', KFLR) 
	break;
	
	if (KFLR == none) 
	{
		SetTimer(1.0, false);
		return; 
	} 

	AddWeaponsToTrader(KFLR);
}

function CreateLevelRules() 
{
	local KFGameType KFGT;

	KFGT = KFGameType(Level.Game);

	if(KFGT != None)
	{
		if(KFGT.KFLRules == None)
		{
			KFGT.KFLRules = spawn(class'KFLevelRules');
		}
	}
}

//Redone to fetch proper indexes and replace neon weapons over their default counterparts.
simulated function AddWeaponsToTrader(KFLevelRules KFLR) 	
{
	local int Index, NewIndex;
	local class<KFWeaponPickup> WeaponPickupClass, WeaponCounterpartPickupClass;
	local string AddedWeapon, AppropriatePerk;
	local byte PByte;

	Log("Preparing to add weapons ...",Class.Outer.Name);

	for( Index=0; Index<NeonWepList.Length; ++Index ) 
	{
		if ((NeonWepList[Index]!="null") && (DefaultWepList[Index]!="null")) 
		{
			WeaponPickupClass = class<KFWeaponPickup>(DynamicLoadObject(NeonWepList[Index], class'Class', true));
			WeaponCounterpartPickupClass = class<KFWeaponPickup>(DynamicLoadObject(DefaultWepList[Index], class'Class', true));
			if ((WeaponPickupClass!=none) && (WeaponCounterpartPickupClass!=none))
			{
				PByte = WeaponPickupClass.default.CorrespondingPerkIndex;
				if(PByte == 1){
					NewIndex = FindProperIndex(KFLR.SuppItemForSale, WeaponPickupClass, WeaponCounterpartPickupClass);
					KFLR.SuppItemForSale.Remove(NewIndex, 1);
					KFLR.SuppItemForSale.Insert(NewIndex, 1);
					KFLR.SuppItemForSale[NewIndex] = WeaponPickupClass;
					AppropriatePerk = "Support Specialist";
				}
				else if(PByte == 2){
					NewIndex = FindProperIndex(KFLR.ShrpItemForSale, WeaponPickupClass, WeaponCounterpartPickupClass);
					KFLR.ShrpItemForSale.Remove(NewIndex, 1);
					KFLR.ShrpItemForSale.Insert(NewIndex, 1);
					KFLR.ShrpItemForSale[NewIndex] = WeaponPickupClass;
					AppropriatePerk = "Sharpshooter";
				}
				else if(PByte == 3){
					NewIndex = FindProperIndex(KFLR.CommItemForSale, WeaponPickupClass, WeaponCounterpartPickupClass);
					KFLR.CommItemForSale.Remove(NewIndex, 1);
					KFLR.CommItemForSale.Insert(NewIndex, 1);
					KFLR.CommItemForSale[NewIndex] = WeaponPickupClass;
					AppropriatePerk = "Commando";
				}
				else if(PByte == 4){
					NewIndex = FindProperIndex(KFLR.BersItemForSale, WeaponPickupClass, WeaponCounterpartPickupClass);
					KFLR.BersItemForSale.Remove(NewIndex, 1);
					KFLR.BersItemForSale.Insert(NewIndex, 1);
					KFLR.BersItemForSale[NewIndex] = WeaponPickupClass;
					AppropriatePerk = "Berserker";
				}
				else if(PByte == 5){
					NewIndex = FindProperIndex(KFLR.FireItemForSale, WeaponPickupClass, WeaponCounterpartPickupClass);
					KFLR.FireItemForSale.Remove(NewIndex, 1);
					KFLR.FireItemForSale.Insert(NewIndex, 1);
					KFLR.FireItemForSale[NewIndex] = WeaponPickupClass;
					AppropriatePerk = "Firebug";
				}
				else if(PByte == 6){
					NewIndex = FindProperIndex(KFLR.DemoItemForSale, WeaponPickupClass, WeaponCounterpartPickupClass);
					KFLR.DemoItemForSale.Remove(NewIndex, 1);
					KFLR.DemoItemForSale.Insert(NewIndex, 1);
					KFLR.DemoItemForSale[NewIndex] = WeaponPickupClass;
					AppropriatePerk = "Demolitions";
				}
				//Gives a cleaner weapon name for the log to print out.
				AddedWeapon = CleanNameList[Index];
				Log("The "$AddedWeapon$" was added to the trader under the "$AppropriatePerk$" weapon tab at slot #"$NewIndex$"!",Class.Outer.Name);
			}
		}
	}
	Log("... finished adding weapons to the trader menu!",Class.Outer.Name);
}

//Helper function to fetch the proper index of the trader list.
static function int FindProperIndex(array< class<Pickup> > ShopWeaponList, class<Pickup> NewWeaponPickup, class<Pickup> CounterpartWeaponPickup)
{
	local int NewIndex, ReturnIndex;
	for (NewIndex = 0; NewIndex < ShopWeaponList.Length; ++NewIndex)
	{
		if(ShopWeaponList[NewIndex] == CounterpartWeaponPickup)
		{
			ReturnIndex = NewIndex;
			return ReturnIndex;
		}
	}
	return (ShopWeaponList.Length + 1);
}

simulated function bool CheckReplacement(Actor Other, out byte bSuperRelevant) 
{
	local int i;
	local KFHumanPawn KFHP;
	local KFWeapon NineMMReplacement;
	local KFWeapon DeagleReplacement;
	
	//Change Loading equipment
	if(KFHumanPawn(Other)!=None)
	{
		KFHumanPawn(Other).RequiredEquipment[0] = "DUB_NeonWeapons.Neon_Knife";
		KFHumanPawn(Other).RequiredEquipment[1] = "DUB_NeonWeapons.Neon_Single";
		KFHumanPawn(Other).RequiredEquipment[2] = "KFMod.Frag";
		KFHumanPawn(Other).RequiredEquipment[3] = "KFMod.Syringe";
		KFHumanPawn(Other).RequiredEquipment[4] = "KFMod.Welder";
	}
	
	//hack fix for the dualies-returning-normal-9mm trader issue...
    if ( Other.Class==Class'Single' )
    {
        KFHP = KFHumanPawn(Single(Other).Instigator);
        if (KFHP != None)
        {
            Other.Destroy();
            NineMMReplacement = Spawn(class'Neon_Single');
            NineMMReplacement.GiveTo(KFHP);
            return false;
        }
    }
	//hack fix for the dualdeagle-returning-normal-handcannon trader issue...
	if ( Other.Class==Class'Deagle' )
    {
        KFHP = KFHumanPawn(Deagle(Other).Instigator);
        if (KFHP != None)
        {
            Other.Destroy();
            DeagleReplacement = Spawn(class'Neon_Deagle');
            DeagleReplacement.GiveTo(KFHP);
            return false;
        }
    }
	
	//Change random weapon spawns
	if(Other.IsA('KFRandomItemSpawn') && !Other.IsA('Neon_RandomItemSpawn'))
	{
		ReplaceWith(Other, "DUB_NeonWeapons.Neon_RandomItemSpawn");
		Return false;
	}

	//replace weapons I want to replace
	if (KFWeaponPickup(Other) != none || KFAmmoPickup(Other) != none) 
	{
		i = shouldReplace(String(Other.class), pickupReplacements);
		if (i != -1) 
		{
			ReplaceWith(Other,String(pickupReplacements[i].newClass));
			return false;
		}
	}
	
	else if (KFWeapon(Other) != none)
	{
		i = shouldReplace(String(KFWeapon(Other).PickupClass.class), pickupReplacements);
		if (i != -1) 
		{
			ReplaceWith(Other,String(class<Pickup>(pickupReplacements[i].newClass).default.InventoryType));
			return false;
		}
	}

	return super.CheckReplacement(Other, bSuperRelevant);
}

simulated function int shouldReplace(string objectName, array<ReplacementPair> replacementArray) 
{
	local int i, replaceIndex;
	
	replaceIndex= -1;
	for(i=0; replaceIndex == -1 && i < replacementArray.length; i++) 
	{
		if (objectName ~= String(replacementArray[i].oldClass))
		{
			replaceIndex= i;
		}
	}
	return replaceIndex;
}

defaultproperties
{
	bAddToServerPackages=True
	bNetDirty=True
	bAlwaysRelevant=True
	RemoteRole=ROLE_SimulatedProxy

	counttimer=0

	FriendlyName="DUB_NeonWeaponReplacer V1.6"
	Description="This mutator adds the Neon weapon to the trader a better way "
	GroupName="KF-DUB_Neon_Weapons_Better_Trader"
	//thisPackageName="???"
	
	Vet_Array(0)=Class'DUB_NeonWeapons.NeonVetSupportSpec'
    Vet_Array(1)=Class'DUB_NeonWeapons.NeonVetSharpshooter'
    Vet_Array(2)=Class'DUB_NeonWeapons.NeonVetCommando'
    Vet_Array(3)=Class'DUB_NeonWeapons.NeonVetBerserker'
    Vet_Array(4)=Class'DUB_NeonWeapons.NeonVetFirebug'
    Vet_Array(5)=Class'DUB_NeonWeapons.NeonVetDemolitions'

	//Arrays Replaces Trader items (used string)
	NeonWepList[0] = "DUB_NeonWeapons.Neon_SinglePickup"
	DefaultWepList[0] = "KFMod.SinglePickup"
	CleanNameList [0] = "Neon 9mm"
	NeonWepList[1] = "DUB_NeonWeapons.Neon_DualiesPickup"
	DefaultWepList[1] = "KFMod.DualiesPickup"
	CleanNameList [1] = "Neon Dual 9mm"
	NeonWepList[2] = "DUB_NeonWeapons.Neon_DeaglePickup"
	DefaultWepList[2] = "KFMod.DeaglePickup"
	CleanNameList [2] = "Neon Handcannon"
	NeonWepList[3] = "DUB_NeonWeapons.Neon_DualDeaglePickup"
	DefaultWepList[3] = "KFMod.DualDeaglePickup"
	CleanNameList [3] = "Neon Dual Handcannon"
	NeonWepList[4] = "DUB_NeonWeapons.Neon_WinchesterPickup"
	DefaultWepList[4] = "KFMod.WinchesterPickup"
	CleanNameList [4] = "Neon LAR"
	NeonWepList[5] = "DUB_NeonWeapons.Neon_CrossbowPickup"
	DefaultWepList[5] = "KFMod.CrossbowPickup"
	CleanNameList [5] = "Neon Xbow"
	NeonWepList[6] = "DUB_NeonWeapons.Neon_M14Pickup"
	DefaultWepList[6] = "KFMod.M14EBRPickup"
	CleanNameList [6] = "Neon M14EBR"
	NeonWepList[7] = "DUB_NeonWeapons.Neon_Mac10Pickup"
	DefaultWepList[7] = "KFMod.Mac10Pickup"
	CleanNameList [7] = "Neon Mac10"
	NeonWepList[8] = "DUB_NeonWeapons.Neon_KnifePickup"
	DefaultWepList[8] = "KFMod.KnifePickup"
	CleanNameList [8] = "Neon Knife"
	NeonWepList[9] = "DUB_NeonWeapons.Neon_MachetePickup"
	DefaultWepList[9] = "KFMod.MachetePickup"
	CleanNameList [9] = "Neon Machete"
	NeonWepList[10] = "DUB_NeonWeapons.Neon_AxePickup"
	DefaultWepList[10] = "KFMod.AxePickup"
	CleanNameList [10] = "Neon Axe"
	NeonWepList[11] = "DUB_NeonWeapons.Neon_KatanaPickup"
	DefaultWepList[11] = "KFMod.KatanaPickup"
	CleanNameList [11] = "Neon Katana"
	NeonWepList[12] = "DUB_NeonWeapons.Neon_ShotgunPickup"
	DefaultWepList[12] = "KFMod.ShotgunPickup"
	CleanNameList [12] = "Neon Shotgun"
	NeonWepList[13] = "DUB_NeonWeapons.Neon_BoomStickPickup"
	DefaultWepList[13] = "KFMod.BoomStickPickup"
	CleanNameList [13] = "Neon Hunting Shotgun"
	NeonWepList[14] = "DUB_NeonWeapons.Neon_AA12Pickup"
	DefaultWepList[14] = "KFMod.AA12Pickup"
	CleanNameList [14] = "Neon AA12"
	NeonWepList[15] = "DUB_NeonWeapons.Neon_BullpupPickup"
	DefaultWepList[15] = "KFMod.BullpupPickup"
	CleanNameList [15] = "Neon Dual Bullpup"
	NeonWepList[16] = "DUB_NeonWeapons.Neon_AK47Pickup"
	DefaultWepList[16] = "KFMod.AK47Pickup"
	CleanNameList [16] = "Neon AK47"
	NeonWepList[17] = "DUB_NeonWeapons.Neon_M79Pickup"
	DefaultWepList[17] = "KFMod.M79Pickup"
	CleanNameList [17] = "Neon M79"
	
	//Used to replace random pickups (used class)
	pickupReplacements(0)=(oldClass=class'KFMod.SinglePickup',newClass=class'DUB_NeonWeapons.Neon_SinglePickup')
	pickupReplacements(1)=(oldClass=class'KFMod.DualiesPickup',newClass=class'DUB_NeonWeapons.Neon_DualiesPickup')
	pickupReplacements(2)=(oldClass=class'KFMod.DeaglePickup',newClass=class'DUB_NeonWeapons.Neon_DeaglePickup')
	pickupReplacements(3)=(oldClass=class'KFMod.DualDeaglePickup',newClass=class'DUB_NeonWeapons.Neon_DualDeaglePickup')
	pickupReplacements(4)=(oldClass=class'KFMod.BullpupPickup',newClass=class'DUB_NeonWeapons.Neon_BullpupPickup')
	pickupReplacements(5)=(oldClass=class'KFMod.Mac10Pickup',newClass=class'DUB_NeonWeapons.Neon_Mac10Pickup')
	pickupReplacements(6)=(oldClass=class'KFMod.KnifePickup',newClass=class'DUB_NeonWeapons.Neon_KnifePickup')
	pickupReplacements(7)=(oldClass=class'KFMod.MachetePickup',newClass=class'DUB_NeonWeapons.Neon_MachetePickup')
	pickupReplacements(8)=(oldClass=class'KFMod.AxePickup',newClass=class'DUB_NeonWeapons.Neon_AxePickup')
	pickupReplacements(9)=(oldClass=class'KFMod.KatanaPickup',newClass=class'DUB_NeonWeapons.Neon_KatanaPickup')
	pickupReplacements(10)=(oldClass=class'KFMod.AA12Pickup',newClass=class'DUB_NeonWeapons.Neon_AA12Pickup')
	pickupReplacements(11)=(oldClass=class'KFMod.BoomStickPickup',newClass=class'DUB_NeonWeapons.Neon_BoomstickPickup')
	pickupReplacements(12)=(oldClass=class'KFMod.ShotgunPickup',newClass=class'DUB_NeonWeapons.Neon_ShotgunPickup')
	pickupReplacements(13)=(oldClass=class'KFMod.WinchesterPickup',newClass=class'DUB_NeonWeapons.Neon_WinchesterPickup')
	pickupReplacements(14)=(oldClass=class'KFMod.CrossbowPickup',newClass=class'DUB_NeonWeapons.Neon_CrossbowPickup')
	pickupReplacements(15)=(oldClass=class'KFMod.AK47Pickup',newClass=class'DUB_NeonWeapons.Neon_AK47Pickup')
	pickupReplacements(16)=(oldClass=class'KFMod.M14EBRPickup',newClass=class'DUB_NeonWeapons.Neon_M14Pickup')
	pickupReplacements(17)=(oldClass=class'KFMod.M79Pickup',newClass=class'DUB_NeonWeapons.Neon_M79Pickup')
}
