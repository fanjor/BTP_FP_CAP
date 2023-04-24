using salesservice as service from '../../srv/sales-service';

////////////////////////////////////////////////////////////////////////////
//
// UI annotations for the Header Entity
//
////////////////////////////////////////////////////////////////////////////
annotate service.Header with @(
    //UI.UpdateHidden     : true,
    //UI.DeleteHidden     : false,
    //UI.CreateHidden     : false,

    UI.Identification   : [{Value: LastName}],

    // title
    UI.HeaderInfo       : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Sales Order', //'{i18n>SalesOrder}',  //'Sales Order',
        TypeNamePlural: 'Sales Orders', //'{i18n>SalesOrders}', //'Sales Orders',
        ImageUrl      : ImageURL,
        Title         : {
            $Type: 'UI.DataField',
            Value: LastName
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: FirstName
        }
    },

    // selection fields
    UI.SelectionFields  : [
        Email,
        FirstName,
        LastName
    ],

    // columns of the list view
    UI.LineItem         : [
        {
            $Type: 'UI.DataField',
            Label: 'Email', //'{i18n>Email}', //'Email',
            Value: Email
        //![@UI.Importance]: #High
        },
        {
            $Type: 'UI.DataField',
            Label: 'First Name', //'{i18n>FirstName}', //'First Name',
            Value: FirstName
        //![@UI.Importance]: #High
        },
        {
            $Type: 'UI.DataField',
            Label: 'Last Name', //'{i18n>LastName}', //'Last Name',
            Value: LastName
        //![@UI.Importance]: #High
        },
        {
            $Type: 'UI.DataField',
            Label: 'Country', //'{i18n>Country}', //'Country',
            Value: Country
        },
        {
            $Type: 'UI.DataField',
            Label: 'Create On', //'{i18n>CreateOn}', //'Create On',
            Value: CreateOn
        },
        {
            $Type: 'UI.DataField',
            Label: 'Delivery Date', //'{i18n>DeliveryDate}', //'Delivery date',
            Value: DeliveryDate
        },
        {
            $Type: 'UI.DataField',
            Label: 'Status', //'{i18n>OrderStatus}', //'Status',
            Value: OrderStatus_ID
        },
        {
            $Type: 'UI.DataField',
            Label: 'Image', //'{i18n>ImageURL}', //'Image URL',
            Value: ImageURL
        },
    ],

    // facet for the table
    UI.HeaderFacets     : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Item' //'Items/@UI.LineItem'  '@UI.FieldGroup#Item'
    }],

    // facets
    UI.Facets           : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'SalesOrderItems',
        Target: '@UI.LineItem', // 'Items/@UI.LineItem',  //'@UI.FieldGroup#Items',  //** */ 'itemdata/@UI.LineItem',  '@UI.FieldGroup#Items',
        Label : 'Products'
    }],

    //UI.DataPoint #SOName: {
    //    Value: LastName,
    //    Title: 'Sales Order'
    //},

    UI.FieldGroup #Item : {Data: [{
        $Type: 'UI.DataField',
        Value: Email
    }]},

    UI.FieldGroup #Items: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: FirstName,
                Label: 'First Name'
            },
            {
                $Type: 'UI.DataField',
                Value: LastName,
                Label: 'Last Name'
            }
        ]
    },
);


annotate service.Header with {
    HeaderID    @(
        title    : 'Sales Order ID',
        UI.Hidden: true
    )  @readonly;
    Email       @(title: 'Email');
    LastName    @(
        title: 'Last Name',
        UI.MultiLineText
    );
    FirstName   @(title: 'First Name');
    CreateOn    @(title: 'Create On');
    OrderStatus @(
        Common: {
            Text           : OrderStatus.Description,
            TextArrangement: #TextOnly,
            ValueListWithFixedValues,
            FieldControl   : #Mandatory
        },
        title : 'Status'
    );
};


// // Annotations for Search Help Status
// annotate service.Header with {
//     //Status
//     OrderStatus @(Common: {
//         Text     : {
//             $value                : OrderStatus,
//             ![@UI.TextArrangement]: #TextOnly,
//         },
//         ValueList: {
//             $Type         : 'Common.ValueListType',
//             CollectionPath: 'UnitOfMeasure',
//             Parameters    : [
//                 {
//                     $Type            : 'Common.ValueListParameterInOut',
//                     LocalDataProperty: OrderStatus_ID,
//                     ValueListProperty: 'UoMID'
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterInOut',
//                     LocalDataProperty: OrderStatus.Description,
//                     ValueListProperty: 'Description'
//                 }
//             ]
//         },
//     });
// };


///----------


////////////////////////////////////////////////////////////////////////////
//
// UI annotations for the Items Child Entity
//
////////////////////////////////////////////////////////////////////////////
annotate service.Items with @(UI: {
    //UpdateHidden     : false,
    //DeleteHidden     : false,
    //CreateHidden     : false,

    Identification   : [{Value: Name}],

    //Header Info
    HeaderInfo       : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Sales Order Item',
        TypeNamePlural: 'Sales Order Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: Name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description
        }
    },

    //Selection Fields
    SelectionFields  : [
        Name,
        Description
    ],

    //LineItem
    LineItem         : [
        {
            $Type: 'UI.DataField',
            Label: 'Product',
            Value: Name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: Description,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Release Date',
            Value: ReleaseDate
        },
        {
            $Type: 'UI.DataField',
            Label: 'Discontinued Date',
            Value: DiscontinuedDate
        },
        {
            $Type: 'UI.DataField',
            Label: 'Price',
            Value: Price
        },
        {
            $Type: 'UI.DataField',
            Label: 'Currency',
            Value: Currency_ID
        },
        {
            $Type: 'UI.DataField',
            Label: 'Quantity',
            Value: Quantity
        },
        {
            $Type: 'UI.DataField',
            Value: Width,
            Label: 'Width'
        },
        {
            $Type: 'UI.DataField',
            Value: Height,
            Label: 'Height'
        },
        {
            $Type: 'UI.DataField',
            Value: Depth,
            Label: 'Depth'
        },
        {
            $Type: 'UI.DataField',
            Value: UnitOfMeasure_ID,
            Label: 'Unit Of Measure'
        },
    ],

    //Header Facets
    HeaderFacets     : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Item'
    }],

    //Facets
    Facets           : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'SOItems',
        Target: '@UI.FieldGroup#Items',
        Label : 'Details'
    }],

    FieldGroup #Item : {Data: [{
        $Type: 'UI.DataField',
        Value: ItemID
    //Criticality : status.criticality
    }]},

    FieldGroup #Items: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Quantity,
                Label: 'Quantity'
            },
            {
                $Type: 'UI.DataField',
                Value: Width,
                Label: 'Width'
            },
            {
                $Type: 'UI.DataField',
                Value: Height,
                Label: 'Height'
            },
            {
                $Type: 'UI.DataField',
                Value: Depth,
                Label: 'Depth'
            },
            {
                $Type: 'UI.DataField',
                Value: UnitOfMeasure_ID,
                Label: 'Unit Of Measure'
            }
        ]
    },
});


annotate service.Items with {
    ItemID      @(
        title    : 'Item ID',
        UI.Hidden: true
    )  @readonly;
    HeaderID    @(
        title    : 'Sales Order ID',
        UI.Hidden: true
    );
    Name        @(title: 'Product');
    Description @(
        title: 'Description',
        UI.MultiLineText
    );

    // assignedTo       @(
    //     Common : {
    //         Text            : assignedTo.member_name,
    //         TextArrangement : #TextOnly,
    //         ValueListWithFixedValues,
    //         FieldControl    : #Mandatory,
    //         ValueList       : {
    //             $Type          : 'Common.ValueListType',
    //             CollectionPath : 'Member',
    //             Parameters     : [
    //                 {
    //                     $Type             : 'Common.ValueListParameterOut',
    //                     LocalDataProperty : 'assignedTo_ID',
    //                     ValueListProperty : 'ID'
    //                 },
    //                 {
    //                     $Type             : 'Common.ValueListParameterIn',
    //                     LocalDataProperty : 'parent_ID',
    //                     ValueListProperty : 'parent_ID'
    //                 },
    //                 {
    //                     $Type             : 'Common.ValueListParameterDisplayOnly',
    //                     ValueListProperty : 'member_name'
    //                 }
    //             ]
    //         }
    //     },
    //     title  : 'Assigned To'
    // );

    Quantity    @(title: 'Quantity');

// status           @(
//     Common : {
//         Text            : status.name,
//         TextArrangement : #TextOnly,
//         ValueListWithFixedValues,
//         FieldControl    : #Mandatory
//     },
//     title  : 'Status'
// );
};

// annotate service.Activity @(Capabilities : {
//     SearchRestrictions : {
//         $Type      : 'Capabilities.SearchRestrictionsType',
//         Searchable : true
//     },
//     Insertable         : true,
//     Deletable          : true,
//     Updatable          : true
// });


// Currency
annotate service.Currency with @(UI: {

    Identification : [{Value: Description}],

    //Header Info
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Currency',
        TypeNamePlural: 'Currencies',
        Title         : {
            $Type: 'UI.DataField',
            Value: CurrencyID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description
        }
    },

    //Selection Fields
    SelectionFields: [CurrencyID],

    //LineItem
    LineItem       : [
        {
            $Type: 'UI.DataField',
            Label: 'ID',
            Value: CurrencyID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: Description,
        },
    ],
});


// Unit of Measure
annotate service.UnitOfMeasure with @(UI: {

    Identification : [{Value: Description}],

    //Header Info
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Unit of Measure',
        TypeNamePlural: 'Unit of Measures',
        Title         : {
            $Type: 'UI.DataField',
            Value: UoMID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description
        }
    },

    //Selection Fields
    SelectionFields: [UoMID],

    //LineItem
    LineItem       : [
        {
            $Type: 'UI.DataField',
            Label: 'ID',
            Value: UoMID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: Description,
        },
    ],
});


// Status
annotate service.Status with @(UI: {

    Identification : [{Value: Description}],

    //Header Info
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Unit of Measure',
        TypeNamePlural: 'Unit of Measures',
        Title         : {
            $Type: 'UI.DataField',
            Value: StatusID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description
        }
    },

    //Selection Fields
    SelectionFields: [StatusID],

    //LineItem
    LineItem       : [
        {
            $Type: 'UI.DataField',
            Label: 'ID',
            Value: StatusID,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: Description,
        },
    ],
});

// ///----------


// Annotations for Search Help Currency
annotate service.Items with {
    //Currency
    Currency @(Common: {
        Text     : {
            $value                : Currency_ID,
            ![@UI.TextArrangement]: #TextOnly,
        },
        ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Currency',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Currency_ID,
                    ValueListProperty: 'CurrencyID'
                },
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Currency.Description,
                    ValueListProperty: 'Description'
                }
            ]
        },
    });
};


// Annotations for Search Help UofM
annotate service.Items with {
    //Unit of Measure
    UnitOfMeasure @(Common: {
        Text     : {
            $value                : UnitOfMeasure_ID,
            ![@UI.TextArrangement]: #TextOnly,
        },
        ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'UnitOfMeasure',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: UnitOfMeasure_ID,
                    ValueListProperty: 'UoMID'
                },
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: UnitOfMeasure.Description,
                    ValueListProperty: 'Description'
                }
            ]
        },
    });
};


// //Items view:
// annotate service.Header with @(UI: {
//     HeaderInfo        : {Description: {Value: Email}},
//     HeaderFacets      : [{
//         $Type : 'UI.ReferenceFacet',
//         Target: '@UI.FieldGroup#Header'
//     }, ],
//     //Facets            : [{
//     //    $Type : 'UI.ReferenceFacet',
//     //    Target: '@UI.FieldGroup#Items'
//     //}],
//     FieldGroup #Header: {Data: [
//         {Value: LastName},
//         {Value: FirstName},
//     ]},
// //FieldGroup #Items : {Data: [{Value: Items}, ]},
// });

// // annotate service.Items with @(
// //     items table
// //     UI.FieldGroup #GeneratedGroup1 : {
// //        $Type : 'UI.FieldGroupType',
// //        Data  : [
// //     UI.LineItem  : [
// //         {
// //             $Type: 'UI.DataField',
// //             Label: 'Sales Order ID',
// //             Value: 'Header.ID'
// //         },
// //         {
// //             $Type: 'UI.DataField',
// //             Label: 'Item Name',
// //             Value: 'Name'
// //         },
// //         {
// //             $Type: 'UI.DataField',
// //             Label: 'Description',
// //             Value: 'Description'
// //         },
// //         {
// //             $Type: 'UI.DataField',
// //             Label: 'Release Date',
// //             Value: 'ReleaseDate'
// //         },
// //         {
// //             $Type: 'UI.DataField',
// //             Label: 'Price',
// //             Value: 'Price'
// //         },
// //         {
// //             $Type: 'UI.DataField',
// //             Label: 'Currency',
// //             Value: 'Currency'
// //         }
// //     ],

// //     title
// //     UI.HeaderInfo: {
// //         TypeName      : 'Sales Order Item',
// //         TypeNamePlural: 'Sales Order Items'
// //     },
// // );

// annotate service.Items with @(
//     //UI.LineItem  : [
//     UI.FieldGroup #GeneratedGroup1: {
//         $Type: 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'Product',
//                 Value: Name,
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'Description',
//                 Value: Description,
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'Release Date',
//                 Value: 'ReleaseDate'
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'Discontinued Date',
//                 Value: 'DiscontinuedDate'
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'Price',
//                 Value: 'Price'
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'Currency',
//                 Value: 'Currency'
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'Quantity',
//                 Value: 'Quantity'
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Label: 'Unit Of Measure',
//                 Value: 'UoMID'
//             },
//         ],
//     },

//     UI.Facets                     : [{
//         $Type : 'UI.ReferenceFacet',
//         ID    : 'GeneratedFacet1',
//         Label : 'Sales Order', // '{i18n>GeneralInformation}',
//         Target: '@UI.FieldGroup#GeneratedGroup1',
//     }
//     //{
//     //    $Type  : 'UI.ReferenceFacet',
//     //    ID     : 'GeneratedFacet2',
//     //    Label  : 'Items',  // '{i18n>GeneralInformationCopy}',
//     //    Target : '@UI.FieldGroup#GeneratedGroup1',
//     //}
//     ],

//     //title
//     UI.HeaderInfo                 : {
//         TypeName      : 'Sales Order Item',
//         TypeNamePlural: 'Sales Order Items'
//     },

//     // selection fields
//     UI.SelectionFields            : [
//         Name,
//         Description
//     ],

//     // facet for the items table
//     HeaderFacets      : [{
//         $Type : 'UI.ReferenceFacet',
//         Target: '@UI.LineItem'
//     }]
// );
