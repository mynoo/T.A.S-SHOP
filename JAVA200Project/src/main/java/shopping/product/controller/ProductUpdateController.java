package shopping.product.controller;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shopping.common.controller.SuperClass;
import shopping.product.model.Product;
import shopping.product.model.ProductDao;

public class ProductUpdateController extends SuperClass {
	Product bean = null;
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		ProductDao dao = new ProductDao();
		bean = dao.SelectDataByPk(pno);
		
		request.setAttribute("bean", bean);
		
		String gotopage = "product/prUpdateForm.jsp";
		super.GotoPage(gotopage);
		
		
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		MultipartRequest multi = (MultipartRequest)request.getAttribute("multi") ;
		
		System.out.println("pn" + multi.getParameter("pname"));
		System.out.println("im" + multi.getFilesystemName("image"));
		System.out.println("br" + multi.getParameter("brand"));
		System.out.println("ca" + multi.getParameter("category"));
		System.out.println("st" + multi.getParameter("stock"));
		System.out.println("pr" + multi.getParameter("price"));
		System.out.println("da" + multi.getParameter("date"));
		System.out.println("co" + multi.getParameter("content"));
		System.out.println("vo" + multi.getParameter("volume"));
		System.out.println("al" + multi.getParameter("alcohol"));
		
		bean.setPname(multi.getParameter("pname"));
		bean.setImage(multi.getFilesystemName("image"));
		bean.setBrand(multi.getParameter("brand"));
		bean.setCategory(multi.getParameter("category"));
		bean.setStock(Integer.parseInt(multi.getParameter("stock")));
		bean.setPrice(Integer.parseInt(multi.getParameter("price")));
		bean.setDate(multi.getParameter("date"));
		bean.setContent(multi.getParameter("content"));
		bean.setVolume(Integer.parseInt(multi.getParameter("volume")));
		bean.setAlcohol(Integer.parseInt(multi.getParameter("alcohol")));
		
		
		int cnt = -99999;
		
		ProductDao dao = new ProductDao();
		
		cnt = dao.UpdateData(bean);
		
		request.setAttribute("bean", bean);
		
		if(cnt != 0) {
			System.out.println("상품 수정 성공");
			
			new ProductListController().doGet(request, response);
			
		}else {
			System.out.println("상품 수정 실패");
			
			String gotopage = "/product/prUpdateForm.jsp" ;
			super.GotoPage(gotopage);
		}
		
	}
}