pageextension 50101 RoleExt extends "Order Processor Role Center"
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
