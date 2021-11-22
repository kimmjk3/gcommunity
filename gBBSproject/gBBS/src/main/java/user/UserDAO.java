package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private Connection conn; // 자바와 데이터베이스 연결
    private PreparedStatement pstmt; // 쿼리문 대기 및 설정
    private ResultSet rs; // 결과값 받기

    // 데이터베이스 이클립스 연결
    public UserDAO() {
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

    // 로그인
    public int login(String user_ID, String user_PW) {
        String SQL = "SELECT user_PW FROM USER_TB WHERE user_ID = ?";
        try {
            pstmt = conn.prepareStatement(SQL); // 쿼리문을 저장하고
            pstmt.setString(1, user_ID); // 저장한 쿼리문 마지막 첫번째 물음표1번에다가 user_ID=유저가 입력한값을 넣고
            rs = pstmt.executeQuery(); // 위에 다 더한 값에 답을 rs에다가 저장함 =비밀번호 나올거임
            if (rs.next()) { // rs 값이 있다면=id가 존재하면 그아이디에 비밀번호가 있다면
                if (rs.getString(1).equals(user_PW)) { // rs 값을 스트링으로 표현한 값이랑 입력한 비밀번호가 같다면

                    // 아이디 상태 체크 =정지 탈퇴한 아이디 구별
                    String sql1 = "SELECT user_State FROM USER_TB WHERE user_ID = ?";
                    try {
                        pstmt = conn.prepareStatement(sql1);
                        pstmt.setString(1, user_ID);
                        rs = pstmt.executeQuery();
                        if (rs.next()) {
                            if (rs.getInt(1) == (1)) {
                                return 1;
                            } else {
                                return -3; // 활동이 아닌 경우 정지,탈퇴 한 아이디
                            }
                        } else {
                            return -3; // 아마 일로 오게되면 데이터베이스 오류일듯함 유저상태가 not null이니 올수가 없음 필요없는 값
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    return 0; // 다르다면 비밀번호 불일치
                }
            } else {
                return -1; // 아이디가 없음
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -2; // 데이터베이스 오류
    }

    // 회원가입
    public int join(User user_ID) {
        String SQL = "insert into user_tb values(null,?,?,?,?,?,?,?,?,default,null,1,1)";
        try {
            pstmt = conn.prepareStatement(SQL);
            // pstmt.setString(1, null); //가로안에 순서가아니라 그냥 물음표 자체로 순서였음
            pstmt.setString(1, user_ID.getUser_ID()); // 물음표 1번째 넣는다 user_ID.getUser_ID() 에 저장된값을
            pstmt.setString(2, user_ID.getUser_PW());
            pstmt.setString(3, user_ID.getUser_Name());
            pstmt.setString(4, user_ID.getUser_NickName());
            pstmt.setString(5, user_ID.getUser_Gender());
            pstmt.setString(6, user_ID.getUser_DOB());
            pstmt.setString(7, user_ID.getUser_Email());
            pstmt.setString(8, user_ID.getUser_PhoneNumber());
            // pstmt.setString(10, null);
            // pstmt.setString(11, null);
            // pstmt.setLong(12, 1);
            // pstmt.setLong(13, 1);

            return pstmt.executeUpdate(); // 위 다 대입한다음에 마지막으로 쿼리문 실행 반환
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 쿼리문 이 정상작동이 안되면 -1값만 반환
    }

    // 아이디중복 체크 시파
    public int joinIdCheck(String user_ID) {
        String sql = "select user_id from user_tb where user_id = ?";
        try {
            pstmt = conn.prepareStatement(sql); // 쿼리문을 저장하고
            pstmt.setString(1, user_ID); // 저장한 쿼리문 마지막 첫번째 물음표1번에다가 user_ID=유저가 입력한값을 넣고
            rs = pstmt.executeQuery(); // 위에 다 더한 값에 답을 rs에다가 저장함 =비밀번호 나올거임
            if (rs.next()) { // rs 값이 있다면=id가 존재하면 그아이디에 비밀번호가 있다면
                return 1; // 값이 나왔으니 중복이란 소리임
            } else {
                return 2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 2; // 데이터 베이스 에 아무것도 안떳다는거니깐 중복아님
    }

    // 닉네임중복 체크 시파
    public int joinNickCheck(String user_NickName) {
        String sql = "select user_NickName from user_tb where user_NickName = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_NickName);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return 1;
            } else {
                return 2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 2;
    }

    // 이메일중복 체크
    public int joinEmailCheck(String user_Email) {
        String sql = "select user_Email from user_tb where user_Email = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_Email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return 1;
            } else {
                return 2;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 2;
    }

}