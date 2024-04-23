enumextension 50100 SistemKes extends Sistem
{
    value(10; "Gotovinski platni sistem")
    {
        Implementation = IPlatniSistem = GotovinskiPlatniSistem;
    }
}

codeunit 50110 GotovinskiPlatniSistem implements IPlatniSistem
{
    procedure ObradiUplatu(Iznos: Decimal)
    begin
        // Konkretna implementacija za Gotovinski platni sistem
        Message(StrSubstNo('Gotovinski platni sistem procesuira uplatu od %1 Din.', Iznos));
    end;
}