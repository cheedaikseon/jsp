package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MemberVo;

import static util.OJDBCUtil.*;
import static util.OJDBCUtil.close;
import static util.OJDBCUtil.getConnection;

public class MemberDao {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private MemberDao() {}
	
	private static MemberDao dao; 
	
	public static MemberDao getInstance() {
		if(dao == null) {
			dao = new MemberDao();
		}
		return dao;
	}
	
	// 회원정보 db 입력 요청
	public boolean memberJoin(MemberVo member) {
		try {
			
			con = getConnection();
			String sql = "SELECT * FROM test_member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {return false;}
			
			sql ="INSERT INTO test_member VALUES(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getAddr());
			pstmt.setString(5, member.getPhone());
			
			int result = pstmt.executeUpdate();
			
			if(result > 0) {
				return true;
			}else {
				return false;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			close(rs);
			close(pstmt);
			close(con);
		}
	}
	
	// 로그인 정보 확인
	public MemberVo memberLogin(String id, String pass) {
		MemberVo member = null;
		
		try {
			con = getConnection();
			String sql = "SELECT * FROM test_member WHERE id=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member = new MemberVo();
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setAddr(rs.getString("addr"));
				member.setPhone(rs.getString("phone"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return member;
	}

	// id를 통해 회원 정보 확인 반환
	public MemberVo getMemberVo(String id) {
		MemberVo member = null;
		
		try {
			con = getConnection();
			String sql = "SELECT * FROM test_member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member = new MemberVo();
				member.setId(rs.getString(1));
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setAddr(rs.getString("addr"));
				member.setPhone(rs.getString("phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return member;
	}

	// 회원 정보 수정
	public boolean memberUpdate(MemberVo member) {
		boolean success = false;
		
		try {
			con = getConnection();
			String sql = "UPDATE test_member SET pass=?,name=?,addr=?,phone=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getPass());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getAddr());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getId());
			int result = pstmt.executeUpdate();
			
			if(result > 0) {
				success = true;
			}else {
				success = false;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			success= false;
		} finally {
			close(pstmt);
			close(con);
		}
		
		
		return success;
	}

	// 회원 정보 삭제
	public void deleteMember(String id) {
		
		con = getConnection();
		
		try {
			String sql = "DELETE FROM test_member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}		
	}
	
	
}






