class MutDUB_NeonWeaponReplacer extends Mutator;

struct ReplacementPair 
{
	var class<Object> oldClass;
	var class<Object> newClass;
};
var array<ReplacementPair> pickupReplacements;
var class<LevelRules> levelRules;
var KFGameType gameType;


function PostBeginPlay() 
{
	gameType= KFGameType(Level.Game);
	if (gameType == none) 
	{
		Destroy();
		return;
	}
	AddToPackageMap();
	SetTimer(1.0, false);
}

function Timer() 
{
	gameType.KFLRules.destroy();
	gameType.KFLRules= spawn(levelRules);
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant) 
{
	local int i, j;
	local KFHumanPawn KFHP;
	local KFWeapon NineMMReplacement;
	local KFWeapon DeagleReplacement;
	
	if(KFHumanPawn(Other)!=None)
	{
		KFHumanPawn(Other).RequiredEquipment[0] = "KFMod.Knife";
		KFHumanPawn(Other).RequiredEquipment[1] = "DUB_NeonWeapons.Neon_Single";
		KFHumanPawn(Other).RequiredEquipment[2] = "KFMod.Frag";
		KFHumanPawn(Other).RequiredEquipment[3] = "KFMod.Syringe";
		KFHumanPawn(Other).RequiredEquipment[4] = "KFMod.Welder";
	}
	
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
	if (KFWeaponPickup(Other) != none || KFAmmoPickup(Other) != none) 
	{
		i = shouldReplace(Other.class, pickupReplacements);
		if (i != -1) 
		{
			ReplaceWith(Other,String(pickupReplacements[i].newClass));
			return false;
		}
	}
	return super.CheckReplacement(Other, bSuperRelevant);
}
function int shouldReplace(class<Object> classRef, array<ReplacementPair> replacementArray) 
{
	local int i, replaceIndex;
	replaceIndex= -1;
	for(i=0; replaceIndex == -1 && i < replacementArray.length; i++) 
	{
		if (classRef == replacementArray[i].oldClass) 
		{
			replaceIndex= i;
		}
	}
	return replaceIndex;
}

defaultproperties
{
    GroupName="KF-DUBNeon Weapons Replacer"
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
}
