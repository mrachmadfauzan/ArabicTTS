<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String ip = request.getParameter("ip");
    String text = request.getParameter("text");
    String q1 = request.getParameter("q1");
    String q2 = request.getParameter("q2");
    String q3 = request.getParameter("q3");
    String q4 = request.getParameter("q4");
    String q5 = request.getParameter("q5");
    String comment = request.getParameter("comment");

    if (StringUtils.isNullOrEmpty(q1) || StringUtils.isNullOrEmpty(q2) || StringUtils.isNullOrEmpty(q3)
            || StringUtils.isNullOrEmpty(q4) || StringUtils.isNullOrEmpty(q5)) {
        response.sendRedirect("index.jsp");
    } else {

//membuat variabel untuk nampung alamat untuk akses database nantinya.
        String url = "jdbc:mysql://localhost:3306/arabictts_rate";
//membuat koneksi ke database dengan jdbc
        Connection conn = null;
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        int updateQuery = 0;
        try {
            conn = DriverManager.getConnection(url, "root", "");
            String query = "insert into rate(user_ip,text,q1,q2,q3,q4,q5,comment)values(?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, ip);
            ps.setString(2, text);
            ps.setString(3, q1);
            ps.setString(4, q2);
            ps.setString(5, q3);
            ps.setString(6, q4);
            ps.setString(7, q5);
            ps.setString(8, comment);
            updateQuery = ps.executeUpdate();
            if (updateQuery != 0) {
                //JOptionPane.showMessageDialog(null, "Berhasil Tambah Data");
                response.sendRedirect("statistic.jsp");
            }

        } catch (Exception ex) {
            out.println("Koneksi bermasalah");
        } finally {
            ps.close();
            conn.close();
        }
    }
%>