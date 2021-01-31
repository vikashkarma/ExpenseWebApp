<html>

<body bgcolor="#ccccdd">
<%
String acno=(String)session.getAttribute("sess");
                                    System.out.println(acno);
                                    %>
<center>
<a href="debit.html">Debit the Amount</a><br>
<a href="credit.html">Credit the Amount</a><br>
<a href="month.jsp">Monthly Record</a><br>
</center>
</body>
</html>
Credit Design Page
//credit.html
<html>
<Head> <center>Welcome to the credit page</center></head>
<form action="credit.jsp">
<body bgcolor="#ccccdd"><center><table>
<tr><td>Enter the Account NO</td><td><input type="text" name="ac"></td></tr>
<tr><td>Enter the Amount</td><td><input type="text" name="amnt"></td></tr>
<tr><td><input type="submit" value="credit"></tr></td></table></center>
</body>
</form>
</html>