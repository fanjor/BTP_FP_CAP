sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.user0090.salesorder',
            componentId: 'HeaderList',
            entitySet: 'Header'
        },
        CustomPageDefinitions
    );
});