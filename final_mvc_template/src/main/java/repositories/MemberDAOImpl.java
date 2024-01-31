package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.MemberVO;
import util.DBCPUtil;

public class MemberDAOImpl implements MemberDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	@Override
	public boolean memberJoin(MemberVO member) {
		conn = DBCPUtil.getConnection();
		String sql = "INSERT INTO mvc_member(id,pass,name,age,gender) "
					+" VALUES(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getGender());
			
			int result = pstmt.executeUpdate();
			if(result == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {}
			
			try {
				if(conn != null) conn.close();
			} catch (SQLException e) {}
		}
		return false;
	}

	@Override
	public MemberVO memberLogin(String id, String pass) {
		MemberVO member = null;
		conn = DBCPUtil.getConnection();
		String sql = "SELECT * FROM mvc_member "
				 + " WHERE id = ? AND pass = ? AND joinYN != 'N' ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO(
					rs.getInt(1),				// num
					rs.getString(2),			// id
					rs.getString(3),			// pass
					rs.getString(4),			// name
					rs.getInt(5),				//	age
					rs.getString(6),			// gender
					rs.getString(7).charAt(0),	// joinYN
					rs.getTimestamp(8),			// regdate
					rs.getTimestamp(9)			// updatedate
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return member;
	}

	@Override
	public boolean memberUpdate(MemberVO member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberVO getMemberById(String id) {
		MemberVO member = null;
		conn = DBCPUtil.getConnection();
		String sql = "SELECT * FROM mvc_member WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO(
					rs.getInt(1),				// num
					rs.getString(2),			// id
					rs.getString(3),			// pass
					rs.getString(4),			// name
					rs.getInt(5),				//	age
					rs.getString(6),			// gender
					rs.getString(7).charAt(0),	// joinYN
					rs.getTimestamp(8),			// regdate
					rs.getTimestamp(9)			// updatedate
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCPUtil.close(rs,pstmt,conn);
		}
		return member;
	}

	@Override
	public void withDrawMember(int num) {
		String sql = "UPDATE mvc_member SET joinYN = 'N' , updatedate = now() WHERE num = ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCPUtil.close(pstmt,conn);
		}

	}

	@Override
	public boolean checkMember(String id, String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void addPassCode(String id, String code) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean checkPassCode(String id, String code) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void changePass(String id, String pass) {
		// TODO Auto-generated method stub

	}

}
