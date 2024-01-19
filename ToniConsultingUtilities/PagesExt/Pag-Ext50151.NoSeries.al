pageextension 50151 "No. Series" extends "No. Series"
{
    layout
    {
        addafter(LastNoUsed)
        {
            field("No reiniciar contador"; Rec."No reiniciar contador")
            {
                ApplicationArea = All;
                Caption = 'No reiniciar contador';
            }
        }
    }
    actions
    {
        addfirst(Processing)
        {

            action(DeleteLastNoUsed)
            {
                ApplicationArea = All;
                Caption = 'Reiniciar Ult No. Usado Real';
                trigger OnAction()
                var
                    ProcesosVarenga: Codeunit "Procesos Varenga";
                begin
                    ProcesosVarenga.DeleteLastNoUsed();
                end;
            }
        }
    }
}