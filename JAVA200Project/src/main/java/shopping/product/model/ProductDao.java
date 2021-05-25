package shopping.product.model ;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shopping.common.model.SuperDao;

public class ProductDao extends SuperDao {
	public int InsertData( Product bean ){
		String sql = " insert into products" ;
		sql += " ( " ;
		sql += " pno, pname, brand, image, stock, price, category, alcohol, volume, content, inputdate " ;
		sql += " ) " ;
		sql += " values( " ;
		sql += " seqprod.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, default" ;
		sql += " ) " ;		
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getPname());
			pstmt.setString(2, bean.getBrand());
			pstmt.setString(3, bean.getImage());
			pstmt.setInt(4, bean.getStock());
			pstmt.setInt(5, bean.getPrice());
			pstmt.setString(6, bean.getCategory());
			pstmt.setInt(7, bean.getAlcohol());
			pstmt.setInt(8, bean.getVolume());
			pstmt.setString(9, bean.getContent());
			
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
	public int UpdateData( Product bean ){
		String sql = " update products set pname = ?, content = ?, brand = ?, inputdate = ?, " ;
		sql += " image = ?, category = ?, stock = ?, price = ?, alcohol = ?, volume = ?";
		sql += " where pno = ? " ;


		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
				
			pstmt.setString(1, bean.getPname());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getBrand());
			pstmt.setString(4, String.valueOf(bean.getDate()));
			pstmt.setString(5, bean.getImage());
			pstmt.setString(6, bean.getCategory());
			pstmt.setInt(7, bean.getStock());
			pstmt.setInt(8, bean.getPrice());
			pstmt.setInt(9, bean.getAlcohol());
			pstmt.setInt(10, bean.getVolume());
			pstmt.setInt(11, bean.getPno());
			
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
	public int DeleteData( int pno ){
		String sql = " delete from products " ;
		sql += " where pno = ? " ;

		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, pno);
			
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
	public List<Product> SelectDataList( int beginRow, int endRow, String mode, String keyword ) {
		// 해당 검색 조건에 맞는 모든 데이터를 조회합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select ranking, pno, pname, brand, image, stock, price, category, alcohol, volume, content, inputdate " ;
		sql += " from ( select pno, pname, brand, image, stock, price, category, alcohol, volume, content,  inputdate, rank() over(order by pno desc) as ranking " ;
		sql += " from products " ;
		
		if(mode.equalsIgnoreCase("all") ==false) { 
			System.out.println("not all search mode");
			sql += " where " + mode + " like '%" + keyword + "%' " ;	
		}
		
		sql += "  ) " ;
		sql += " where ranking between ? and ?  " ;	

		List<Product> lists = new ArrayList<Product>();
		
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery() ;	
			
			while( rs.next() ){
				Product bean = new Product();
				
				bean.setPno(rs.getInt("pno"));
				bean.setPname(rs.getString("pname"));				
				bean.setBrand(rs.getString("brand"));				
				bean.setImage(rs.getString("image"));
				bean.setStock(rs.getInt("stock"));
				bean.setPrice(rs.getInt("price"));
				bean.setCategory(rs.getString("category"));
				bean.setDate(String.valueOf(rs.getDate("inputdate")));
				bean.setContent(rs.getString("content"));
				bean.setAlcohol(rs.getInt("alcohol"));
				bean.setVolume(rs.getInt("volume"));
				
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

	public Product SelectDataByPk( int pno ){
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;				

		String sql = " select * from products " ;
		sql += " where pno = ?  " ;

		Product bean = null ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }
			pstmt = this.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, pno);
			
			rs = pstmt.executeQuery() ; 
			
			if ( rs.next() ) {
				bean = new Product() ;
				
				bean.setPno(rs.getInt("pno"));
				bean.setPname(rs.getString("pname"));
				bean.setBrand(rs.getString("brand"));
				bean.setImage(rs.getString("image"));
				bean.setStock(rs.getInt("stock"));
				bean.setPrice(rs.getInt("price"));
				bean.setCategory(rs.getString("category"));
				bean.setAlcohol(rs.getInt("alcohol"));
				bean.setVolume(rs.getInt("volume"));
				bean.setDate(String.valueOf(rs.getDate("inputdate")));
				bean.setContent(rs.getString("content"));				

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
	public int SelectTotalCount( String mode, String keyword ) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select count(*) as cnt from products " ;
		if(mode.equalsIgnoreCase("all") ==false) { 
			System.out.println("not all search mode");
			sql += " where " + mode + " like '%" + keyword + "%' " ;	
		}
		int cnt = 0 ; //없는 경우의 기본 값
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;
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
	
	
	 
	public int UpdateStock(Integer pnum, Integer qty) {
		String sql = " " ;
		sql += "  " ;
		sql += "  " ;

		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			pstmt.setInt(1, qty);
			pstmt.setInt(2, pnum );  
			
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
	public List<Product> SelectPrDataList(int beginRow, int endRow, String mode, String keyword) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select ranking, pno, pname, brand, image, stock, price, category" ;
		sql += " from ( select pno, pname, brand, image, stock, price, category, rank() over(order by pno desc) as ranking " ;
		sql += " from products " ;
		
		if(mode.equalsIgnoreCase("all") ==false) { 
			System.out.println("not all search mode");
			sql += " where " + mode + " like '%" + keyword + "%' " ;	
		}
		
		sql += "  ) " ;
		sql += " where ranking between ? and ?  " ;	

		List<Product> lists = new ArrayList<Product>();
		
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery() ;	
			
			while( rs.next() ){
				Product bean = new Product();
				
				bean.setPno(rs.getInt("pno"));
				bean.setPname(rs.getString("pname"));
				bean.setBrand(rs.getString("brand"));
				bean.setImage(rs.getString("image"));
				bean.setStock(rs.getInt("stock"));
				bean.setPrice(rs.getInt("price"));
				bean.setCategory(rs.getString("category"));
				
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
}