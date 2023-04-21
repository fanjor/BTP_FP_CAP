sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/user0090/salesorder/test/integration/FirstJourney',
		'com/user0090/salesorder/test/integration/pages/HeaderList',
		'com/user0090/salesorder/test/integration/pages/HeaderObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeaderList, HeaderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/user0090/salesorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHeaderList: HeaderList,
					onTheHeaderObjectPage: HeaderObjectPage
                }
            },
            opaJourney.run
        );
    }
);