package shopping.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.member.model.Member;
import shopping.member.model.MemberDao;

public class MemberLogincheckController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDao dao = new MemberDao();
		
		Member bean = dao.SelectData(id, password) ;
		
		if (bean == null || !(bean.getId().equals(id)) || !(bean.getPassword().equals(password)) ) {
			request.setAttribute("message", "<font color='black'><b>등록되지 않는 아이디이거나 <br> 아이디 또는 비밀번호를 잘못 입력했습니다.<b></font>");
			request.setAttribute("isCheck", true);
			
			String gotopage = "/member/Logincheck.jsp" ;
			super.GotoPage(gotopage);
		}else {
			request.setAttribute("message", bean.getName() + "님 <font color='black'> 반갑습니다. </font>");
			request.setAttribute("isCheck", true);
			
			String gotopage = "/member/Logincheck.jsp" ;
			super.GotoPage(gotopage);
		}
	}	
}
