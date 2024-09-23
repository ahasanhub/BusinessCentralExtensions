codeunit 50144 "Report Web Service"
{
    trigger OnRun()
    begin

    end;

    procedure RunReport(ReportNo: Integer; Parameters: Text): Text
    var
        OutS: OutStream;
        InS: InStream;
        TempBlob: Codeunit "Temp Blob";
        Base64: Codeunit "Base64 Convert";
    begin
        TempBlob.CreateOutStream(OutS);
        Report.SaveAs(ReportNo, Parameters, ReportFormat::Pdf, OutS);
        TempBlob.CreateInStream(InS);
        exit(Base64.ToBase64(InS));
    end;
}