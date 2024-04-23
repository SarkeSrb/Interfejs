interface IPlatniSistem
{
    procedure ProcesuirajUplatu(Iznos: Decimal);
}

codeunit 50200 BankovniPlatniSistem implements IPlatniSistem
{
    procedure ProcesuirajUplatu(Iznos: Decimal)
    begin
        // Konkretna implementacija za bankovni platni sistem
        Message(StrSubstNo('Bankovni sistem procesuira uplatu od %1 Din.', Iznos));
    end;
}
codeunit 50201 ElektronskiPlatniSistem implements IPlatniSistem
{
    procedure ProcesuirajUplatu(Iznos: Decimal)
    begin
        // Konkretna implementacija za elektronski platni sistem
        Message(StrSubstNo('Elektronski sistem procesuira uplatu od %1 Din.', Iznos));
    end;
}

enum 50200 Sistem implements IPlatniSistem
{
    Extensible = true;
    Access = Public;

    value(0; "Bankovni Platni Sistem")
    {
        Implementation = IPlatniSistem = BankovniPlatniSistem;
    }

    value(1; "Elektronski Platni Sistem")
    {
        Implementation = IPlatniSistem = ElektronskiPlatniSistem;
    }
}

page 50200 "Platni Sistem"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group("Platni Sistemi")
            {
                field(Iznos; Iznos)
                {
                    ApplicationArea = All;
                }
                field("Platni Sistem"; PlatniSistemEnum)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Proknjiži)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PlatniSistem: Interface IPlatniSistem;
                begin
                    PlatniSistemProvajder(PlatniSistem);
                    PlatniSistem.ProcesuirajUplatu(Iznos);
                end;
            }
        }
    }

    local procedure PlatniSistemProvajder(var IPlatniSistem: Interface IPlatniSistem)
    begin
        IPlatniSistem := PlatniSistemEnum;
    end;

    var
        PlatniSistemEnum: Enum Sistem;
        Iznos: Decimal;
}