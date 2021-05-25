package shopping.common.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CompositeDao extends SuperDao{

	public List<ShoppingInfo> ShowDetail(int oid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select p.pno pno, p.pname pname, od.qty, p.price, p.image";
		sql += " from ( orders o inner join orderdetails od";
		sql += " on o.oid = od.oid ) inner join products p";
		sql += " on od.pnum = p.pno and o.oid = ? "; 
		sql += " order by od.odid desc ";
		
		List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();
		
		try {
			if(conn == null) {conn = this.getConnection();}
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
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return lists;
	}
	
}
