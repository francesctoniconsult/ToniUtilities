codeunit 50150 "Procesos Varenga"
{
    procedure DeleteLastNoUsed()
    var
        NoSeriesLine: Record "No. Series Line";
        NoSeries: Record "No. Series";
    begin
        NoSeries.Reset();
        NoSeries.SetRange("No reiniciar contador", false);
        if (NoSeries.FindSet()) then begin
            repeat
                NoSeriesLine.Reset();
                NoSeriesLine.SetRange("Series Code", NoSeries.Code);
                if (NoSeriesLine.FindSet()) then begin
                    repeat
                        if (NoSeriesLine."Last No. Used" <> '') then begin
                            NoSeriesLine."Last No. Used" := '';
                            NoSeriesLine.Modify();
                        end;
                    until NoSeriesLine.Next() = 0;
                end;
            until NoSeries.Next() = 0;
        end;
    end;
}