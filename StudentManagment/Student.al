table 50100 Student
{
    Caption = 'Student  Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StudentCode; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; StudentName; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(3; DOB; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Gender; Option)
        {
            OptionMembers = Male,Female;
            DataClassification = ToBeClassified;
        }
        field(5; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Phone; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; StudentCode)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}