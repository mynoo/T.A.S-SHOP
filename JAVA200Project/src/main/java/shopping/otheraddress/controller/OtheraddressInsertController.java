package shopping.otheraddress.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.mall.controller.MallCalculateController;
import shopping.otheraddress.model.Otheraddress;
import shopping.otheraddress.model.OtheraddressDao;

public class OtheraddressInsertController extends SuperClass {
	Otheraddress bean = null;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		int cnt = -99999 ; 
		
		bean = new Otheraddress();
		
		bean.setMid(request.getParameter("id"));
		bean.setFname(request.getParameter("name"));
		bean.setZipcode(request.getParameter("zipcode"));
		bean.setRoadaddress(request.getParameter("roadaddress"));
		bean.setAddress1(request.getParameter("address1"));
		bean.setAddress2(request.getParameter("address2"));
		bean.setExtraaddress(request.getParameter("extraaddress"));
		
		OtheraddressDao dao = new OtheraddressDao();
		
		System.out.println(bean.getMid());
		System.out.println(bean.getFname());
		System.out.println(bean.getZipcode());
		System.out.println(bean.getRoadaddress());
		System.out.println(bean.getAddress1());
		System.out.println(bean.getAddress2());
		System.out.println(bean.getExtraaddress());
		
		if (this.validate(request) == true) { 
			System.out.println("otheraddress insert validation check success");
			
			cnt = dao.InsertData(bean) ;
			
			session.setAttribute("otherinfo", bean);
			
			new MallCalculateController().doGet(request, response);
			
		} else {
			System.out.println("otheraddress insert validation check failure");
			
			request.setAttribute("bean", bean);
			super.doPost(request, response);
			
			String gotopage = "/orderdetail/userInformation.jsp" ;
			super.GotoPage(gotopage);
		}		
		
	}
	
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true ;
		// 유효성 검사 수행
		
		if (bean.getFname().length() < 2 || bean.getFname().length() > 10) {
			request.setAttribute(super.PREFIX + "name", "이름은(는) 2자리 이상 10자리 이하이어야 합니다.");
			isCheck = false ;
		}
		
//		System.out.println("name : " + isCheck);
		
		if (bean.getZipcode() == null || bean.getZipcode() == "" ) {
			request.setAttribute(super.PREFIX + "zipcode", "우편 번호는 필수 입력 사항입니다.");
			isCheck = false ;
		}
		
		return isCheck ;
	}
}
