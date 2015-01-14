//----------------------
//KFTab_BuyMenu extension to have Neon weapons working properly
//----------------------
// FLIPPITY FLOOPIN TRADER MODIFICATIONS
//----------------------
class NeonTabBuyMenu extends KFGui.KFTab_BuyMenu;

function ShowPanel(bool bShow){
	Super(UT2K4TabPanel).ShowPanel(bShow);

	bClosed = false;

	if (KFPlayerController(PlayerOwner()) != None){
		KFPlayerController(PlayerOwner()).bDoTraderUpdate = true;
	}

	InvSelect.SetPosition(InvBG.winLeft + 7.0 / float(Controller.resX), InvBG.winTop + 55.0 / float(Controller.resY), InvBG.winWidth - 15.0 / float(Controller.resX), InvBG.winHeight - 45.0 / float(Controller.resY), true);
	SaleSelect.SetPosition(SaleBG.winLeft + 7.0 / float(Controller.resX), SaleBG.winTop + 55.0 / float(Controller.resY), SaleBG.winWidth - 15.0 / float(Controller.resX), SaleBG.winHeight - 63.0 / float(Controller.resY), true);
}

defaultproperties
{
     Begin Object Class=NeonBuyMenuInvListBox Name=InventoryBox
         OnCreateComponent=InventoryBox.InternalOnCreateComponent
         WinTop=0.070841
         WinLeft=0.000108
         WinWidth=0.328204
         WinHeight=0.521856
     End Object
     InvSelect=NeonBuyMenuInvListBox'DUB_NeonWeapons.NeonTabBuyMenu.InventoryBox'

     Begin Object Class=NeonBuyMenuSaleListBox Name=SaleBox
         OnCreateComponent=SaleBox.InternalOnCreateComponent
         WinTop=0.064312
         WinLeft=0.672632
         WinWidth=0.325857
         WinHeight=0.674039
     End Object
     SaleSelect=NeonBuyMenuSaleListBox'DUB_NeonWeapons.NeonTabBuyMenu.SaleBox'
*/
}
