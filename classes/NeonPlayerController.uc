//----------------------
//KFPlayerController extension to setup perks for new weapons.
//----------------------
class NeonPlayerController extends KFPlayerController;
/*
simulated function ClientWeaponSpawned(class<Weapon> WClass, Inventory Inv)
{
	switch ( WClass )
	{
		case class'CyberAA12Shotgun':
			class'CyberAA12Shotgun'.static.PreloadAssets(Inv);
			class'CyberAA12Fire'.static.PreloadAssets(Level);
			class'CyberAA12Attachment'.static.PreloadAssets();
			break;

		case class'CyberMachete':
			class'CyberMachete'.static.PreloadAssets(Inv);
			break;

		case class'CyberMK23Pistol':
			class'CyberMK23Pistol'.static.PreloadAssets(Inv);
			class'CyberMK23Fire'.static.PreloadAssets(Level);
			class'CyberMK23Attachment'.static.PreloadAssets();
			break;

		case class'CyberDualMK23Pistols':	
			class'CyberDualMK23Pistols'.static.PreloadAssets(Inv);
			break;
			
		case class'CyberSCAR':
			class'CyberSCAR'.static.PreloadAssets(Inv);
			class'CyberSCARFire'.static.PreloadAssets(Level);
			class'CyberSCARAttachment'.static.PreloadAssets();
			break;

		case class'CyberVlad':
			class'CyberVlad'.static.PreloadAssets(Inv);
			class'CyberVladFire'.static.PreloadAssets(Level);
			class'CyberVladAttachment'.static.PreloadAssets();
			break;
		case class'CyberHuskGun':
			class'CyberHuskGun'.static.PreloadAssets(Inv);
			class'CyberHuskGunFire'.static.PreloadAssets(Level);
			class'CyberHuskGunAttachment'.static.PreloadAssets();
			break;
		case class'CyberPipeExplosive':
			class'CyberPipeExplosive'.static.PreloadAssets(Inv);
			class'CyberPipeFire'.static.PreloadAssets(Level);
			class'CyberPipeAttachment'.static.PreloadAssets();
			class'CyberPipeProjectile'.static.PreloadAssets();
			break;
	}
	super.ClientWeaponSpawned(WClass, Inv);
}

simulated function ClientWeaponDestroyed(class<Weapon> WClass)
{
	switch ( WClass )
	{
		case class'CyberAA12Shotgun':
			if(class'CyberAA12Shotgun'.static.UnloadAssets()){
				class'CyberAA12Fire'.static.UnloadAssets();
				class'CyberAA12Attachment'.static.UnloadAssets();
			}
			break;

		case class'CyberMachete':
			class'CyberMachete'.static.UnloadAssets();
			break;

		case class'CyberMK23Pistol':
			if(class'CyberMK23Pistol'.static.UnloadAssets()){
				class'CyberMK23Fire'.static.UnloadAssets();
				class'CyberMK23Attachment'.static.UnloadAssets();
			}
			break;
		
		case class'CyberDualMK23Pistols':	
			class'CyberDualMK23Pistols'.static.UnloadAssets();
			break;

		case class'CyberSCAR':
			if(class'CyberSCAR'.static.UnloadAssets()){
				class'CyberSCARFire'.static.UnloadAssets();
				class'CyberSCARAttachment'.static.UnloadAssets();
			}
			break;

		case class'CyberVlad':
			if(class'CyberVlad'.static.UnloadAssets()){
				class'CyberVladFire'.static.UnloadAssets();
				class'CyberVladAttachment'.static.UnloadAssets();
			}
			break;
		case class'CyberHuskGun':
			if(class'CyberHuskGun'.static.UnloadAssets()){
				class'CyberHuskGunFire'.static.UnloadAssets();
				class'CyberHuskGunAttachment'.static.UnloadAssets();
			}
			break;
		case class'CyberPipeExplosive':
			if (class'CyberPipeExplosive'.static.UnloadAssets())
			{
				class'CyberPipeProjectile'.static.UnloadAssets();
				class'CyberPipeAttachment'.static.UnloadAssets();
			}
			break;
	}
	super.ClientWeaponDestroyed(WClass);
}

function ShowBuyMenu(string wlTag,float maxweight)
{
	StopForceFeedback();  // jdf - no way to pause feedback

	// Open menu
	ClientOpenMenu("Dub_NeonWeapons.NeonGUIBuyMenu",,wlTag,string(maxweight));
}

function SelectVeterancy(Class<KFVeterancyTypes> VetSkill, optional bool bForceChange) {
	local KFPlayerReplicationInfo PRI;
	
	if (VetSkill == None || KFPlayerReplicationInfo(PlayerReplicationInfo) == None || KFSteamStatsAndAchievements(SteamStatsAndAchievements) == None) {
		return;
	}
	
	SetSelectedVeterancy(VetSkill);
	PRI = KFPlayerReplicationInfo(PlayerReplicationInfo);
	if (KFGameReplicationInfo(GameReplicationInfo).bWaveInProgress && !ClassIsChildOf(PRI.ClientVeteranSkill, VetSkill)) {
		bChangedVeterancyThisWave = false;
		ClientMessage(Repl(YouWillBecomePerkString, "%Perk%", VetSkill.default.VeterancyName));
	}
	else if (!bChangedVeterancyThisWave || bForceChange) {
		if (!ClassIsChildOf(PRI.ClientVeteranSkill, VetSkill)) {
			ClientMessage(Repl(YouAreNowPerkString, "%Perk%", VetSkill.default.VeterancyName));
			
			if (GameReplicationInfo.bMatchHasBegun) {
				bChangedVeterancyThisWave = true;
			}
		}
		
		PRI.ClientVeteranSkill = Class'CyberWeaponsV4'.static.GetVetReplacement(VetSkill);
		PRI.clientVeteranSkillLevel = KFSteamStatsAndAchievements(SteamStatsAndAchievements).PerkHighestLevelAvailable(VetSkill.default.perkIndex);
		if(KFHumanPawn(Pawn) != None) {
			KFHumanPawn(Pawn).VeterancyChanged();
		}
	}
	else {
		ClientMessage(PerkChangeOncePerWaveString);
	}
}

function SetPawnClass(string inClass, string inCharacter) {
	PawnClass = default.PawnClass;
	inCharacter = class'KFGameType'.static.GetValidCharacter(inCharacter);
	PawnSetupRecord = class'xUtil'.static.FindPlayerRecord(inCharacter);
	PlayerReplicationInfo.SetCharacterName(inCharacter);
}
*/
defaultproperties
{
     SelectedVeterancy=Class'KFMod.KFVetFieldMedic'
     PawnClass=Class'Dub_NeonWeapons.NeonHumanPawn'
}
