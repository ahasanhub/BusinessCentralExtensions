namespace StudentManagement.StudentManagement;

using ContextIdea.StudentManagement;

report 50100 Students
{
    ApplicationArea = All;
    Caption = 'StudentListReport';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'StudentReport.RDL';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Student; Student)
        {
            column(StudentCode; StudentCode)
            {
            }
            column(StudentName; StudentName)
            {
            }
            column(Phone; Phone)
            {
            }
            column(Gender; Gender)
            {
            }
            column(Email; Email)
            {
            }
            column(DateOfBirth; DateOfBirth)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
