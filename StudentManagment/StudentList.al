page 50101 StudentList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Student;
    CardPageId = StudentCard;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(StudentCode; Rec.StudentCode)
                {
                    ApplicationArea = All;

                }
                field(StudentName; Rec.StudentName)
                {
                    ApplicationArea = All;


                }
                field(DOB; Rec.DOB)
                {
                    ApplicationArea = All;

                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;

                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;

                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action("Student Report")
            {
                ApplicationArea = All;
                RunObject = report "Student Report";
            }
        }
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}