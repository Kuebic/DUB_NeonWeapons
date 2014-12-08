//----------------------
//KFPlayerController extension to setup perks for new weapons.
//----------------------
class NeonPlayerController extends KFPlayerController;

simulated function ClientWeaponSpawned(class<Weapon> WClass, Inventory Inv)
{
	switch ( WClass )
	{
		case class'Neon_Single':
			class'Neon_Single'.static.PreloadAssets(Inv);
			class'Neon_SingleFire'.static.PreloadAssets(Level);
			class'Neon_SingleAttachment'.static.PreloadAssets();
			break;
			
		//case class'Neon_Dualies':
			//class'Neon_Dualies'.static.PreloadAssets(Inv);
			//class'Neon_DualiesFire'.static.PreloadAssets(Level);
			//class'Neon_DualiesAttachment'.static.PreloadAssets();
			//break;
			
		case class'Neon_Deagle':
			class'Neon_Deagle'.static.PreloadAssets(Inv);
			class'Neon_DeagleFire'.static.PreloadAssets(Level);
			class'Neon_DeagleAltFire'.static.PreloadAssets(Level);
			class'Neon_DeagleAttachment'.static.PreloadAssets();
			break;
			
		//case class'Neon_DualDeagle':
			//class'Neon_DualDeagle'.static.PreloadAssets(Inv);
			//class'Neon_DualDeagleFire'.static.PreloadAssets(Level);
			//class'Neon_DualDeagleAttachment'.static.PreloadAssets();
			//break;
			
		//case class'Neon_Bullpup':
			//class'Neon_Bullpup'.static.PreloadAssets(Inv);
			//class'Neon_BullpupFire'.static.PreloadAssets(Level);
			//class'Neon_BullpupAttachment'.static.PreloadAssets();
			//break;
			
		case class'Neon_MAC10MP':
			class'Neon_MAC10MP'.static.PreloadAssets(Inv);
			class'Neon_MAC10Fire'.static.PreloadAssets(Level);
			class'Neon_MAC10Attachment'.static.PreloadAssets();
			break;
			
		case class'Neon_Knife':
			class'Neon_Knife'.static.PreloadAssets(Inv);
			class'Neon_KnifeFire'.static.PreloadAssets();
			class'Neon_KnifeAttachment'.static.PreloadAssets();
			break;
			
		//case class'Neon_Machete':
			//class'Neon_Machete'.static.PreloadAssets(Inv);
			//class'Neon_MacheteFire'.static.PreloadAssets();
			//class'Neon_MacheteAttachment'.static.PreloadAssets();
			//break;
			
		//case class'Neon_Axe':
			//class'Neon_Axe'.static.PreloadAssets(Inv);
			//class'Neon_AxeFire'.static.PreloadAssets();
			//class'Neon_AxeAttachment'.static.PreloadAssets();
			//break;
			
		//case class'Neon_Katana':
			//class'Neon_Katana'.static.PreloadAssets(Inv);
			//class'Neon_KatanaFire'.static.PreloadAssets();
			//class'Neon_KatanaFireB'.static.PreloadAssets();
			//class'Neon_KatanaAttachment'.static.PreloadAssets();
			//break;
			
		case class'Neon_AA12AutoShotgun':
			class'Neon_AA12AutoShotgun'.static.PreloadAssets(Inv);
			class'Neon_AA12Fire'.static.PreloadAssets(Level);
			class'Neon_AA12Attachment'.static.PreloadAssets();
			break;
			
		case class'Neon_BoomStick':
			class'Neon_BoomStick'.static.PreloadAssets(Inv);
			class'Neon_BoomStickFire'.static.PreloadAssets(Level);
			class'Neon_BoomStickAltFire'.static.PreloadAssets(Level);
			class'Neon_BoomStickAttachment'.static.PreloadAssets();
			break;
			
		//case class'Neon_Shotgun':
			//class'Neon_Shotgun'.static.PreloadAssets(Inv);
			//class'Neon_ShotgunFire'.static.PreloadAssets(Level);
			//class'Neon_ShotgunAttachment'.static.PreloadAssets();
			//break;
			
		//case class'Neon_Winchester':
			//class'Neon_Winchester'.static.PreloadAssets(Inv);
			//class'Neon_WinchesterFire'.static.PreloadAssets(Level);
			//class'Neon_WinchesterAttachment'.static.PreloadAssets();
			//break;
	}
	super.ClientWeaponSpawned(WClass, Inv);
}

simulated function ClientWeaponDestroyed(class<Weapon> WClass)
{
	switch ( WClass )
	{
		case class'Neon_Single':
			if (class'Neon_Single'.static.UnloadAssets()){
				class'Neon_SingleFire'.static.UnloadAssets();
				class'Neon_SingleAttachment'.static.UnloadAssets();
			}
			break;
			
		//case class'Neon_Dualies':
			//if (class'Neon_Dualies'.static.UnloadAssets()){
			//	class'Neon_DualiesFire'.static.UnloadAssets();
			//	class'Neon_DualiesAttachment'.static.UnloadAssets();
			//}
			break;
			
		case class'Neon_Deagle':
			if (class'Neon_Deagle'.static.UnloadAssets()){
				class'Neon_DeagleFire'.static.UnloadAssets();
				class'Neon_DeagleAltFire'.static.UnloadAssets();
				class'Neon_DeagleAttachment'.static.UnloadAssets();
			}
			break;
			
		//case class'Neon_DualDeagle':
			//if (class'Neon_DualDeagle'.static.UnloadAssets()){
			//	class'Neon_DualDeagleFire'.static.UnloadAssets();
			//	class'Neon_DualDeagleAttachment'.static.UnloadAssets();
			//}
			//break;
			
		//case class'Neon_Bullpup':
			//if (class'Neon_Bullpup'.static.UnloadAssets()){
			//	class'Neon_BullpupFire'.static.UnloadAssets();
			//	class'Neon_BullpupAttachment'.static.UnloadAssets();
			//}
			//break;
			
		case class'Neon_MAC10MP':
			if (class'Neon_MAC10MP'.static.UnloadAssets()){
				class'Neon_MAC10Fire'.static.UnloadAssets();
				class'Neon_MAC10Attachment'.static.UnloadAssets();
			}
			break;
			
		case class'Neon_Knife':
			if (class'Neon_Knife'.static.UnloadAssets()){
				class'Neon_KnifeFire'.static.UnloadAssets();
				class'Neon_KnifeAttachment'.static.UnloadAssets();
			}
			break;
			
		//case class'Neon_Machete':
			//if (class'Neon_Machete'.static.UnloadAssets()){
			//	class'Neon_MacheteFire'.static.UnloadAssets();
			//	class'Neon_MacheteAttachment'.static.UnloadAssets();
			//}
			//break;
			
		//case class'Neon_Axe':
			//if (class'Neon_Axe'.static.UnloadAssets()){
			//	class'Neon_AxeFire'.static.UnloadAssets();
			//	class'Neon_AxeAttachment'.static.UnloadAssets();
			//}
			//break;
			
		//case class'Neon_Katana':
			//if (class'Neon_Katana'.static.UnloadAssets()){
			//	class'Neon_KatanaFire'.static.UnloadAssets();
			//	class'Neon_KatanaFireB'.static.UnloadAssets();
			//	class'Neon_KatanaAttachment'.static.UnloadAssets();
			//}
			//break;
			
		case class'Neon_AA12AutoShotgun':
			if (class'Neon_AA12AutoShotgun'.static.UnloadAssets()){
				class'Neon_AA12Fire'.static.UnloadAssets();
				class'Neon_AA12Attachment'.static.UnloadAssets();
			}
			break;
			
		case class'Neon_BoomStick':
			if (class'Neon_BoomStick'.static.UnloadAssets()){
				class'Neon_BoomStickFire'.static.UnloadAssets();
				class'Neon_BoomStickAltFire'.static.UnloadAssets();
				class'Neon_BoomStickAttachment'.static.UnloadAssets();
			}
			break;
			
		//case class'Neon_Shotgun':
			//if (class'Neon_Shotgun'.static.UnloadAssets()){
			//	class'Neon_ShotgunFire'.static.UnloadAssets();
			//	class'Neon_ShotgunAttachment'.static.UnloadAssets();
			//}
			//break;
			
		//case class'Neon_Winchester':
			//if (class'Neon_Winchester'.static.UnloadAssets()){
			//	class'Neon_WinchesterFire'.static.UnloadAssets();
			//	class'Neon_WinchesterAttachment'.static.UnloadAssets();
			//}
			//break;
	}
	super.ClientWeaponDestroyed(WClass);
}
/*
function ShowBuyMenu(string wlTag,float maxweight)
{
	StopForceFeedback();  // jdf - no way to pause feedback

	// Open menu
	ClientOpenMenu("Dub_NeonWeapons.NeonGUIBuyMenu",,wlTag,string(maxweight));
}
*/
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
		
		PRI.ClientVeteranSkill = Class'MutDUB_NeonWeaponReplacer'.static.GetVetReplacement(VetSkill);
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

defaultproperties
{
     SelectedVeterancy=Class'KFMod.KFVetFieldMedic'
     PawnClass=Class'Dub_NeonWeapons.NeonHumanPawn'
}
