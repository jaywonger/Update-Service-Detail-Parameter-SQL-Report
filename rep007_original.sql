SELECT        TOP (100) PERCENT dbo.DEPARTMENTS.NAME AS DeptName, dbo.ORDERS.ORDER_ID, dbo.CLIENTS.LASTNAME, dbo.CLIENTS.FIRSTNAME, dbo.CLTDEPT.STATUS,
                          dbo.ORDERS.STARTDATE, dbo.ORDERS.ENDDATE, dbo.zVW_OrdersServiceDetail.TEXTVAL, dbo.zVW_OrdersServiceDetail.CODE, 
                         dbo.zVW_OrdersServiceDetail.NAME, dbo.FUNDERS.NAME AS FUNDER
FROM            dbo.DEPARTMENTS INNER JOIN
                         dbo.ORDERS INNER JOIN
                         dbo.CLTDEPT INNER JOIN
                         dbo.CLIENTS ON dbo.CLTDEPT.CLTVISITOR_ID = dbo.CLIENTS.CLIENT_ID ON dbo.ORDERS.DEPT_ID = dbo.CLTDEPT.DEPT_ID AND 
                         dbo.ORDERS.CLIENT_ID = dbo.CLTDEPT.CLTVISITOR_ID ON dbo.DEPARTMENTS.DEPT_ID = dbo.ORDERS.DEPT_ID INNER JOIN
                         dbo.FUNDERS ON dbo.ORDERS.FUNDER_ID = dbo.FUNDERS.FUNDER_ID LEFT OUTER JOIN
                         dbo.zVW_OrdersServiceDetail ON dbo.ORDERS.ORDER_ID = dbo.zVW_OrdersServiceDetail.ORDER_ID
WHERE        (dbo.DEPARTMENTS.NAME LIKE '%Home S%') AND (dbo.DEPARTMENTS.NAME <> 'Home Support BC') AND (dbo.ORDERS.ENDDATE IS NULL) AND 
                         (dbo.zVW_OrdersServiceDetail.TEXTVAL IS NULL) AND (dbo.CLTDEPT.STATUS = 'A') AND (NOT (dbo.FUNDERS.NAME LIKE '%client%')) AND 
                         (NOT (dbo.FUNDERS.NAME LIKE '%call%'))
ORDER BY DeptName, dbo.zVW_OrdersServiceDetail.NAME, dbo.CLIENTS.LASTNAME, dbo.CLIENTS.FIRSTNAME