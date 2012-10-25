<%-- 
    Document   : index
    Created on : 25 Oct, 2012, 4:29:52 AM
    Author     : ankur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="jquery-1.8.2.min.js"></script>
    </head>

    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#frmLogin").submit(function(e){
                var username=$("#txtUsername").val();
                var password=$("#txtPassword").val();
                
                $.post("GetData", {"username":username,"password":password}, function(data){
                    var result=data.val;                    
                    if(result=="true")
                        document.location.href="home.jsp";                
                    else if (result=="false")
                        $("#result").show();
                }, "json");
                e.preventDefault();
            });            
        });
    </script>
    
    <body>

        <form id="frmLogin" method="post">

            Enter username
            <input type="text" name="txtUsername" id="txtUsername" size="20">
            Enter password
            <input type="password" name="txtPassword" id ="txtPassword" size="20">

            <input type="submit" value="login"/>
            <input type="reset" value="reset"/>            
        </form>

        <div id="result" style="display: none;">
            cant log you in
        </div>
    </body>
</html>
