package shopping.member.model ;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.MediaSize.Other;

import shopping.common.model.SuperDao;

public class MemberDao extends SuperDao {
	
public Member SelectData(String id, String password) {
		
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		Member bean = null;
		
		String sql = " select * from members";
		sql += " where id = ? and password = ?";
		
		try {
			if(conn == null) {conn = super.getConnection();}
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, id);
			pst.setString(2, password);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				
				bean = new Member();
				
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setPassword(rs.getString("password"));
				bean.setBirth(String.valueOf(rs.getDate("birth")));
				bean.setEmail(rs.getString("email"));
				bean.setGender(rs.getString("gender"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setPhonenumber(rs.getString("phonenumber"));
				bean.setRoadaddress(rs.getString("roadaddress"));
				bean.setExtraaddress(rs.getString("extraaddress"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pst != null) {pst.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return bean;
		
	}
	
	public int InsertData(Member bean) {
		
		PreparedStatement pst = null;
		
		int cnt = -99999;
		
		String sql = " insert into members(id, name, password, birth, email, zipcode, address1, address2, gender, phonenumber, roadaddress, extraaddress)";
		sql += " values(?, ?, ?, to_date(?, 'yyyy/mm/dd'), ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			if(conn == null) {conn = super.getConnection();}
			conn.setAutoCommit(false);
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, bean.getId());
			pst.setString(2, bean.getName());
			pst.setString(3, bean.getPassword());
			pst.setString(4, bean.getBirth());
			pst.setString(5, bean.getEmail());
			pst.setString(6, bean.getZipcode());
			pst.setString(7, bean.getAddress1());
			pst.setString(8, bean.getAddress2());
			pst.setString(9, bean.getGender());
			pst.setString(10, bean.getPhonenumber());
			pst.setString(11, bean.getRoadaddress());
			pst.setString(12, bean.getExtraaddress());
			
			cnt = pst.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pst != null) {pst.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}

	public int UpdateData( Member bean ){
		String sql = " update members set password = ?, phonenumber = ?, email = ?, zipcode = ?, address1 = ?, address2 = ? roadaddress = ?, extraaddress = ?" ; 
		sql += " where id = ?" ;

		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getPassword());
			pstmt.setString(2, bean.getPhonenumber());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getZipcode());
			pstmt.setString(5, bean.getAddress1());
			pstmt.setString(6, bean.getAddress2());
			pstmt.setString(7, bean.getId());
			pstmt.setString(8, bean.getRoadaddress());
			pstmt.setString(9, bean.getExtraaddress());
			
			cnt = pstmt.executeUpdate();
			conn.commit(); 
		} catch (Exception e) {
			SQLException err = (SQLException)e;
			cnt = - err.getErrorCode();
			e.printStackTrace();
			try {
				conn.rollback(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally{
			try {
				if( pstmt != null ){pstmt.close();}
				super.closeConnection(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
	}
	public int DeleteData( String id ){
		String sql;
		
		PreparedStatement pstmt = null;
		Member bean = null;
		int cnt = -99999;
		
		try {
			bean = this.SelectDataByPk(id);
			
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			
//			// step01 : 게시물 테이블 remark 컬럼 수정하기
//			sql = " update boards set remark = ?  " ;
//			sql += " where writer = ? " ;
//			pstmt = super.conn.prepareStatement(sql) ;
//			
			String imsi = bean.getName() +  "(" + id + ")가 회원 탈퇴를 하였습니다." ;
//			pstmt.setString(1, imsi);
//			pstmt.setString(2, id);
//			
//			cnt = pstmt.executeUpdate() ;
//			if(pstmt != null) {pstmt.close();}
//			
			// step02 : 매출 테이블 remark 컬럼 수정하기
			sql = " update orders set remark = ? " ;
			sql += " where mid = ? " ;
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setString(1, imsi);			
			pstmt.setString(2, id);
			
			cnt = pstmt.executeUpdate() ;
			if(pstmt != null) {pstmt.close();}
			
			// step03 : 회원 테이블 행 삭제하기
			sql = " delete from members" ;
			sql += " where id = ? " ;
			
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setString(1, id);
			
			cnt = pstmt.executeUpdate() ;
			if(pstmt != null) {pstmt.close();}
			
			conn.commit(); 
		} catch (Exception e) {
			SQLException err = (SQLException)e ;
			cnt = - err.getErrorCode() ;
			e.printStackTrace();
			try {
				conn.rollback(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally{
			try {
				if( pstmt != null ){ pstmt.close(); }
				super.closeConnection(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
	}
	
	public List<Member> SelectDataList(int beginRow, int endRow) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;

		String sql = " select * from members"; 
		sql += " order by name asc";
		
		List<Member> lists = new ArrayList<Member>();
		try {
			if( conn == null ){ super.conn = super.getConnection(); }
			pstmt = super.conn.prepareStatement(sql);
			
//			pstmt.setInt(1, beginRow);
//			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery() ;
			
			while( rs.next() ){
				Member bean = new Member();
				
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setBirth(String.valueOf(rs.getDate("birth")));
				bean.setGender(rs.getString("gender"));
				bean.setEmail(rs.getString("email"));
				bean.setPhonenumber(rs.getString("phonenumber"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setRoadaddress(rs.getString("roadaddress"));
				bean.setExtraaddress(rs.getString("extraaddress"));
				
				lists.add( bean ) ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if( rs != null ){ rs.close(); }
				if( pstmt != null ){ pstmt.close(); }
				super.closeConnection(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lists ;
	}
	
	public MemberDao() {}
	
	public Member SelectDataByPk(String id) {
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		Member bean = null;
		
		String sql = " select * from members";
		sql += " where id = ?";
		
		try {
			if(conn == null) {conn = super.getConnection();}
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, id);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				
				bean = new Member();
				
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setPassword(rs.getString("password"));
				bean.setBirth(rs.getString("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGender(rs.getString("gender"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setPhonenumber(rs.getString("phonenumber"));
				bean.setRoadaddress(rs.getString("roadaddress"));
				bean.setExtraaddress(rs.getString("extraaddress"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pst != null) {pst.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		return bean;
	}
	public int SelectTotalCount() {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " ";
		sql += " " ;
		sql += " " ;

		
		int cnt = -99999 ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }
			pstmt = this.conn.prepareStatement(sql) ; 
			rs = pstmt.executeQuery() ; 
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if( rs != null){ rs.close();}
				if( pstmt != null){ pstmt.close();}
				this.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
}
