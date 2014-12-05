//----------------------
//Berserker perk extension to give the Cyber Machete bonuses
//----------------------
//Super sneaky way to get the cyber weapons' bonuses consistent with their normal counter parts.
//----------------------
class NeonVetBerserker extends KFVetBerserker
	abstract;

static function float GetCostScaling(KFPlayerReplicationInfo KFPRI, class<Pickup> Item)
{
	if (Item == class'Neon_MachetePickup')
		return super.GetCostScaling(KFPRI, class'MachetePickup');
	else if (Item == class'Neon_AxePickup')
		return super.GetCostScaling(KFPRI, class'AxePickup');
	else if (Item == class'Neon_KatanaPickup')
		return super.GetCostScaling(KFPRI, class'KatanaPickup');
	return super.GetCostScaling(KFPRI, Item);
}

defaultproperties
{
}
