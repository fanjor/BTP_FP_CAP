using { com.user0090 as user0090 } from '../db/schema';

service SalesOrderService {

    entity SalesOrderHSrv as projection on user0090.Header;
    entity SalesOrderISrv as projection on user0090.Items;

}