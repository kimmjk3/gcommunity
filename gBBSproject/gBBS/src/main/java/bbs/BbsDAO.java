package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BbsDAO {
    private Connection conn; // 자바와 데이터베이스 연결
    private ResultSet rs; // 결과값 받기

    // 데이터베이스 이클립스 연결
    public BbsDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/gcommunity?characterEncoding=UTF-8&serverTimezone=UTC";
            String dbID = "root";
            String dbPassword = "oracle";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 글쓰기
    public int write(int board_Number, String post_Title, String post_Contents, String post_Category, String user_ID) {
        String SQL = "INSERT INTO POST_TB VALUES (null,?,?,?,?,default,null,null,default,default,?)";

        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, board_Number);
            pstmt.setString(2, post_Title);
            pstmt.setString(3, post_Contents);
            pstmt.setString(4, post_Category);
            pstmt.setInt(5, 1);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}