package shopping.reply.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shopping.board.model.Board;
import shopping.common.model.SuperDao;

public class ReplyDao extends SuperDao {
   public ReplyDao() {}

   public int InsertData(Reply rebean) {
      String sql = " insert into replys(rno, groupno, mid, comments, redate ) " ;
      sql += " values(myreply.nextval, ? , ?, ?, sysdate ) " ;
      
      PreparedStatement pstmt = null ;
      int cnt = -99999 ;
      try {
         if( conn == null ){ super.conn = super.getConnection() ; }
         conn.setAutoCommit( false );
         pstmt = super.conn.prepareStatement(sql) ;
         
         pstmt.setInt(1, rebean.getGroupno());
         pstmt.setString(2, rebean.getMid());
         pstmt.setString(3, rebean.getcomments());
      
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
   
   public List<Reply> getReplyListByPk(int bno) {
      
	   System.out.println("groupno--"+bno);
	   
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      StringBuffer sb = new StringBuffer();
      sb.append(" select")
         .append("  rno")
         .append(", groupno")
         .append(", mid")
         .append(", comments")
         .append(", redate")
         .append(" from")
         .append(" replys")
         .append(" where")
         .append("   groupno = ? ");
      
      List<Reply> replyList = new ArrayList<Reply>();
      
      System.out.println(sb.toString());
      
      try {
         if( this.conn == null ){ this.conn = this.getConnection() ; }         
         pstmt = this.conn.prepareStatement(sb.toString()) ;
         pstmt.setInt(1, bno);
         
         rs = pstmt.executeQuery() ; 
         
         while ( rs.next() ) {
            Reply reply = new Reply();
            reply.setRno(rs.getInt("rno"));
            reply.setGroupno(rs.getInt("groupno"));
            reply.setMid(rs.getString("mid"));
            reply.setcomments(rs.getString("comments"));
            reply.setredate(rs.getString("redate"));
            
            replyList.add(reply);
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
      
      return replyList; 
   }

public int DeleteData(int rno) {
	String sql = " delete from replys  " ;
	sql += " where rno = ? " ;
	
	PreparedStatement pstmt = null ;
	int cnt = -99999 ;
	try {
		if( conn == null ){ super.conn = super.getConnection() ; }
		conn.setAutoCommit( false );
		pstmt = super.conn.prepareStatement(sql) ;
		
		pstmt.setInt(1, rno);
		
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


}




