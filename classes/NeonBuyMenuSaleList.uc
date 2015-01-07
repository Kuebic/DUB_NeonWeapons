//----------------------
//NeonBuyMenuSaleList
//----------------------
//KFBuyMenuSaleList extension to have Neon weapons working properly
//----------------------
class NeonBuyMenuSaleList extends KFBuyMenuSaleList;

#exec OBJ LOAD FILE=Potato_T.utx

//THIS FUNCTION NEEDS TO BE CHECKED EVERY UPDATE TO ENSURE NO PROBLEMS ARISE.
function int PopulateBuyables()
{
    local class<KFVeterancyTypes> PlayerVeterancy;
    local KFPlayerReplicationInfo KFPRI;
    local GUIBuyable ForSaleBuyable;
    local class<KFWeaponPickup> ForSalePickup;
    local int currentIndex, i, j, DualDivider;
    local bool bZeroWeight;

    DualDivider = 1;

    // Grab Players Veterancy for quick reference
    if ( KFPlayerController(PlayerOwner()) != none && KFPlayerReplicationInfo(PlayerOwner().PlayerReplicationInfo).ClientVeteranSkill != none )
    {
        PlayerVeterancy = KFPlayerReplicationInfo(PlayerOwner().PlayerReplicationInfo).ClientVeteranSkill;
    }
    else
    {
        PlayerVeterancy = class'KFVeterancyTypes';
    }

    KFPRI = KFPlayerReplicationInfo(PlayerOwner().PlayerReplicationInfo);

    //Grab the perk's weapons first
    for ( j = 0; j < KFLR.ItemForSale.Length; j++ )
    {
        if ( KFLR.ItemForSale[j] != none )
        {
            ForSalePickup = class<KFWeaponPickup>(KFLR.ItemForSale[j]);

            //if( ForSalePickup != class'KFMod.Potato' )
            //{
                //Let's see if this is a vest, first aid kit, ammo or stuff we already have
                if ( class<Vest>(KFLR.ItemForSale[j]) != none || class<FirstAidKit>(KFLR.ItemForSale[j]) != none ||
                     class<KFWeapon>(KFLR.ItemForSale[j].default.InventoryType) == none || KFLR.ItemForSale[j].IsA('Ammunition') ||
                     class<KFWeapon>(KFLR.ItemForSale[j].default.InventoryType).default.bKFNeverThrow ||
                     IsVariantInInventory(ForSalePickup) )
                {
                    continue;
                }
            //}

            if ( class<Neon_Deagle>(ForSalePickup.default.InventoryType) != none )
            {
                if ( IsVariantInInventory(class'Neon_DualDeaglePickup') )
                {
                    continue;
                }
            }

            if ( class<Magnum44Pistol>(ForSalePickup.default.InventoryType) != none )
            {
                if ( IsInInventory(class'Dual44MagnumPickup') )
                {
                    continue;
                }
            }

            if ( class<MK23Pistol>(ForSalePickup.default.InventoryType) != none )
            {
                if ( IsVariantInInventory(class'DualMK23Pickup') )
                {
                    continue;
                }
            }

            if ( class<FlareRevolver>(ForSalePickup.default.InventoryType) != none )
            {
                if ( IsInInventory(class'DualFlareRevolverPickup') )
                {
                    continue;
                }
            }

            // reduce displayed price of dualies if player owns single
            if ( ForSalePickup.default.InventoryType == class'Neon_DualDeagle' &&
                 IsInInventory(class'Neon_DeaglePickup') )
            {
                DualDivider = 2;
            }
            else if(  ForSalePickup.default.InventoryType == class'GoldenDualDeagle' &&
                      IsInInventory(class'GoldenDeaglePickup') )
            {
                DualDivider = 2;
            }
            else if(  class<Dual44Magnum>(ForSalePickup.default.InventoryType) != none &&
                      IsInInventory(class'Magnum44Pickup') )
            {
                DualDivider = 2;
            }
            else if(  class<DualMK23Pistol>(ForSalePickup.default.InventoryType) != none &&
                      IsInInventory(class'MK23Pickup') )
            {
                DualDivider = 2;
            }
            else if(  class<DualFlareRevolver>(ForSalePickup.default.InventoryType) != none &&
                      IsInInventory(class'FlareRevolverPickup') )
            {
                DualDivider = 2;
            }
            else
            {
                DualDivider = 1;
                bZeroWeight = false;
            }

            if ( currentIndex >= ForSaleBuyables.Length )
            {
                ForSaleBuyable = new class'GUIBuyable';
                ForSaleBuyables[ForSaleBuyables.Length] = ForSaleBuyable;
            }
            else
            {
                ForSaleBuyable = ForSaleBuyables[currentIndex];
            }

            currentIndex++;

            ForSaleBuyable.ItemName         = ForSalePickup.default.ItemName;
            ForSaleBuyable.ItemDescription  = ForSalePickup.default.Description;
            ForSaleBuyable.ItemCategorie    = KFLR.EquipmentCategories[i].EquipmentCategoryName;
            /*if( ForSalePickup == class'KFMod.Potato' )
            {
                ForSaleBuyable.ItemImage        = Texture'Potato_T.ui_potato';
                ForSaleBuyable.ItemAmmoClass    = none;
            }
            else*/
            //{
                ForSaleBuyable.ItemImage        = class<KFWeapon>(ForSalePickup.default.InventoryType).default.TraderInfoTexture;
                ForSaleBuyable.ItemAmmoClass    = class<KFWeapon>(ForSalePickup.default.InventoryType).default.FireModeClass[0].default.AmmoClass;
            //}
            ForSaleBuyable.ItemWeaponClass  = class<KFWeapon>(ForSalePickup.default.InventoryType);
            ForSaleBuyable.ItemPickupClass  = ForSalePickup;
            ForSaleBuyable.ItemCost         = int((float(ForSalePickup.default.Cost)
                                              * PlayerVeterancy.static.GetCostScaling(KFPRI, ForSalePickup)) / DualDivider);
            ForSaleBuyable.ItemAmmoCost     = 0;
            ForSaleBuyable.ItemFillAmmoCost = 0;

            if ( bZeroWeight)
            {
                ForSaleBuyable.ItemWeight   = 1.f;
            }
            else if ( (ForSalePickup == class'Neon_DualDeaglePickup' || ForSalePickup == class'GoldenDualDeaglePickup')
                      && (IsInInventory(class'Neon_DeaglePickup') || IsInInventory(class'GoldenDeaglePickup')) )
            {
                ForSaleBuyable.ItemWeight= ForSalePickup.default.Weight / 2;
            }
            else if ( ForSalePickup == class'Dual44MagnumPickup' && IsInInventory(class'Magnum44Pickup') )
            {
                ForSaleBuyable.ItemWeight= ForSalePickup.default.Weight / 2;
            }
            else if ( ForSalePickup == class'DualMK23Pickup' && IsInInventory (class'MK23Pickup')) 
            {
                ForSaleBuyable.ItemWeight= ForSalePickup.default.Weight / 2;
            }
            else if ( ForSalePickup == class'DualFlareRevolverPickup' && IsInInventory(class'FlareRevolverPickup') )
            {
                ForSaleBuyable.ItemWeight= ForSalePickup.default.Weight / 2;
            }
            else
            {
                ForSaleBuyable.ItemWeight   = ForSalePickup.default.Weight;
            }

            ForSaleBuyable.ItemPower        = ForSalePickup.default.PowerValue;
            ForSaleBuyable.ItemRange        = ForSalePickup.default.RangeValue;
            ForSaleBuyable.ItemSpeed        = ForSalePickup.default.SpeedValue;
            ForSaleBuyable.ItemAmmoCurrent  = 0;
            ForSaleBuyable.ItemAmmoMax      = 0;
            ForSaleBuyable.ItemPerkIndex    = ForSalePickup.default.CorrespondingPerkIndex;

            // Make sure we mark the list as a sale list
            ForSaleBuyable.bSaleList = true;

            bZeroWeight = false;
        }
    }
    return currentIndex;
}

defaultproperties
{
}
