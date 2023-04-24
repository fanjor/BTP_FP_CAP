const cds = require("@sap/cds");
const { header } = require("express/lib/response");
const { SaleOrders } = cds.entities("com.user0090");

module.exports = (srv) => {

    //******** READ ********//
    srv.on("READ", "Header", async (req) => {
        return await SELECT.from(SaleOrders);
    } );


    //******** ACTION Delete Order ********//
    srv.on("deleteOrder", async (req) => {
        const { salesID } = req.data;
        const db = srv.transaction(req);

        // const resultsRead = await db
        //   .read(header, ["HeaderID", "Email", "FirstName", "LastName", "OrderStatus"])
        //   .where({ salesID: header});

        let returnOrder = { status: "", message: "" };

        console.log(salesID);
        console.log(resultsRead);

        // if (resultsRead[0].OrderStatus == 3){
        //     returnOrder.status = "Fail";
        //     returnOrder.message = 'The order placed by ${resultsRead[0].FirstName} ${resultsRead[0].LastName} is already Canceled';
        // } else {
        //     const resultsUpdate = await db
        //     .update(Header)
        //     .set({ OrderStatus: 3 })
        //     .where({ salesID: ID});

        //     returnOrder.status = "Success";
        //     returnOrder.message = 'The order placed by ${resultsRead[0].FirstName} ${resultsRead[0].LastName} was Canceled';
        // }

        console.log("Action deleteOrder executed");
        return returnOrder;
    } );
}