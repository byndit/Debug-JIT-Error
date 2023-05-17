table 62000 "Test Table"
{
    Caption = 'Test Table';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Test Code"; Code[20])
        {
            Caption = 'Test Code';
            NotBlank = true;
        }
        field(2; "Test Blob"; Blob)
        {
            Caption = 'Test Blob';
        }
        field(3; "Test Blob 2"; Blob)
        {
            Caption = 'Test Blob 2';
        }
        field(4; "Test Bool"; Boolean)
        {
            Caption = 'Test Bool';
        }
    }

    keys
    {
        key(Key1; "Test Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Test Code")
        {
        }
    }

}
