codeunit 50140 JSONManipulation
{
    trigger OnRun()
    begin
        Customer.setfilter("No.", '=%1', '01121212');
        if Customer.FindFirst() then begin
            CreateJSON(Customer);
        end;
    end;

    var
        Customer: Record Customer;

    local procedure CreateJSON(Customer: Record Customer)
    var
        ShiptoAddress: Record "Ship-to Address";
        JArray: JsonArray;
        CustObject: JsonObject;
        JsonObject: JsonObject;
        ShiptoObject: JsonObject;
        JsonData: Text;
    begin
        Clear(JsonObject);
        Clear(CustObject);

        CustObject.Add('No', Customer."No.");
        CustObject.Add('Address', Customer.Address);
        CustObject.Add('Address_2', Customer."Address 2");
        CustObject.Add('City', Customer.City);
        CustObject.Add('County', Customer.County);
        CustObject.Add('Country_Region', Customer."Country/Region Code");
        CustObject.Add('Post_Code', Customer."Post Code");

        ShiptoAddress.SetRange("Customer No.", Customer."No.");
        if ShiptoAddress.FindSet() then begin
            Clear(JArray);
            repeat
                Clear(ShiptoObject);
                ShiptoObject.Add('Code', ShiptoAddress.Code);
                ShiptoObject.Add('Address', ShiptoAddress.Address);
                ShiptoObject.Add('Address_2', ShiptoAddress."Address 2");
                ShiptoObject.Add('City', ShiptoAddress.City);
                ShiptoObject.Add('County', ShiptoAddress.County);
                ShiptoObject.Add('Post_Code', ShiptoAddress."Post Code");
                JArray.Add(ShiptoObject);
            until ShiptoAddress.Next() = 0;
            CustObject.Add('Ship-to', JArray);
        end;

        JsonObject.Add('Customer', CustObject);

        JsonObject.WriteTo(JsonData);
        Message(JsonData);

    end;

    local procedure ReadJSON(JsonObjectText: Text)
    var
        Customer: Record Customer;
        ShiptoAddress: Record "Ship-to Address";
        ArrayJSONManagement: Codeunit "JSON Management";
        JSONManagement: Codeunit "JSON Management";
        ObjectJSONManagement: Codeunit "JSON Management";
        i: Integer;
        CodeText: Text;
        CustomerJsonObject: Text;
        JsonArrayText: Text;
        ShipToJsonObject: Text;
    begin
        JSONManagement.InitializeObject(JsonObjectText);
        if JSONManagement.GetArrayPropertyValueAsStringByName('Customer', CustomerJsonObject) then begin
            ObjectJSONManagement.InitializeObject(CustomerJsonObject);

            Customer.Init();
            ObjectJSONManagement.GetStringPropertyValueByName('No', CodeText);
            Customer.Validate("No.", CopyStr(CodeText.ToUpper(), 1, MaxStrLen(Customer."No.")));
            ObjectJSONManagement.GetStringPropertyValueByName('Address', CodeText);
            Customer.Validate("Address", CopyStr(CodeText, 1, MaxStrLen(Customer."Address")));
            Customer.Insert();

            JSONManagement.InitializeObject(CustomerJsonObject);
            if JSONManagement.GetArrayPropertyValueAsStringByName('Ship-to', JsonArrayText) then begin
                ArrayJSONManagement.InitializeCollection(JsonArrayText);
                for i := 0 to ArrayJSONManagement.GetCollectionCount() - 1 do begin
                    ArrayJSONManagement.GetObjectFromCollectionByIndex(ShipToJsonObject, i);
                    ObjectJSONManagement.InitializeObject(ShipToJsonObject);

                    ShiptoAddress.Init();
                    ShiptoAddress.Validate("Customer No.", Customer."No.");
                    ObjectJSONManagement.GetStringPropertyValueByName('Code', CodeText);
                    ShiptoAddress.Validate("Code", CopyStr(CodeText.ToUpper(), 1, MaxStrLen(ShiptoAddress.Code)));
                    ShiptoAddress.Validate("Address", CopyStr(CodeText, 1, MaxStrLen(ShiptoAddress.Address)));
                    ShiptoAddress.Insert();

                end;
            end;
        end;
    end;

}