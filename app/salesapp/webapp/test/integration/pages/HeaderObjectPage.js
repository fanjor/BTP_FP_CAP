sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.user0090.salesapp',
            componentId: 'HeaderObjectPage',
            entitySet: 'Header'
        },
        CustomPageDefinitions
    );
});