namespace ContextIdea.StudentManagement;
table 50100 Student
{
    Caption = 'Student';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StudentCode; Code[10])
        {
            Caption = 'StudentCode';
        }
        field(2; StudentName; Text[100])
        {
            Caption = 'StudentName';
        }
        field(3; DateOfBirth; Date)
        {
            Caption = 'DateOfBirth';
        }
        field(4; Gender; Option)
        {
            OptionMembers = Male,Female;
            Caption = 'Gender';
        }
        field(5; Email; Text[50])
        {
            Caption = 'Email';
        }
        field(6; Phone; Text[50])
        {
            Caption = 'Phone';
        }
    }
    keys
    {
        key(PK; StudentCode)
        {
            Clustered = true;
        }
    }
}
