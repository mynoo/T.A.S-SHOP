package shopping.review.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shopping.board.model.Board;
import shopping.common.model.SuperDao;
import shopping.product.model.Product;

public class ReviewDao extends SuperDao {

	
	
	public List<Review> SelectDataList(int pno) {
		// 해당 검색 조건에 맞는 모든 데이터를 조회합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from review " ;
		sql += " where pno = ?  " ;
		

		List<Review> lists = new ArrayList<Review>();
		
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, pno);
			
			rs = pstmt.executeQuery() ;	
			
			while( rs.next() ){
				Review bean = new Review();
				
				bean.setPno(rs.getInt("pno"));
				bean.setMid(rs.getString("mid"));				
				bean.setVnum(rs.getInt("vnum"));				
				bean.setVcomment(rs.getString("vcomment"));
				bean.setInputdate(rs.getString("inputdate"));
				
				lists.add(bean);
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
	
	
	
	
	
	
	
	
	
	

	public int InsertData(Review bean) {
		String sql = " insert into review " ;
		sql += " (" ;
		sql += " vnum, pno, mid, vcomment, inputdate" ;
		sql += " )" ;
		sql += " values" ;
		sql += " (" ;
		sql += " seqreview.nextval, ?, ?, ?, default" ;
		sql += " )" ;		
		
		
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			
			pstmt = null ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getPno());
			pstmt.setString(2, bean.getMid());
			pstmt.setString(3, bean.getVcomment());			
			
			cnt = pstmt.executeUpdate() ; 
			
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









	public int DeleteData(int vnum) {
			String sql = " delete from review " ;
			sql += " where vnum = ? " ;

			
			PreparedStatement pstmt = null ;
			int cnt = -99999 ;
			try {
				if( conn == null ){ super.conn = super.getConnection() ; }
				conn.setAutoCommit( false );
				pstmt = super.conn.prepareStatement(sql) ;
				
				pstmt.setInt(1, vnum);
				
				cnt = pstmt.executeUpdate() ; 
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











	public Review SelectDataByPk(int vnum) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;	
		
		String sql = " select * from review " ;
		sql += " where vnum = ? " ;
		
		Review bean = null ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;			
			
			pstmt.setInt(1, vnum);
			
			rs = pstmt.executeQuery() ; 
			
			if ( rs.next() ) { 
				bean = new Review(); 
				
				bean.setPno(rs.getInt("pno"));
				bean.setMid(rs.getString("mid"));
				bean.setVcomment(rs.getString("vcomment"));
				bean.setVnum(vnum);
				bean.setInputdate(rs.getString("inputdate"));
				
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			try {
				if( rs != null){ rs.close(); } 
				if( pstmt != null){ pstmt.close(); } 
				this.closeConnection() ;
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		} 		
		return bean  ;
	}











	public int UpdateData(Review bean) {
		String sql = " update review set vcomment=? " ;
		sql += " where vnum = ? " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;

			pstmt.setString(1, bean.getVcomment());
			pstmt.setInt(2, bean.getVnum());
						
			cnt = pstmt.executeUpdate() ; 
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

	
	
	
	
	
	
	
	
	public List<Review> SelectDataList( int beginRow, int endRow, String mode, String keyword, int pno ) {
		// 해당 검색 조건에 맞는 모든 데이터를 조회합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select ranking, vnum, pno, mid, vcomment, inputdate " ;
		sql += " from ( select vnum, pno, mid, vcomment, inputdate, rank() over(order by vnum desc) as ranking " ;
		sql += " from review " ;
		
		if(mode.equalsIgnoreCase("all") ==false) { 
			System.out.println("not all search mode");
			sql += " where " + mode + " like '%" + keyword + "%' " ;	
		}
		
		sql += " where pno=? ) " ;
		sql += " where ranking between ? and ? and pno=? " ;	

		List<Review> lists = new ArrayList<Review>();
		
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, pno);
			pstmt.setInt(2, beginRow);
			pstmt.setInt(3, endRow);
			pstmt.setInt(4, pno);
			
			rs = pstmt.executeQuery() ;	
			
			while( rs.next() ){
				Review bean = new Review();
				
				bean.setVnum(rs.getInt("vnum"));
				bean.setPno(rs.getInt("pno"));
				bean.setMid(rs.getString("mid"));				
				bean.setVcomment(rs.getString("vcomment"));
				bean.setInputdate(String.valueOf(rs.getDate("inputdate")));
				
				lists.add(bean);
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
	
	
	public int SelectTotalCount(int pno ) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select count(*) as cnt from review " ;
		sql += " where pno = ? " ;
		
		
		int cnt = 0 ; //없는 경우의 기본 값
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;
			pstmt.setInt(1, pno);
			
			rs = pstmt.executeQuery() ; 
			
			if ( rs.next() ) { 
				cnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			try {
				if( rs != null){ rs.close(); } 
				if( pstmt != null){ pstmt.close(); } 
				this.closeConnection() ;
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		} 		
		return cnt  ; 
	}

	
}
