page 62001 "Test Page 1- Calcfields on Rec"
{
    ApplicationArea = All;
    Caption = 'Test 1: Calcfields on Rec';
    PageType = List;
    SourceTable = "Test Table";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Test Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'empty';
                }
                field(TestBlobText; TestBlobText)
                {
                    Caption = 'Test Blob 1';
                    ExtendedDatatype = Masked;
                    ApplicationArea = All;
                    ToolTip = 'empty';

                    trigger OnValidate()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        TempInStream: InStream;
                        TempOutStream: OutStream;
                    begin
                        if TestBlobText = '' then
                            Clear(Rec."Test Blob")
                        else begin
                            SaveBlob(TempBlob, TestBlobText);
                            Clear(TempInStream);
                            Tempblob.CreateInStream(TempInStream);
                            Rec."Test Blob".CreateOutStream(TempOutStream);
                            Copystream(TempOutStream, TempInStream);
                        end;
                    end;
                }
                field(TestBlob2Text; TestBlob2Text)
                {
                    Caption = 'Test Blob 2';
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                    ToolTip = 'empty';
                    trigger OnValidate()
                    var
                        TempBlob: Codeunit "Temp Blob";
                        TempInStream: InStream;
                        TempOutStream: OutStream;
                    begin
                        if TestBlob2Text = '' then
                            Clear(Rec."Test Blob 2")
                        else begin
                            SaveBlob(TempBlob, TestBlob2Text);
                            Clear(TempInStream);
                            Tempblob.CreateInStream(TempInStream);
                            Rec."Test Blob 2".CreateOutStream(TempOutStream);
                            Copystream(TempOutStream, TempInStream);
                        end;
                    end;
                }
                field("Test Bool"; Rec."Test Bool")
                {
                    ApplicationArea = All;
                    ToolTip = 'empty';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Run)
            {
                ApplicationArea = All;
                Caption = 'Run Action';
                Image = Web;
                ToolTip = 'empty';

                trigger OnAction()
                begin
                    Codeunit.Run(62000, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(Run_Promoted; Run)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // Error Here
        Rec.CalcFields("Test Blob", "Test Blob 2");
        if Rec."Test Blob".HasValue then
            TestBlobText := '***'
        else
            TestBlobText := '';
        if Rec."Test Blob 2".HasValue then
            TestBlob2Text := '***'
        else
            TestBlob2Text := '';
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        TestBlobText := '';
        TestBlob2Text := '';
    end;

    var
        TestBlob2Text: Text;
        TestBlobText: Text;


    procedure SaveBlob(var TempBlob: Codeunit "Temp Blob"; BlobText: Text);
    var
        lOutStream: OutStream;
    begin
        TempBlob.CreateOutStream(lOutStream);
        lOutStream.Write(BlobText);
    end;
}
