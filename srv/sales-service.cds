using {com.user0090 as user0090} from '../db/schema';

service salesservice {

    type deleteOrderReturn {
        status  : String enum {
            Success;
            Fail
        };
        message : String
    };


    // entity Header        as projection on user0090.Header actions {
    //     action deleteOrder(salesID : UUID) returns deleteOrderReturn;
    // };
    //entity Items         as projection on user0090.Items;
    //entity Currency      as projection on user0090.Currency;
    //entity UnitOfMeasure as projection on user0090.UnitOfMeasure;
    //entity Status        as projection on user0090.Status;

    entity Header1        as
        select from user0090.Header {
            ID as HeaderID,
            Email @mandatory,
            FirstName,
            LastName,
            Country,
            CreateOn,
            DeliveryDate,
            OrderStatus,
            ImageURL
        };

    entity Items         as
        select from user0090.Items {
            header.ID as HeaderID,
            ID        as ItemID,
            Name,
            Description,
            ReleaseDate,
            DiscontinuedDate,
            Quantity,
            Price,
            Currency,
            Height,
            Width,
            Depth,
            UnitOfMeasure
        };

    entity Currency      as
        select from user0090.Currency {
            ID as CurrencyID,
            Description
        };

    entity UnitOfMeasure as
        select from user0090.UnitOfMeasure {
            ID as UoMID,
            Description
        };

    entity Status        as
        select from user0090.Status {
            ID as StatusID,
            Description
        };

}
