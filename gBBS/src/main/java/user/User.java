package user;

public class User {
    private int user_Number; //회원번호
    
    private String user_ID;  //아이디
    private String user_PW;  //비밀번호
    private String user_Name;   //이름
    private String user_NickName;   //닉네임
    private String user_Gender; //성별
    private String user_DOB;    //생년월일
    private String user_Email;  //이메일
    private String user_PhoneNumber;    //휴대전화번호
    
    private String user_JoinDate;       //가입일
    private String user_SecessionDate;  //탈퇴일
    private int user_Authority; //권한 레벨 0:관리자 1: 유저,, 자동으로 1로
    private int user_State; // 활동상태 0:탈퇴 1:활동중 2:정지
    
    
    
    public int getUser_Number() {
        return user_Number;
    }
    public void setUser_Number(int user_Number) {
        this.user_Number = user_Number;
    }
    public String getUser_ID() {
        return user_ID;
    }
    public void setUser_ID(String user_ID) {
        this.user_ID = user_ID;
    }
    public String getUser_PW() {
        return user_PW;
    }
    public void setUser_PW(String user_PW) {
        this.user_PW = user_PW;
    }
    public String getUser_Name() {
        return user_Name;
    }
    public void setUser_Name(String user_Name) {
        this.user_Name = user_Name;
    }
    public String getUser_NickName() {
        return user_NickName;
    }
    public void setUser_NickName(String user_NickName) {
        this.user_NickName = user_NickName;
    }
    public String getUser_Gender() {
        return user_Gender;
    }
    public void setUser_Gender(String user_Gender) {
        this.user_Gender = user_Gender;
    }
    public String getUser_DOB() {
        return user_DOB;
    }
    public void setUser_DOB(String user_DOB) {
        this.user_DOB = user_DOB;
    }
    public String getUser_Email() {
        return user_Email;
    }
    public void setUser_Email(String user_Email) {
        this.user_Email = user_Email;
    }
    public String getUser_PhoneNumber() {
        return user_PhoneNumber;
    }
    public void setUser_PhoneNumber(String user_PhoneNumber) {
        this.user_PhoneNumber = user_PhoneNumber;
    }
    public String getUser_JoinDate() {
        return user_JoinDate;
    }
    public void setUser_JoinDate(String user_JoinDate) {
        this.user_JoinDate = user_JoinDate;
    }
    public String getUser_SecessionDate() {
        return user_SecessionDate;
    }
    public void setUser_SecessionDate(String user_SecessionDate) {
        this.user_SecessionDate = user_SecessionDate;
    }
    public int getUser_Authority() {
        return user_Authority;
    }
    public void setUser_Authority(int user_Authority) {
        this.user_Authority = user_Authority;
    }
    public int getUser_State() {
        return user_State;
    }
    public void setUser_State(int user_State) {
        this.user_State = user_State;
    }
    
    
}
