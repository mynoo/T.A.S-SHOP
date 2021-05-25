package shopping.mall.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.common.model.MyCartList;
import shopping.mall.model.MallDao;
import shopping.member.model.Member;
import shopping.otheraddress.model.Otheraddress;
import shopping.product.controller.ProductListController;

public class MallCalculateController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		System.out.println("장바구니내 내역을 이용하여 계산을 합니다.");
		
		MyCartList mycart = (MyCartList)super.session.getAttribute("mycart");
		MallDao dao = new MallDao();
		
		String payment = request.getParameter("payment");
		if (mycart != null) {
			Map<Integer, Integer> maplists = mycart.GetAllOrderList();
			System.out.println("shopping list count : " + maplists.size());
			
			Member mem = (Member)super.session.getAttribute("loginfo");
			Otheraddress othermem = (Otheraddress)super.session.getAttribute("otherinfo");
			
			if(othermem != null) {
				if(mem.getName() != othermem.getFname()) {
					System.out.println("call dao.Calulate() method - othermem");
					dao.Calculate(othermem, maplists);
				}
			}else {
				System.out.println("call dao.Calulate() method - mem");
				dao.Calculate(mem, maplists);
			}
			
			System.out.println("remove attribute in session");
			super.session.removeAttribute("totalAmount");
			super.session.removeAttribute("mycart");
			super.session.removeAttribute("shoplists");
			
			String message = "결재를 완료하였습니다.";
			super.session.setAttribute("message", message);
			super.session.setAttribute("payment", payment);
		}
		
		new MallOrderController().doGet(request, response);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}