namespace com.user0090;

using {
    cuid,
    managed
} from '@sap/cds/common';

type zde_meins : String(3);

// Header Entity - Header of Sales Order
entity Header : cuid {
    Email        : String(30) not null;
    FirstName    : String(30) not null;
    LastName     : String(30) not null;
    Country      : localized String(30);
    CreateOn     : Date default CURRENT_DATE;
    DeliveryDate : DateTime;
    OrderStatus  : Association to one Status; 
    ImageURL     : String;
    itemdata     : Association to many Items  //Composition of many Items
                       on itemdata.header = $self;
}


// Items Entity - Positions of Sales Order
entity Items : cuid {
    header           : Association to one Header;
    Name             : localized String(40) not null;
    Description      : localized String(40);
    ReleaseDate      : Date;
    DiscontinuedDate : Date;
    Price            : Decimal(12, 2);
    Currency         : Association to one Currency; 
    Height           : Decimal(15, 3);
    Width            : Decimal(13, 3);
    Depth            : Decimal(12, 2);
    Quantity         : Decimal(16, 2);
    UnitOfMeasure    : Association to one UnitOfMeasure;
}


// Currency Entity
@readonly
@cds.autoexpose
entity Currency {
    key ID          : String(3);
        Description : localized String(30);
}


// Unit Of Measure Entity
@readonly
@cds.autoexpose
entity UnitOfMeasure {
    key ID          : zde_meins;
        Description : localized String(30);
}


// Status Entity
@readonly
@cds.autoexpose
entity Status {
    key ID          : Integer;
        Description : localized String(30);
}
