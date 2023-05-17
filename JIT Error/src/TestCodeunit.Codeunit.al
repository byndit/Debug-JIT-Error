codeunit 62000 "Test Codeunit"
{
    TableNo = "Test Table";

    trigger OnRun()
    var
        TestTable: Record "Test Table";
    begin
        TestTable := Rec;

        // if this next line is commented and ChangeValue will executed everytime, it will work!
        if not TestTable."Test Bool" then
            ChangeValue(TestTable);
    end;

    local procedure ChangeValue(var TestTable: Record "Test Table")
    begin
        TestTable."Test Bool" := not TestTable."Test Bool";
        TestTable.Modify();
    end;
}
