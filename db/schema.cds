namespace com.user0090;

using {cuid, managed} from '@sap/cds/common';

type zde_meins : String(3);

entity Header : cuid {
    //key ID           : String(36) not null       @title: 'Sales Order ID';
    Email        : String(30) not null       @title: 'Email';
    FirstName    : String(30) not null       @title: 'First Name';
    LastName     : String(30) not null       @title: 'Last Name';
    Country      : localized String(30)      @title: 'Country';
    CreateOn     : Date default CURRENT_DATE @title: 'Create On';
    DeliveryDate : DateTime                  @title: 'Delivery Date'; // default $now;
    OrderStatus  : Association to Status     @title: 'Status'; // Integer;
    ImageURL     : String                    @title: 'Image URL';
    //item         : Composition of many Items
    //                   on item.HeaderID = $self;
    ItemData     : Association to  many Items
                       on ItemData.Header = $self;
}

entity Items : cuid {
    key Header       : Association to Header; //String(36) not null;
    //key ItemID           : String(36) not null;
    Name             : localized String(40) not null @title: 'Item Name';
    Description      : localized String(40)          @title: 'Item Description';
    ReleaseDate      : Date                          @title: 'Release Date';
    DiscontinuedDate : Date                          @title: 'Discontinued Date';
    Price            : Decimal(12, 2)                @title: 'Price';
    Currency         : Association to Currency       @title: 'Currency'; // String(3);
    Height           : Decimal(15, 3)                @title: 'Heigth';
    Width            : Decimal(13, 3)                @title: 'Width';
    Depth            : Decimal(12, 2)                @title: 'Depth';
    Quantity         : Decimal(16, 2)                @title: 'Quantity';
    UnitOfMeasure    : Association to UnitOfMeasure  @title: 'Unit of Measure'; // zde_meins;
    //head             : Association to Header;
}

@readonly
entity Currency {
    key ID          : String(3)            @title: 'Currency ID';
        Description : localized String(30) @title: 'Description';
}

@readonly
entity UnitOfMeasure {
    key ID          : zde_meins            @title: 'UofM ID'; //String(3);
        Description : localized String(30) @title: 'Description';
}

@readonly
entity Status {
    key ID          : Integer              @title: 'Status ID';
        Description : localized String(30) @title: 'Description';
}
