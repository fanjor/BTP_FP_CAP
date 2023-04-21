using SalesOrderService as service from '../../srv/customer-service';

// Header view:
annotate service.Header with @(
    // selection fields
    UI.SelectionFields: [
        Email,
        FirstName,
        LastName
    ],
    // columns of the list view
    UI.LineItem  : [
        {
            $Type: 'UI.DataField',
            Label: 'Email',
            Value: Email
        },
        {
            $Type: 'UI.DataField',
            Label: 'First Name',
            Value: FirstName
        },
        {
            $Type: 'UI.DataField',
            Label: 'Last Name',
            Value: LastName
        },
        {
            $Type: 'UI.DataField',
            Label: 'Country',
            Value: Country
        },
        {
            $Type: 'UI.DataField',
            Label: 'Create On',
            Value: CreateOn
        },
        {
            $Type: 'UI.DataField',
            Label: 'Status',
            Value: OrderStatus_ID
        },
    ],
    // title
    UI.HeaderInfo: {
        TypeName      : 'Sales Order',
        TypeNamePlural: 'Sales Orders'
    },
    // facet
    //UI.Facets: {
    //    $Type : 'UI.ReferenceFacet',
    //    ID    : 'GeneratedFacet1',
    //    Label : 'General Information',
    //    Target: '@UI.FieldGroup#GeneratedGroup1',
    //    $value: 
    //},
    // facet for the items table
    HeaderFacets : [{
        $Type : 'UI.ReferenceFacet',
        Target: 'Items/@UI.LineItem'
    }]
);

//Items view:
annotate service.Header with @(UI: {
    HeaderInfo        : {Description: {Value: LastName}},
    HeaderFacets      : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Header'
    }, ],
    Facets            : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Items'
    }],
    FieldGroup #Header: {Data: [{Value: Email}, ]},
    FieldGroup #Items : {Data: [{Value: LastName}, ]},
});

annotate service.Items with @(
    // items table
    UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Sales Order ID',
        Value: 'Header.ID'
    },
    {
        $Type: 'UI.DataField',
        Label: 'Item Name',
        Value: 'Name'
    },
    {
        $Type: 'UI.DataField',
        Label: 'Description',
        Value: 'Description'
    },
    {
        $Type: 'UI.DataField',
        Label: 'Release Date',
        Value: 'ReleaseDate'
    },
    {
        $Type: 'UI.DataField',
        Label: 'Price',
        Value: 'Price'
    },
    {
        $Type: 'UI.DataField',
        Label: 'Currency',
        Value: 'Currency'
    }
    ],
    // title
    UI.HeaderInfo: {
        TypeName      : 'Sales Order Item',
        TypeNamePlural: 'Sales Order Items'
    },
);