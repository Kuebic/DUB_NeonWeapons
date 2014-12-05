class MutDUB_NeonWeaponReplacer extends Mutator;

struct ReplacementPair 
{
	var class<Object> oldClass;
	var class<Object> newClass;
};
var array<ReplacementPair> pickupReplacements;
var Array< Class<KFVeterancyTypes> > Vet_Array;
var class<LevelRules> levelRules;
var KFGameType gameType;


simulated function Tick(float DeltaTime) 
{
	local int i;
	local KFLevelRules KFLR;
	local PlayerController localController;
	
	localController= Level.GetLocalPlayerController();
	if (localController != none) {
		foreach DynamicActors(class'KFMod.KFLevelRules', KFLR)
		for (i = 0; i < KFLR.ShrpItemForSale.length; i++){
			if (KFLR.ShrpItemForSale[i] == class'KFMod.DualiesPickup')
				KFLR.ShrpItemForSale[i] = class'Dub_NeonWeapons.Neon_DualiesPickup';
			if (KFLR.ShrpItemForSale[i] == class'KFMod.DeaglePickup')
				KFLR.ShrpItemForSale[i] = class'Dub_NeonWeapons.Neon_DeaglePickup';
			if (KFLR.ShrpItemForSale[i] == class'KFMod.DualDeaglePickup')
				KFLR.ShrpItemForSale[i] = class'Dub_NeonWeapons.Neon_DualDeaglePickup';
			if (KFLR.ShrpItemForSale[i] == class'KFMod.WinchesterPickup')
				KFLR.ShrpItemForSale[i] = Class'DUB_NeonWeapons.Neon_WinchesterPickup';
		}
		for (i = 0; i < KFLR.CommItemForSale.length; i++){
			if (KFLR.CommItemForSale[i] == class'KFMod.BullpupPickup')
				KFLR.CommItemForSale[i] = class'Dub_NeonWeapons.Neon_BullpupPickup';
		}
		for (i = 0; i < KFLR.FireItemForSale.length; i++){
			if (KFLR.FireItemForSale[i] == class'KFMod.MAC10Pickup')
				KFLR.FireItemForSale[i] = class'Dub_NeonWeapons.Neon_MAC10Pickup';
		}
		for (i = 0; i < KFLR.BersItemForSale.length; i++){
			if (KFLR.BersItemForSale[i] == class'KFMod.KnifePickup')
				KFLR.BersItemForSale[i] = class'Dub_NeonWeapons.Neon_KnifePickup';
			if (KFLR.BersItemForSale[i] == class'KFMod.MachetePickup')
				KFLR.BersItemForSale[i] = class'Dub_NeonWeapons.Neon_MachetePickup';
			if (KFLR.BersItemForSale[i] == class'KFMod.AxePickup')
				KFLR.BersItemForSale[i] = class'Dub_NeonWeapons.Neon_AxePickup';
			if (KFLR.BersItemForSale[i] == class'KFMod.KatanaPickup')
				KFLR.BersItemForSale[i] = class'Dub_NeonWeapons.Neon_KatanaPickup';
		}
		for (i = 0; i < KFLR.SuppItemForSale.length; i++){
			if (KFLR.SuppItemForSale[i] == class'KFMod.ShotgunPickup')
				KFLR.SuppItemForSale[i] = class'Dub_NeonWeapons.Neon_ShotgunPickup';
			if (KFLR.SuppItemForSale[i] == class'KFMod.BoomStickPickup')
				KFLR.SuppItemForSale[i] = class'Dub_NeonWeapons.Neon_BoomStickPickup';
			if (KFLR.SuppItemForSale[i] == class'KFMod.AA12Pickup')
				KFLR.SuppItemForSale[i] = class'Dub_NeonWeapons.Neon_AA12Pickup';
		}
		
	}
	Disable('Tick');
}

simulated function PostBeginPlay() 
{
	Super.PostBeginPlay();
	
	gameType= KFGameType(Level.Game);
	if (gameType == none) 
	{
		Destroy();
		return;
	}
	if (Level.NetMode != NM_Standalone)
		AddToPackageMap("Dub_NeonWeapons");
		
	//My attempt at modifying perk bonuses... maybe later
	if (gameType != None)
	{
		if (!ClassIsChildOf(gameType.PlayerControllerClass, class'NeonPlayerController'))
		{
			gameType.PlayerControllerClass = class'NeonPlayerController';
			gameType.PlayerControllerClassName = string(class'NeonPlayerController');
		}
	}
	
	SetTimer(1.0, false);
}
//My attempt at modifying perk bonuses... maybe later... thanks Skell
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

function Timer() 
{
	gameType.KFLRules.destroy();
	gameType.KFLRules= spawn(levelRules);
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
	
	//Change random weapon spawns
	if(Other.IsA('KFRandomItemSpawn') && !Other.IsA('Neon_RandomItemSpawn'))
	{
		ReplaceWith(Other, "DUB_NeonWeapons.Neon_RandomItemSpawn");
		Return false;
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
    GroupName="KF-DUBNeonWeapons"
    FriendlyName="DUB Neon Weapon Replacer"
    Description="Replaces many weapon skins with neon equivalence."
	
	bAlwaysRelevant=True
    bAddToServerPackages=True
	RemoteRole=ROLE_SimulatedProxy
	
	levelRules=class'LevelRules';
	
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

    Vet_Array(0)=Class'DUB_NeonWeapons.NeonVetSupportSpec'
    Vet_Array(1)=Class'DUB_NeonWeapons.NeonVetSharpshooter'
    Vet_Array(2)=Class'DUB_NeonWeapons.NeonVetCommando'
    Vet_Array(3)=Class'DUB_NeonWeapons.NeonVetBerserker'
    Vet_Array(4)=Class'DUB_NeonWeapons.NeonVetFirebug'
    Vet_Array(5)=Class'DUB_NeonWeapons.NeonVetDemolitions'
}