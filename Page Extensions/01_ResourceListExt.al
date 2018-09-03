pageextension 123456701 "CSD Resource list Ext" extends "Resource List"
{
    layout
    {
        modify(type)
        {
            Visible = ShowType;
        }
        addlast(Content)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }

            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }
    actions
    {

    }
    trigger OnOpenPage();
    begin
        ShowMaxField := true;
        rec.FilterGroup(3);
        ShowType := GetFilter(Type) = '';
        ShowMaxField := GetFilter(Type) = format(Type::Machine);
        rec.FilterGroup(0);
    end;

    var
        [InDataSet]
        ShowType: Boolean;
        [InDataSet]
        ShowMaxField: Boolean;
}