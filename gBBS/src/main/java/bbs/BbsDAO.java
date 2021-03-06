package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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

    // 다음글의 번호 가져오기
    public int getNext() {
        String SQL = "SELECT POST_NUMBER FROM POST_TB ORDER BY POST_NUMBER DESC"; // 내림차순이기때문에 마지막글에쓴글이 제일 위에 뜸
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

    /**
     * 글 목록
     * 
     * @param pageNumber
     * @return 글의 목록은 갯수가 동적으로 정해지기 때문에 ArrayList사용.
     */
    public ArrayList<Bbs> getList(int pageNumber) {
        // String SQL = "SELECT * FROM POST_TB WHERE POST_NUMBER < ? AND POST_DELETEDATE
        // IS NULL ORDER BY POST_NUMBER DESC LIMIT 10";
        String SQL = "SELECT POST_NUMBER, BOARD_NUMBER, POST_TITLE, POST_CONTENTS, POST_CATEGORY, POST_INPUTDATE, POST_CORRENT, POST_DELETEDATE, POST_RECOMMEND, POST_VIEWS, POST_WRITER, USER_ID, USER_NICKNAME "
                + "FROM USER_TB INNER JOIN POST_TB ON post_tb.POST_WRITER = USER_NUMBER "
                + "WHERE POST_NUMBER < ? AND POST_DELETEDATE IS NULL ORDER BY POST_NUMBER DESC LIMIT 10";

        ArrayList<Bbs> list = new ArrayList<Bbs>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Bbs bbs = new Bbs();
                // DB조회 결과로나온것을 순서대로 담아서 자바단으로 저장
                bbs.setPost_Number(rs.getInt(1));
                bbs.setBoard_Number(rs.getInt(2));
                bbs.setPost_Title(rs.getString(3));
                bbs.setPost_Contents(rs.getString(4));
                bbs.setPost_Category(rs.getString(5));
                bbs.setPost_InputDate(rs.getString(6));
                bbs.setPost_Corrent(rs.getString(7));
                bbs.setPost_DeleteDate(rs.getString(8));
                bbs.setPost_Recommend(rs.getInt(9));
                bbs.setPost_Views(rs.getInt(10));
                bbs.setPost_Writer(rs.getInt(11));
                bbs.setUser_ID(rs.getString(12));
                bbs.setUser_NickName(rs.getString(13));
                list.add(bbs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Bbs> getList(int board_Number, int pageNumber) {
        // String SQL = "SELECT * FROM POST_TB WHERE POST_NUMBER < ? AND POST_DELETEDATE
        // IS NULL ORDER BY POST_NUMBER DESC LIMIT 10";
        String SQL = "SELECT POST_NUMBER, BOARD_NUMBER, POST_TITLE, POST_CONTENTS, POST_CATEGORY, POST_INPUTDATE, POST_CORRENT, POST_DELETEDATE, POST_RECOMMEND, POST_VIEWS, POST_WRITER, USER_ID, USER_NICKNAME "
                + "FROM USER_TB INNER JOIN POST_TB ON post_tb.POST_WRITER = USER_NUMBER "
                + "WHERE board_number = ? AND POST_NUMBER < ? AND POST_DELETEDATE IS NULL ORDER BY POST_NUMBER DESC LIMIT 10";

        ArrayList<Bbs> list = new ArrayList<Bbs>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, board_Number);
            pstmt.setInt(2, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Bbs bbs = new Bbs();
                // DB조회 결과로나온것을 순서대로 담아서 자바단으로 저장
                bbs.setPost_Number(rs.getInt(1));
                bbs.setBoard_Number(rs.getInt(2));
                bbs.setPost_Title(rs.getString(3));
                bbs.setPost_Contents(rs.getString(4));
                bbs.setPost_Category(rs.getString(5));
                bbs.setPost_InputDate(rs.getString(6));
                bbs.setPost_Corrent(rs.getString(7));
                bbs.setPost_DeleteDate(rs.getString(8));
                bbs.setPost_Recommend(rs.getInt(9));
                bbs.setPost_Views(rs.getInt(10));
                bbs.setPost_Writer(rs.getInt(11));
                bbs.setUser_ID(rs.getString(12));
                bbs.setUser_NickName(rs.getString(13));
                list.add(bbs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * pageNumber에 해당하는 페이지를 출력해야하는지 판단
     * 
     * @param pageNumber
     * @return
     */
    public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM POST_TB WHERE POST_NUMBER < ? AND post_DeleteDate IS NULL ";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // 페이지 알고리즘
            rs = pstmt.executeQuery();
            while (rs.next()) { // 3까지 읽고 다음이 있기 때문에 true반환
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Bbs getBbs(int post_Number) {
        String SQL = "SELECT POST_NUMBER, BOARD_NUMBER, POST_TITLE, POST_CONTENTS, POST_CATEGORY, POST_INPUTDATE, POST_CORRENT, POST_DELETEDATE, POST_RECOMMEND, POST_VIEWS, POST_WRITER, USER_ID, USER_NICKNAME \r\n"
                + "                FROM USER_TB INNER JOIN POST_TB ON post_tb.POST_WRITER = USER_NUMBER WHERE POST_Number = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, post_Number);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Bbs bbs = new Bbs();
                // DB조회 결과로나온것을 순서대로 담아서 자바단으로 저장
                bbs.setPost_Number(rs.getInt(1));
                bbs.setBoard_Number(rs.getInt(2));
                bbs.setPost_Title(rs.getString(3));
                bbs.setPost_Contents(rs.getString(4));
                bbs.setPost_Category(rs.getString(5));
                bbs.setPost_InputDate(rs.getString(6));
                bbs.setPost_Corrent(rs.getString(7));
                bbs.setPost_DeleteDate(rs.getString(8));
                bbs.setPost_Recommend(rs.getInt(9));
                bbs.setPost_Views(rs.getInt(10));
                bbs.setPost_Writer(rs.getInt(11));
                bbs.setUser_ID(rs.getString(12));
                bbs.setUser_NickName(rs.getString(13));
                return bbs;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int update(int board_Number, String post_Title, String post_Contents, String post_Category,
            int post_Number) {
        String SQL = "UPDATE POST_TB SET POST_TITLE = ?, POST_CONTENTS = ? , BOARD_NUMBER = ?, POST_CATEGORY = ? ,POST_CORRENT = NOW() WHERE POST_NUMBER = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, post_Title);
            pstmt.setString(2, post_Contents);
            pstmt.setInt(3, board_Number);
            pstmt.setString(4, post_Category);
            pstmt.setInt(5, post_Number);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public int delete(int post_Number) {
        String SQL = "UPDATE POST_TB SET Post_DeleteDate = now() WHERE POST_NUMBER = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, post_Number);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}