package shopping.mall.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shopping.common.model.ShoppingInfo;
import shopping.common.model.SuperDao;
import shopping.product.model.Product;

public class OrderDetailDao  extends SuperDao{

		public int UpdateRemark( Product bean ) {
			String sql = " update orderdetails set ";
			sql += " remark = ? " ;
			sql += " where pnum = ? " ; 
			PreparedStatement pstmt = null ;
			int cnt = -99999 ;
			try {
				if( conn == null ){ super.conn = super.getConnection();}
				conn.setAutoCommit( false );
				pstmt = super.conn.prepareStatement(sql);
	
				pstmt.setString(1, bean.getPname());
				pstmt.setInt(2, bean.getPno());
	
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
					if( pstmt != null ){ pstmt.close(); }
					super.closeConnection(); 
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return cnt ;
		}
		
		public int InsertData(OrderDetail bean) {
			String sql = " insert into orderdetails(odid, oid, pnum, qty)";
			sql += " values( seqodid.nextval, ?, ?, ? )";

			PreparedStatement pstmt = null ;
			int cnt = -99999 ;
			try {
				if( conn == null ){ super.conn = super.getConnection() ; }
				conn.setAutoCommit( false );
				pstmt = super.conn.prepareStatement(sql) ;
	   
				pstmt.setInt(1, bean.getOid() );
				pstmt.setInt(2, bean.getPnum() );
				pstmt.setInt(3, bean.getQty() ); 
				
				cnt = pstmt.executeUpdate() ; 
				conn.commit(); 
			} catch (Exception e) {
				SQLException err = (SQLException)e ;
				cnt = - err.getErrorCode();
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
			return cnt;
		}

	public List<ShoppingInfo> showDetail(int oid) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();
		
		String sql = " select p.pno as pno, p.pname as pname, p.image as image, p.price as price, od.qty as qty";
		sql += " from orders o inner join oderdetails od";
		sql += " on o.oid = od.oid";
		sql += " inner join products p";
		sql += " on od.pnum = p.pno";
		sql += " where o.id = ?";
		
		try {
			if(conn == null ) {conn = this.getConnection();}
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, oid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ShoppingInfo bean = new ShoppingInfo();
				
				bean.setImage(rs.getString("image"));
				bean.setPname(rs.getString("pname"));
				bean.setPnum(rs.getInt("pno"));
				bean.setPrice(rs.getInt("price"));
				bean.setQty(rs.getInt("qty"));
				
				lists.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return lists;
	}

}