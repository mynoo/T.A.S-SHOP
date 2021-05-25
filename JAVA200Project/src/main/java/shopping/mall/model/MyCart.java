package shopping.mall.model;

import java.util.HashMap;
import java.util.Map;

public class MyCart {
	private Map<Integer, Integer> orderlists = null ;
	private String mid;
	private int pnum;
	private String pname;
	private int qty;
	private int price;
	private String image;
	private int point;

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public MyCart(String mid, int pnum, String pname, int qty, int price, String image, int point) {
		super();
		this.mid = mid;
		this.pnum = pnum;
		this.pname = pname;
		this.qty = qty;
		this.price = price;
		this.image = image;
		this.point = point;
	}


	@Override
	public String toString() {
		return "MyCart [mid=" + mid + ", pnum=" + pnum + ", pname=" + pname + ", qty=" + qty + ", price=" + price
				+ ", image=" + image + ", point=" + point + "]";
	}

	public void AddOrder(  int pmkey, int stock ){
		if ( this.orderlists.containsKey( pmkey) ) {
			orderlists.put(pmkey, orderlists.get(pmkey)  + stock ) ;
		} else {
			orderlists.put(pmkey, stock ) ;
		}
	}

	public MyCart() {
		this.orderlists = new HashMap<Integer, Integer>();
	}
	
	public void RemoveAllProductInfo(){
		this.orderlists.clear(); 
	}
	
	public Map<Integer, Integer> GetAllOrderList(){
		return this.orderlists ;
	}
	
	public void EditOrder( int pmkey, int stock ){
		this.AddOrder(pmkey, stock); 
	}
	
	public void  DeleteOrder( int pmkey ){
		this.orderlists.remove(pmkey) ;  
	}
	
	
}
