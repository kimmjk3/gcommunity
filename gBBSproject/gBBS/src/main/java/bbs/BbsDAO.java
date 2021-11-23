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

    public String getDate() {
        String SQL = "SELECT NOW()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";// 데이터베이스 오류
    }

    // 다음글의 번호 가져오기
    public int getNext() {
        String SQL = "SELECT post_Number FROM POST_TB ORDER BY post_Number DESC"; // 내림차순이기때문에 마지막글에쓴글이 제일 위에 뜸
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1; // 다음게시물(현재글보다 bbsID가 낮은글)번호 리턴
            }
            return 1; // 끝까지 돌았을 경우 내가 유일한거니까 1 리턴
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    // 글쓰기
    public int write(String POST_TITLE, String userID, String bbsContent) {
        String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, bbsTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, bbsContent);
            pstmt.setInt(6, 1); // available. 첫글을썼을땐 true
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}