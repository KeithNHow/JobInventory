/// <summary>
/// Codeunit KNH_EventManagement (ID 50100).
/// </summary>
codeunit 50100 "KNH_EventManagement"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnPostItemJnlLineJobConsumption', '', false, false)]
    local procedure SkipItemJobApplicationPurchase(var IsHandled: Boolean)
    begin
        IsHandled := true; // Just skip everything...
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Purch. Release", 'OnAfterReleaseSetFilters', '', false, false)]
    local procedure IgnoreJobFilterRelease(var PurchaseLine: Record "Purchase Line")
    begin
        PurchaseLine.SetRange("Job No.");
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnAfterPurchaseLineOnPreDataItem', '', false, false)]
    local procedure IgnoreJobFilterGetSourceDocuments(var PurchaseLine: Record "Purchase Line")
    begin
        PurchaseLine.SetRange("Job No.");
    end;
}
