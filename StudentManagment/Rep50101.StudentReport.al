report 50101 "Student Report"
{
    ApplicationArea = All;
    Caption = 'Student Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'StudentReport.RDL';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(Student; Student)
        {
            column(StdCode; StudentCode)
            {

            }
            column(StdName; StudentName)
            {

            }
            column(DOB; DOB)
            {

            }
            column(Gender; Gender)
            {

            }
            column(Email; Email)
            {

            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
