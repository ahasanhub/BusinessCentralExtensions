namespace StudentManagement.StudentManagement;

using ContextIdea.StudentManagement;

page 50101 StudentList
{
    ApplicationArea = All;
    Caption = 'StudentList';
    PageType = List;
    SourceTable = Student;
    UsageCategory = Lists;
    CardPageId = StudentCard;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(StudentCode; Rec.StudentCode)
                {
                    ToolTip = 'Specifies the value of the StudentCode field.', Comment = '%';
                }
                field(StudentName; Rec.StudentName)
                {
                    ToolTip = 'Specifies the value of the StudentName field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(DateOfBirth; Rec.DateOfBirth)
                {
                    ToolTip = 'Specifies the value of the DateOfBirth field.', Comment = '%';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.', Comment = '%';
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
                RunObject = report Students;
            }
        }
    }
}
