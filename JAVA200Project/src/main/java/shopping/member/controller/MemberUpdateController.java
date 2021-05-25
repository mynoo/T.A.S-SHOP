package shopping.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.MainController;
import shopping.common.controller.SuperClass;
import shopping.member.model.Member;
import shopping.member.model.MemberDao;

public class MemberUpdateController extends SuperClass {
	private Member bean = null;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String gotopage = "member/myprofile.jsp";
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bean = new Member(); 
		
		bean.setAddress1(request.getParameter("address1"));
		bean.setAddress2(request.getParameter("address2"));
		bean.setBirth(request.getParameter("birth"));
		bean.setGender(request.getParameter("gender"));
		bean.setId(request.getParameter("id"));
		bean.setEmail(request.getParameter("email"));
		bean.setZipcode(request.getParameter("zipcode"));
		bean.setName(request.getParameter("name"));
		bean.setPassword(request.getParameter("password"));
		bean.setPhonenumber(request.getParameter("phonenumber"));
		
		System.out.println(bean.getId());
		System.out.println(bean.getName());
		System.out.println(bean.getPassword());
		System.out.println(bean.getEmail());
		System.out.println(bean.getGender());
		System.out.println(bean.getPhonenumber());
		System.out.println(bean.getZipcode());
		System.out.println(bean.getAddress1());
		System.out.println(bean.getAddress2());
		System.out.println(bean.getBirth());
		
		MemberDao dao = new MemberDao();
		
		if (this.validate(request) == true) { 
			System.out.println("member update validation check success");
			int cnt = -99999 ; 
			
			cnt = dao.UpdateData(bean);
			
			new MainController().doGet(request, response);
			
		} else {
			System.out.println("member update validation check failure");
			
			request.setAttribute("bean", bean);
			super.doPost(request, response);
			String gotopage = "/member/myprofile.jsp";
			super.GotoPage(gotopage);
		}		
	}		
	
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true ;
		// 유효성 검사 수행 예정
		if (bean.getPassword().length() < 4 || bean.getPassword().length() > 10) {
			request.setAttribute(super.PREFIX + "password", "비밀 번호는 4자리 이상 10자리 이하이어야 합니다.");
			isCheck = false ;
		}
		if (bean.getGender() == null ) {
			request.setAttribute(super.PREFIX + "gender", "성별은 반드시 체크가 되어야 합니다.");
			isCheck = false ;
		}
		
		if (bean.getZipcode() == null || bean.getZipcode() == "" ) {
			request.setAttribute(super.PREFIX + "zipcode", "우편 번호는 필수 입력 사항입니다.");
			isCheck = false ;
		}
		
		if (bean.getPhonenumber().length() < 9 ||bean.getPhonenumber().length() < 11 ) {
			request.setAttribute(super.PREFIX + "phonenumber", "핸드폰 번호는 '-' 포함 9글자 이상 11글자 이하로 입력하세요");
		}
		
		return isCheck ;
	}
}