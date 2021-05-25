package shopping.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.board.model.Board;
import shopping.board.model.BoardDao;
import shopping.common.controller.SuperClass;
import shopping.member.model.Member;
import shopping.reply.model.Reply;
import shopping.reply.model.ReplyDao;

public class BoardDetailViewController extends SuperClass {
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      super.doGet(request, response);
      
      request.setCharacterEncoding("UTF-8");
      
      int bno = Integer.parseInt(request.getParameter("bno")) ;
      
      BoardDao dao = new BoardDao();
      Board bean = dao.SelectDataByPk(bno) ;

      
      Member loginfo = (Member)super.session.getAttribute("loginfo") ;
      
      if (loginfo != null && loginfo.getId().equals(bean.getWriter()) == false || bean.getWriter() == null) {
          dao.UpdateReadhit(bno) ;
          bean.setDepth( bean.getDepth() + 1 ); 
       }
      
      
//      if (loginfo.getId().equals(bean.getWriter()) == false || bean.getWriter() == null) {
//         dao.UpdateReadhit(bno) ;
//         bean.setDepth( bean.getDepth() + 1 ); 
//      }   
      
      request.setAttribute("bean", bean);
      
      //여기에 댓글리스트 생성 로직 부착.
      
      ReplyDao replyDao = new ReplyDao();
      List<Reply> replyList = replyDao.getReplyListByPk(bno);
   
      request.setAttribute("relists", replyList);
      //
      
      // 인설트 페이지
//      Reply rebean = new Reply() ;
//      rebean.setGroupno(Integer.parseInt(request.getParameter("bno")));
//      rebean.setMid(request.getParameter("mid"));
//      rebean.setcomments(request.getParameter("comments"));
//      int cnt = - 999999 ;
//	  cnt = replyDao.InsertData(rebean) ;
      
      //
      
      System.out.println(replyList);
	  
      String gotopage = "/board/boDetailView.jsp" ;
      super.GotoPage(gotopage);
   }   
   @Override
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      super.doPost(request, response);
      
      request.setCharacterEncoding("UTF-8");
      
      ReplyDao replyDao = new ReplyDao();
      Reply rebean = new Reply() ;
      rebean.setGroupno(Integer.parseInt(request.getParameter("bno")));
      rebean.setMid(request.getParameter("mid"));
      rebean.setcomments(request.getParameter("comments"));
      int cnt = - 999999 ;
	  cnt = replyDao.InsertData(rebean) ;
      
	  this.doGet(request, response);
   }
}





