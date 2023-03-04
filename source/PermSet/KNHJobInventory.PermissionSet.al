/// <summary>
/// Unknown "KNH_JobInventory" (ID 52000).
/// </summary>
permissionset 52010 KNH_JobInventory
{
    Assignable = true;
    Caption = 'Job Inventory', MaxLength = 30;
    Permissions =
        codeunit KNH_EventManagement = X;
}
