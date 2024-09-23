namespace StudentManagement.StudentManagement;

using Microsoft.Sales.RoleCenters;

pageextension 50102 StudentRole extends "Order Processor Role Center"
{
    actions
    {
        addfirst(sections)
        {
            group(Student)
            {
                action("Student List")
                {
                    ApplicationArea = All;

                    RunObject = page StudentList;
                }
            }
        }
    }
}
