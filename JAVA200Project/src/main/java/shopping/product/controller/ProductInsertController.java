package shopping.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shopping.common.controller.SuperClass;
import shopping.product.model.Product;
import shopping.product.model.ProductDao;

public class ProductInsertController extends SuperClass {
	private Product bean = null ; 
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);				
		
		String gotopage = "/product/prInsertForm.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		MultipartRequest multi = (MultipartRequest)request.getAttribute("multi") ;
		bean = new Product() ;
		
		bean.setBrand(multi.getParameter("brand"));
		bean.setCategory(multi.getParameter("category"));
		bean.setContent(multi.getParameter("content"));		
		bean.setDate(multi.getParameter("date"));
		bean.setPname(multi.getParameter("pname"));
		
		bean.setImage(multi.getFilesystemName("image"));
		
		// bean.setNum(0); 시퀀스가 알아서 하므로 ....
		
		if (multi.getParameter("volume") != null && multi.getParameter("volume").equals("") == false) {
			bean.setVolume(Integer.parseInt(multi.getParameter("volume")));	
		}
		
		if (multi.getParameter("price") != null && multi.getParameter("price").equals("") == false) {
			bean.setPrice(Integer.parseInt(multi.getParameter("price")));	
		}
		
		if (multi.getParameter("stock") != null && multi.getParameter("stock").equals("") == false) {
			bean.setStock(Integer.parseInt(multi.getParameter("stock")));	
		}		 
		if (multi.getParameter("alcohol") != null && multi.getParameter("alcohol").equals("") == false) {
			bean.setAlcohol(Integer.parseInt(multi.getParameter("alcohol")));	
		}		 
		
		if (this.validate(request) == true) {
			System.out.println("product insert validation check success");
			ProductDao dao = new ProductDao() ;
			
			int cnt = -99999 ;
			cnt = dao.InsertData(bean) ;
			
			new ProductListController().doGet(request, response);
			
		} else {
			System.out.println("product insert validation check failure");			
			request.setAttribute("bean", bean); 			
			super.doPost(request, response);			
			String gotopage = "/product/prInsertForm.jsp" ;
			super.GotoPage(gotopage);
		}
	}
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true ;

		if (bean.getPname().length() < 1 || bean.getPname().length() > 15) {
			request.setAttribute(super.PREFIX + "pname", "상품 이름은(는) 3자리 이상 15자리 이하이어야 합니다.");
			isCheck = false ;
		}
		if (bean.getBrand().length() < 1 || bean.getBrand().length() > 15) {
			request.setAttribute(super.PREFIX + "brand", "회사 이름은(는) 3자리 이상 15자리 이하이어야 합니다.");
			isCheck = false ;
		}
		if (bean.getContent().length() < 5 || bean.getContent().length() > 255) {
			request.setAttribute(super.PREFIX + "content", "상품에 대한 설명은 5자리 이상 255자리 이하이어야 합니다.");
			isCheck = false ;
		}
		
		if (bean.getCategory().equals("-")) {
			request.setAttribute(super.PREFIX + "category", "상품 카테고리를 선택하셔야 합니다.");
			isCheck = false ;
		}
		
		// 날짜 형식은 yyyy/mm/dd 또는 yyyy-mm-dd 
		String regex = "\\d{4}[-/]\\d{2}[-/]\\d{2}" ;
		
		if (bean.getDate() == null) {
			request.setAttribute(super.PREFIX + "date", "날짜를 입력해주세요.");
		}
		
		boolean result = Pattern.matches(regex, bean.getDate()) ;
		if (result == false) {
			request.setAttribute(super.PREFIX + "date", "입고 일자는 yyyy/mm/dd 또는 yyyy-mm-dd으로 입력해 주셔야 합니다.");
			isCheck = false ;
		}		
		
		if (bean.getImage() == null || bean.getImage().equals("")) {
			request.setAttribute(super.PREFIX + "image", "이미지는 필수 입력 사항입니다.");
			isCheck = false ;
		}
		
		int stock = 10 ;
		if (bean.getStock() < stock) {
			request.setAttribute(super.PREFIX + "stock", "재고 수량은 " + stock + "개 이상이어야 합니다.");
			isCheck = false ;
		}
		int price = 100 ;
		if (bean.getStock() > price) {
			request.setAttribute(super.PREFIX + "price", "가격은 " + price + "원 이상이어야 합니다.");
			isCheck = false ;
		}
		int alcohol = 1 ;
		if (bean.getStock() < alcohol) {
			request.setAttribute(super.PREFIX + "alcohol", "도수는 " + alcohol + "도 이상이어야 합니다.");
			isCheck = false ;
		}
		int volume = 1 ;
		if (bean.getStock() < volume) {
			request.setAttribute(super.PREFIX + "volume", "용량은 " + volume + "ml 이상이어야 합니다.");
			isCheck = false ;
		}
		
		return isCheck ;
	}
}

