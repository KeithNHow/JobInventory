/// <summary>
/// Codeunit to handle events for KNH Event Management related to purchasing and warehouse processes, specifically to skip job application on purchase lines and ignore job filters in certain reports and processes.
/// </summary>
codeunit 52010 KNH_EventManagement
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
