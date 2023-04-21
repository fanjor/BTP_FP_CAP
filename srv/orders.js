const cds = require("@sap/cds");
const { SaleOrders } = cds.entities("com.user0090");

module.exports = (srv) => {

    //******** READ ********//
    srv.on("READ", "Header", async (req) => {
        return await SELECT.from(SaleOrders);
    } );
}