enumextension 50100 SistemKes extends Sistem
{
    value(10; "Gotovinski platni sistem")
    {
        Implementation = IPlatniSistem = KesPlatniSistem;
    }
}

codeunit 50110 KesPlatniSistem implements IPlatniSistem
{
    procedure ProcesuirajUplatu(Iznos: Decimal)
    begin
        // Konkretna implementacija za Gotovinski platni sistem
        Message(StrSubstNo('Gotovinski platni sistem procesuira uplatu od %1 Din.', Iznos));
    end;
}