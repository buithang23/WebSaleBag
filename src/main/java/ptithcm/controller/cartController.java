package ptithcm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ptithcm.entity.Products;
import ptithcm.entity.SaleOderDetail;
import ptithcm.entity.SaleOrder;
import ptithcm.entity.Users;

@Controller
@Transactional
public class cartController {
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping("/cart") // vao pham gio hang
	public static String CartShop(HttpServletRequest request,ModelMap modelMap) {
		Users user = (Users) request.getSession().getAttribute("user");
		ArrayList<SaleOderDetail> cart = (ArrayList<SaleOderDetail>) request.getSession().getAttribute("cart"); // lay gio hang da luu trong sesssion
		if(cart == null) {
			System.out.println("ko co san pham");
		}else {
			System.out.println("San pham trong gio hang la");
			System.out.println(cart.size());
			modelMap.addAttribute("cart", cart);
		}
		if(user != null) {
			System.out.println(user.getEmail().toString());
			modelMap.addAttribute("user",user);
			if(user.getStatus().equalsIgnoreCase("admin")) {
				modelMap.addAttribute("admin",user.getStatus());
			}

		}
		return "products/cart";
	}
	@RequestMapping(value="/insertProduct",method = RequestMethod.GET) // them san pham vao gio hang
	public void InsertCart(@RequestParam String id,@RequestParam String name,@RequestParam float price,@RequestParam String img, HttpServletRequest request,HttpSession session,ModelMap modelMap) {
		List<SaleOderDetail> odercarts = new ArrayList<SaleOderDetail>();
		if(session.getAttribute("cart") == null) { //kiem tra xem trong session co cart hay chua neu chua thi tao va them moi
			System.out.println("deo co san pham trong go hang");
			SaleOderDetail odercart = new SaleOderDetail();
			odercart.setProductid(id);
			odercart.setProductname(name);
			odercart.setProductimg(img);
			odercart.setSaleprice(price);
			odercart.setQuantityproduct(1);
			
			odercarts.add(odercart);
			session.setAttribute("cart", odercarts);
			
			ArrayList<SaleOderDetail> cart = (ArrayList<SaleOderDetail>) request.getSession().getAttribute("cart");
			System.out.println(cart.size());
		}else { // neu co no se them vao gio hang
			
			ArrayList<SaleOderDetail> cart = (ArrayList<SaleOderDetail>) session.getAttribute("cart");
			SaleOderDetail odercart = new SaleOderDetail();
			odercart.setProductid(id);
			odercart.setProductname(name);
			odercart.setProductimg(img);
			odercart.setSaleprice(price);
			odercart.setQuantityproduct(1);
			cart.add(odercart);
			System.out.println(cart.size());
		}
	}
	//------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/deleteSP",method = RequestMethod.GET) // xoa san pham vao gio hang
	public void DeleteCart(@RequestParam String id, HttpServletRequest request,HttpSession session) {
		ArrayList<SaleOderDetail> cart = (ArrayList<SaleOderDetail>) session.getAttribute("cart");
		for(int i =0; i<cart.size();i++) {
			if(cart.get(i).getProductid().equalsIgnoreCase(id)) {
				cart.remove(i);
			}
		}
		System.out.println("San pham trong gio hang la: "+cart.size());
	}
	@RequestMapping(value="/buySP",method = RequestMethod.GET) // them san pham vao gio hang
	
	public void buyCart(@RequestParam String totalprice, HttpServletRequest request,HttpSession session) {
		float totalPrice = Float.parseFloat(totalprice);
		Session ss= factory.openSession();
		Date date = Calendar.getInstance().getTime();// lay ngay h hien tia
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String saledate = df.format(date);
		long id = System.currentTimeMillis(); // lay tg hien tai theo tưng giay de lam ma hoa don
		String madh = "HD"+ id;
		ArrayList<SaleOderDetail> cartoder = (ArrayList<SaleOderDetail>) session.getAttribute("cart"); // lay gio hang
		session.removeAttribute("cart");
		Users user = (Users) request.getSession().getAttribute("user");
		boolean result1 = this.InsertSaleOrder(madh, user.getEmail(), saledate, totalPrice);
		if(!result1) {
			System.out.println("khong co san pham nao duoc luu");
		}
		for(int i=0;i<cartoder.size();i++) {
			String productid = cartoder.get(i).getProductid();
			String producname = cartoder.get(i).getProductname();
			String productimg = cartoder.get(i).getProductimg();
			float quanityproduct = cartoder.get(i).getQuantityproduct();
			float saleprice = cartoder.get(i).getSaleprice();
			InsertSaleOrderDetail(madh, productid, producname, productimg, quanityproduct, saleprice);

		}
		Mail(madh,user.getEmail(),user.getUsername(),totalPrice);
	}
	
	public Boolean InsertSaleOrder(String madh,String email,String saledate,float total) {
		Session session = factory.getCurrentSession();
		SaleOrder saleorder = new SaleOrder();
		saleorder.setSaleorderid(madh);
		saleorder.setEmail(email);
		saleorder.setSaledate(saledate);
		saleorder.setSalestatus("0");
		saleorder.setTotal(total);
			String kqua = (String) session.save(saleorder);;
			if(kqua!=null) {
				return true;
			}else {
				return false;
			}
	}
	
	public Boolean InsertSaleOrderDetail(String madh,String productid,String productname,String productimg,float quanityproduct,float saleprice) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			SaleOderDetail orderdetail = new SaleOderDetail();
			orderdetail.setSaleorderid(madh);
			orderdetail.setProductid(productid);
			orderdetail.setProductname(productname);
			orderdetail.setProductimg(productimg);
			orderdetail.setQuantityproduct(quanityproduct);
			orderdetail.setSaleprice(saleprice);
			String kqua = null;
			try {
				kqua = (String) session.save(orderdetail);;
				t.commit();
			} catch (Exception e) {
				t.rollback();
				// TODO: handle exception
			}finally {
				session.close();
			}
			if(kqua!=null) {
				return true;
			}else {
				return false;
			}
	}
	@Autowired
	JavaMailSender mailer;
	public void Mail(String madonhang, String email,String tenkh,float gia) { // ham gui mail

		String from="caloshopmail@gmail.com";
		String to= email;
		String subject="Đơn Hàng Từ Colo Shop!";
		String body="Xin Chào "+tenkh+".Đơn Hàng: "+madonhang+" với tổng giá tiền là "+gia+ " VND Đang được chuẩn bị. Cảm ơn bạn đã mua sắm cùng chúng tôi ";
		try {
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper= new MimeMessageHelper(mail);
			System.out.println("new");
			helper.setFrom(from,from);
			helper.setTo(to);
			helper.setReplyTo(from,from);
			helper.setSubject(subject);
			helper.setText(body,true);
			mailer.send(mail);
		}
		catch (Exception ex){
		}
	}
}
