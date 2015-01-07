//----------------------
//KFHumanPawn extension to have Neon weapons working properly
//----------------------
class NeonHumanPawn extends KFHumanPawn;

function ServerBuyWeapon( Class<Weapon> WClass, float ItemWeight )
{
    local Inventory I, J;
    local float Price;
    local bool bIsDualWeapon, bHasDual9mms, bHasDualHCs, bHasDualRevolvers;

    if ( !CanBuyNow() || Class<KFWeapon>(WClass) == none || Class<KFWeaponPickup>(WClass.Default.PickupClass) == none )
    {
        return;
    }

    if ( Class<KFWeapon>(WClass).Default.AppID > 0 && Class<KFWeapon>(WClass).Default.UnlockedByAchievement != -1 )
    {

        if ( KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements) == none ||
            (!KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).PlayerOwnsWeaponDLC(Class<KFWeapon>(WClass).Default.AppID) &&
             KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).Achievements[Class<KFWeapon>(WClass).Default.UnlockedByAchievement].bCompleted != 1 ))
        {
            return;
        }

    }
    else if ( Class<KFWeapon>(WClass).Default.AppID > 0 )
    {
        if ( KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements) == none ||
            !KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).PlayerOwnsWeaponDLC(Class<KFWeapon>(WClass).Default.AppID))
        {
            return;
        }
    }
    else if ( Class<KFWeapon>(WClass).Default.UnlockedByAchievement != -1  )
    {
        if ( KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements) == none ||
             KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).Achievements[Class<KFWeapon>(WClass).Default.UnlockedByAchievement].bCompleted != 1 )
        {
            return;
        }
    }

    Price = class<KFWeaponPickup>(WClass.Default.PickupClass).Default.Cost;

    if ( KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill != none )
    {
        Price *= KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill.static.GetCostScaling(KFPlayerReplicationInfo(PlayerReplicationInfo), WClass.Default.PickupClass);
    }

    for ( I=Inventory; I!=None; I=I.Inventory )
    {
        if( I.Class==WClass )
        {
            Return;
        }

        if ( I.Class == class'Neon_Dualies' )
        {
            bHasDual9mms = true;
        }
        else if ( I.Class == class'Neon_DualDeagle' || I.Class == class'GoldenDualDeagle' )
        {
            bHasDualHCs = true;
        }
        else if ( I.Class == class'Dual44Magnum' )
        {
            bHasDualRevolvers = true;
        }
    }

    if ( WClass == class'Neon_DualDeagle' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'Neon_Deagle' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
        bHasDualHCs = true;
    }

    if ( WClass == class'GoldenDualDeagle' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'GoldenDeagle' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
        bHasDualHCs = true;
    }

    if ( WClass == class'Dual44Magnum' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'Magnum44Pistol' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
        bHasDualRevolvers = true;
    }

    if ( WClass == class'DualMK23Pistol' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'MK23Pistol' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
    }

    if ( WClass == class'DualFlareRevolver' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'FlareRevolver' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
    }

    bIsDualWeapon = bIsDualWeapon || WClass == class'Dualies';

    if ( !CanCarry(ItemWeight) )
    {
        Return;
    }

    if ( PlayerReplicationInfo.Score < Price )
    {
        Return; // Not enough CASH.
    }

    I = Spawn(WClass);

    if ( I != none )
    {
        if ( KFGameType(Level.Game) != none )
        {
            KFGameType(Level.Game).WeaponSpawned(I);
        }

        KFWeapon(I).UpdateMagCapacity(PlayerReplicationInfo);
        KFWeapon(I).FillToInitialAmmo();
        KFWeapon(I).SellValue = Price * 0.75;
        I.GiveTo(self);
        PlayerReplicationInfo.Score -= Price;

        if ( bIsDualWeapon )
        {
            KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).OnDualsAddedToInventory(bHasDual9mms, bHasDualHCs, bHasDualRevolvers);
        }

        ClientForceChangeWeapon(I);
    }

    SetTraderUpdate();
}

function ServerSellWeapon( Class<Weapon> WClass )
{
    local Inventory I;
    local Single NewSingle;
    local Deagle NewDeagle;
    local Magnum44Pistol New44Magnum;
    local MK23Pistol NewMK23;
    local FlareRevolver NewFlare;
    local float Price;

    if ( !CanBuyNow() || Class<KFWeapon>(WClass) == none || Class<KFWeaponPickup>(WClass.Default.PickupClass) == none )
    {
        SetTraderUpdate();
        Return;
    }

    for ( I = Inventory; I != none; I = I.Inventory )
    {
        if ( I.Class == WClass )
        {
            if ( KFWeapon(I) != none && KFWeapon(I).SellValue != -1 )
            {
                Price = KFWeapon(I).SellValue;
            }
            else
            {
                Price = int(class<KFWeaponPickup>(WClass.default.PickupClass).default.Cost * 0.75);

                if ( KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill != none )
                {
                    Price *= KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill.static.GetCostScaling(KFPlayerReplicationInfo(PlayerReplicationInfo), WClass.Default.PickupClass);
                }
            }

            if ( Dualies(I) != none && Neon_DualDeagle(I) == none && Dual44Magnum(I) == none
                && DualMK23Pistol(I) == none && DualFlareRevolver(I) == none )
            {
                NewSingle = Spawn(class'Neon_Single');
                NewSingle.GiveTo(self);
            }

            if ( DualDeagle(I) != none )
            {
                if( GoldenDualDeagle(I) != none )
                {
                    NewDeagle = Spawn(class'GoldenDeagle');
                }
                else
                {
                    NewDeagle = Spawn(class'Neon_Deagle');
                }
                NewDeagle.GiveTo(self);
                Price = Price / 2;
                NewDeagle.SellValue = Price;
            }

            if ( Dual44Magnum(I) != none )
            {
                New44Magnum = Spawn(class'Magnum44Pistol');
                New44Magnum.GiveTo(self);
                Price = Price / 2;
                New44Magnum.SellValue = Price;
            }
			
            if ( DualMK23Pistol(I) != none )
            {
				NewMK23 = Spawn(class'MK23Pistol');
                NewMK23.GiveTo(self);
                Price = Price / 2;
                NewMK23.SellValue = Price;
            }

            if ( DualFlareRevolver(I) != none )
            {
                NewFlare = Spawn(class'FlareRevolver');
                NewFlare.GiveTo(self);
                Price = Price / 2;
                NewFlare.SellValue = Price;
            }

            if ( I == Weapon || I == PendingWeapon )
            {
                ClientCurrentWeaponSold();
            }

            PlayerReplicationInfo.Score += Price;

            I.Destroyed();
            I.Destroy();

            SetTraderUpdate();

            if ( KFGameType(Level.Game) != none )
            {
                KFGameType(Level.Game).WeaponDestroyed(WClass);
            }

            return;
        }
    }
}

function bool ServerBuyAmmo( Class<Ammunition> AClass, bool bOnlyClip )
{
    local Inventory I;
    local float Price;
    local Ammunition AM;
    local KFWeapon KW;
    local int c;
    local float UsedMagCapacity;
    local Boomstick DBShotty;

    if ( !CanBuyNow() || AClass == None )
    {
        SetTraderUpdate();
        return false;
    }

    for ( I=Inventory; I != none; I=I.Inventory )
    {
        if ( I.Class == AClass )
        {
            AM = Ammunition(I);
        }
        else if ( KW == None && KFWeapon(I) != None && (Weapon(I).AmmoClass[0] == AClass || Weapon(I).AmmoClass[1] == AClass) )
        {
            KW = KFWeapon(I);
        }
    }

    if ( KW == none || AM == none )
    {
        SetTraderUpdate();
        return false;
    }

    DBShotty = Neon_Boomstick(KW);

    AM.MaxAmmo = AM.default.MaxAmmo;

    if ( KFPlayerReplicationInfo(PlayerReplicationInfo) != none && KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill != none )
    {
        AM.MaxAmmo = int(float(AM.MaxAmmo) * KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill.static.AddExtraAmmoFor(KFPlayerReplicationInfo(PlayerReplicationInfo), AClass));
    }

    if ( AM.AmmoAmount >= AM.MaxAmmo )
    {
        SetTraderUpdate();
        return false;
    }

    Price = class<KFWeaponPickup>(KW.PickupClass).default.AmmoCost * KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill.static.GetAmmoCostScaling(KFPlayerReplicationInfo(PlayerReplicationInfo), KW.PickupClass); // Clip price.

    if ( KW.bHasSecondaryAmmo && AClass == KW.FireModeClass[1].default.AmmoClass )
    {
        UsedMagCapacity = 1; // Secondary Mags always have a Mag Capacity of 1? KW.default.SecondaryMagCapacity;
    }
    else
    {
        UsedMagCapacity = KW.default.MagCapacity;
    }

    if( KW.PickupClass == class'HuskGunPickup')
    {
        UsedMagCapacity = class<HuskGunPickup>(KW.PickupClass).default.BuyClipSize;
    }

    if ( bOnlyClip )
    {
        if ( KFPlayerReplicationInfo(PlayerReplicationInfo) != none && KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill != none )
        {
            if( KW.PickupClass == class'HuskGunPickup')
            {
                c = UsedMagCapacity * KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill.static.AddExtraAmmoFor(KFPlayerReplicationInfo(PlayerReplicationInfo), AM.Class);
            }
            else
            {
                c = UsedMagCapacity * KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill.static.GetMagCapacityMod(KFPlayerReplicationInfo(PlayerReplicationInfo), KW);
            }
        }
        else
        {
            c = UsedMagCapacity;
        }
    }
    else
    {
        c = (AM.MaxAmmo-AM.AmmoAmount);
    }

    Price = int(float(c) / UsedMagCapacity * Price);

    if ( PlayerReplicationInfo.Score < Price ) // Not enough CASH (so buy the amount you CAN buy).
    {
        c *= (PlayerReplicationInfo.Score/Price);

        if ( c == 0 )
        {
            SetTraderUpdate();
            return false; // Couldn't even afford 1 bullet.
        }

        AM.AddAmmo(c);
        if( DBShotty != none )
        {
            DBShotty.AmmoPickedUp();
        }

        PlayerReplicationInfo.Score = Max(PlayerReplicationInfo.Score - (float(c) / UsedMagCapacity * Price), 0);

        SetTraderUpdate();

        return false;
    }

    PlayerReplicationInfo.Score = int(PlayerReplicationInfo.Score-Price);
    AM.AddAmmo(c);
    if( DBShotty != none )
    {
        DBShotty.AmmoPickedUp();
    }

    SetTraderUpdate();

    return true;
}

defaultproperties
{
}
