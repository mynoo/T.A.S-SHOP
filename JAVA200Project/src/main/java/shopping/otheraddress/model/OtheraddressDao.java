package shopping.otheraddress.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shopping.common.model.SuperDao;

public class OtheraddressDao extends SuperDao{
	
public List<Otheraddress> SelectAddressByPk(String id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Otheraddress> lists = new ArrayList<Otheraddress>();
		
		String sql = " select distinct fname, zipcode, roadaddress, addr2, addr1, extraaddress from otheraddress";
		sql += " where mid = ?";
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Otheraddress bean = new Otheraddress();
				
				bean.setFname(rs.getString("fname"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress1(rs.getString("addr1"));
				bean.setAddress2(rs.getString("addr2"));
				bean.setRoadaddress(rs.getString("roadaddress"));
				bean.setExtraaddress(rs.getString("extraaddress"));
				
				lists.add(bean);
			}
			
		} catch (Exception e) {
			SQLException err = (SQLException)e;
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
		
		return lists;
	}

	public int InsertData(Otheraddress bean) {
		PreparedStatement pst = null;
		
		int cnt = -99999;
		String sql = "";
		
		try {
			if(conn == null) {conn = super.getConnection();}
			conn.setAutoCommit(false);
			
			sql = "insert into otheraddress (fid, mid, fname, zipcode, addr1, addr2, roadaddress, extraaddress, remark)";
			sql += "values(seqotheraddr.nextval, ?, ?, ?, ?, ?, ?, ?, null)";
			
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, bean.getMid());
			pst.setString(2, bean.getFname());
			pst.setString(3, bean.getZipcode());
			pst.setString(4, bean.getAddress1());
			pst.setString(5, bean.getAddress2());
			pst.setString(6, bean.getRoadaddress());
			pst.setString(7, bean.getExtraaddress());
			
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

}
