namespace com.user0090;

entity Header {
    key ID           : String(36);
    key Email        : String(30);
        FirstName    : String(30);
        LastName     : String(30);
        Country      : String(30);
        CreateOn     : Date;
        DeliveryDate : DateTime;
        OrderStatus  : Integer;
        ImageURL     : String;
}

entity Items {
    key ID               : String(36);
        Name             : String(40);
        Description      : String(40);
        ReleaseDate      : Date;
        DiscontinuedDate : Date;
        Price            : Decimal(12, 2);
        Height           : Decimal(15, 3);
        Width            : Decimal(13, 3);
        Depth            : Decimal(12, 2);
        Quantity         : Decimal(16, 2);
        UnitOfMeasure    : String(3);
}
