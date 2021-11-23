package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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

        // USER_ID값을 받아와 select하여 user_number값을 받아온다.
        int uN = 0; // select로 받아온 user_number를 저장하는 변수
        try {
            Statement stmt = null;
            String SQL2 = "SELECT USER_NUMBER FROM USER_TB WHERE USER_ID = '" + user_ID + "'";
            stmt = conn.createStatement();
            ResultSet rs2 = stmt.executeQuery(SQL2);
            while (rs2.next()) {
                uN = rs2.getInt(1);
            }

//            prepareStatement로 user_number값 받아오기 싫패
//            PreparedStatement pstmt2 = conn.prepareStatement(SQL2);
//            pstmt2.setString(1, user_ID);
//            ResultSet rs2 = pstmt2.executeQuery();
//            while (rs2.next()) {
//                uN = rs2.getInt(1);
//            }

            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, board_Number);
            pstmt.setString(2, post_Title);
            pstmt.setString(3, post_Contents);
            pstmt.setString(4, post_Category);
            pstmt.setInt(5, uN);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}