class MutDUB_NeonWeaponReplacer extends Mutator;

struct ReplacementPair 
{
	var class<Object> oldClass;
	var class<Object> newClass;
};
var array<ReplacementPair> pickupReplacements;
//var Array< Class<KFVeterancyTypes> > Vet_Array;
var class<LevelRules> levelRules;
var KFGameType gameType;


function PostBeginPlay() 
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
		
	/* //My attempt at modifying perk bonuses... maybe later
	if (gameType != None)
	{
		if (!ClassIsChildOf(gameType.PlayerControllerClass, class'NeonPlayerController'))
		{
			gameType.PlayerControllerClass = class'NeonPlayerController';
			gameType.PlayerControllerClassName = string(class'NeonPlayerController');
		}
	}
	*/
	SetTimer(1.0, false);
}
/* //My attempt at modifying perk bonuses... maybe later
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
*/
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
	
	//Change Loading equipment
	if(KFHumanPawn(Other)!=None)
	{
		KFHumanPawn(Other).RequiredEquipment[0] = "KFMod.Knife";
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
//    Vet_Array(0)=Class'DUB_NeonWeapons.NeonVetSupportSpec'
//    Vet_Array(1)=Class'DUB_NeonWeapons.NeonVetSharpshooter'
//    Vet_Array(2)=Class'DUB_NeonWeapons.NeonVetCommando'
//    Vet_Array(3)=Class'DUB_NeonWeapons.NeonVetBerserker'
//    Vet_Array(4)=Class'DUB_NeonWeapons.NeonVetFirebug'
//    Vet_Array(5)=Class'DUB_NeonWeapons.NeonVetDemolitions'
}