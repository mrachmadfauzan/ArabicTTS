<%@page import="beans.MD5"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    
    String id = request.getParameter("id");
    String ans8 = request.getParameter("ans8");

    if (StringUtils.isNullOrEmpty(id) || StringUtils.isNullOrEmpty(ans8)) {
        response.sendRedirect("pengujian0.jsp");
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
            String query = "update pengujian set ans8=? where id=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, ans8);
            ps.setString(2, id);
            updateQuery = ps.executeUpdate();
            if (updateQuery != 0) {
                //JOptionPane.showMessageDialog(null, "Berhasil Tambah Data");
                response.sendRedirect("pengujian9.jsp?id="+id);
            }

        } catch (Exception ex) {
            out.println("Koneksi bermasalah");
        } finally {
            ps.close();
            conn.close();
        }
    }
%>