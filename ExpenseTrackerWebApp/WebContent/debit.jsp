<html>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%
		String amount = request.getParameter("amnt");
	int iamount = Integer.parseInt(amount);

	String acnt = request.getParameter("ac");
	int acno = Integer.parseInt(acnt);

	String type = "Debit";
	Calendar calendar = new GregorianCalendar();
	System.out.println("YEAR: " + calendar.get(Calendar.YEAR));
	System.out.println("MONTH: " + calendar.get(Calendar.MONTH));
	System.out.println("DATE: " + calendar.get(Calendar.DATE));
	String dor = String.valueOf(calendar.get(Calendar.DATE)) + "/" + String.valueOf(calendar.get(Calendar.MONTH)) + "/"
			+ String.valueOf(calendar.get(Calendar.YEAR));

	try {

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:ques");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from bank where Acno=" + acno);
		int totbal = 0;
		while (rs.next()) {
			int s1 = rs.getInt(5);
			if (s1 >= 500) {
		totbal = s1 - iamount;
		out.println("Amount is Debited successfully");
		out.println("Your balance is" + totbal);
			} else {
		out.println("Your balance is less than 500,You can't debit the amount");
		totbal = s1;
			}
		}
		PreparedStatement pstmt = con.prepareStatement("update bank set balance=? where Acno=" + acno);
		pstmt.setInt(1, totbal);
		int i = pstmt.executeUpdate();

		PreparedStatement pstmt1 = con.prepareStatement("insert into month values(?,?,?,?,?)");
		pstmt1.setString(1, dor);
		pstmt1.setInt(2, totbal);
		pstmt1.setInt(3, acno);
		pstmt1.setString(4, type);
		pstmt1.setInt(5, iamount);
		int i1 = pstmt1.executeUpdate();

	} catch (Exception e) {

	}
	%>

</html>