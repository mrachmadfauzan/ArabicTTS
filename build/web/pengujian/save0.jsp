<%@page import="beans.MD5"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    Calendar calendar = Calendar.getInstance();
    Timestamp currentTimestamp = new java.sql.Timestamp(calendar.getTime().getTime());
    MD5 md5 = new MD5();
    String id = md5.create("" + currentTimestamp);
    String ip = request.getParameter("ip");
    String nama = request.getParameter("nama");
    String ans0 = request.getParameter("ans0");

    if (StringUtils.isNullOrEmpty(nama) || StringUtils.isNullOrEmpty(ans0)) {
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
            String query = "insert into pengujian(id,ip,nama,ans0)values(?,?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, ip);
            ps.setString(3, nama);
            ps.setString(4, ans0);
            updateQuery = ps.executeUpdate();
            if (updateQuery != 0) {
                //JOptionPane.showMessageDialog(null, "Berhasil Tambah Data");
                response.sendRedirect("pengujian1.jsp?id="+id);
            }

        } catch (Exception ex) {
            out.println("Koneksi bermasalah");
        } finally {
            ps.close();
            conn.close();
        }
    }
%>