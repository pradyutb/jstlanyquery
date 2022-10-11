<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Any query</title>
    </head>
    <body>        
        <div>
            Query: 
            <form action="query.jsp" method="post">
                <input type="text" name="val" value="">
                <input type="submit" value="Submit">
            </form>
            </div>
        <div>
            Update: 
            <form action="query.jsp" method="post">
                <input type="text" name="update_val" value="">
                <input type="submit" value="Submit">
            </form>
            </div>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
        ${param.val}
        <c:if test="${not empty param.update_val}">
            <sql:update dataSource = "myDatasource" var = "count">
                ${param.update_val}
            </sql:update>
        </c:if>
        <c:if test="${not empty param.val}">
        <sql:query var="codes" dataSource="myDatasource">
            ${param.val}
        </sql:query>
        <table border="1">
            <tr bgcolor='#99ff99'>
        <c:forEach var="colName" items="${codes.columnNames}">
            <td>${colName}</td>
        </c:forEach>
            </tr>
            <c:forEach var="row" items="${codes.rows}" varStatus="loop">
                <tr>                    
                    <c:forEach var="colName" items="${codes.columnNames}">                        
                        <td>${row[colName]}</td>
                    </c:forEach>                    
                </tr>                
            </c:forEach></table>
        </c:if>        
        
    </body>
</html>