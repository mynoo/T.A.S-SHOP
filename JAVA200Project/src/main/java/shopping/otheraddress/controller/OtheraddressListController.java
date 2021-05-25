package shopping.otheraddress.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.otheraddress.model.Otheraddress;
import shopping.otheraddress.model.OtheraddressDao;

public class OtheraddressListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String id = request.getParameter("id");
		
		List<Otheraddress> lists = null;
		
		OtheraddressDao dao = new OtheraddressDao();
		
		lists = dao.SelectAddressByPk(id);
		
		request.setAttribute("lists", lists);
		
		String gotopage = "orderdetail/otheraddrList.jsp";
		super.GotoPage(gotopage);
	}
}
