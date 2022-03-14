package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import ptithcm.entity.ProductType;
import ptithcm.entity.Products;
import ptithcm.entity.SaleOderDetail;
import ptithcm.entity.Users;

@Transactional
@Controller
public class trangchuController {
	@Autowired
	SessionFactory factory;
	
	//--------------------------------------------------------------------
	
	@RequestMapping("/trangchu")
	public String Defaulttrangchu(HttpServletRequest request,ModelMap modelMap,HttpSession session) {
		
		ArrayList<SaleOderDetail> cart = (ArrayList<SaleOderDetail>) request.getSession().getAttribute("cart");
		if(cart == null) {
			ArrayList<SaleOderDetail> salecart = null;
			System.out.println("ko co san pham");
			session.setAttribute("cart", salecart);
		}else {
			System.out.println("San pham trong gio hang la");
			System.out.println(cart.size());
		}


		List<Products> allproduct = this.product(10);
		List<Products> bestSallers = this.bestSallers();
		
		Users user = (Users) request.getSession().getAttribute("user");
		if(user != null) {
			System.out.println(user.getEmail().toString());
			System.out.println("co user");
			modelMap.addAttribute("user",user);
			
			if(user.getStatus().equalsIgnoreCase("admin")) {
				modelMap.addAttribute("admin",user.getStatus());
			}
		}
		modelMap.addAttribute("allproduct",allproduct);
		modelMap.addAttribute("bestSallers",bestSallers);
		
		return "trangchu";
	}
	
	//-------------------------------------------------------------------------
	
	@RequestMapping("/shop")
	public String defaultShop(HttpServletRequest request,HttpSession session,ModelMap model) {
		List<Products> pageproduct = this.product(12);
		List<Products> allproduct = this.Allproduct();
		List<ProductType> allproductType = this.productType();
		int totalPage = allproduct.size()/12 + ((allproduct.size() % 12  == 0) ? 0 : 1); 
		Users user = (Users) request.getSession().getAttribute("user");
		ArrayList<SaleOderDetail> cart = (ArrayList<SaleOderDetail>) request.getSession().getAttribute("cart");
		if(cart == null) {
			System.out.println("ko co san pham");
		}else {
			System.out.println("San pham trong gio hang la");
			System.out.println(cart.size());
		}
		if(user != null) {
			System.out.println(user.getEmail().toString());
			model.addAttribute("user",user);
			if(user.getStatus().equalsIgnoreCase("admin")) {
				model.addAttribute("admin",user.getStatus());
			}
		}
		int page=1;
		model.addAttribute("page",page);
		model.addAttribute("tottalPage",totalPage);
		model.addAttribute("allproduct",pageproduct);
		session.setAttribute("allproductType", allproductType);
		return "products/shop";
	}
	@RequestMapping("/contact")
	public String Contact(HttpServletRequest request,ModelMap model) {
		Users user = (Users) request.getSession().getAttribute("user");
		if(user != null) {
			System.out.println(user.getEmail().toString());
			model.addAttribute("user",user);
			if(user.getStatus().equalsIgnoreCase("admin")) {
				model.addAttribute("admin",user.getStatus());
			}
		}
		return "other/contact";
	}
	
	// cac ham truy van
	public List<Products> product(int number){ // lay number san pham dau tien
		Session session = factory.getCurrentSession();
		String hql = "from Products"; // Users la lay tu entity
		Query query = session.createQuery(hql).setFirstResult(0).setMaxResults(number);
		List<Products> list = query.list() ;
		return list;
	}
	public List<Products> bestSallers(){ //lay so luong san pham ban chay nhat
		Session session = factory.getCurrentSession();
		String hql = "from Products  ORDER BY SALE DESC"; // Users la lay tu entity
		Query query = session.createQuery(hql).setFirstResult(0).setMaxResults(10);
		List<Products> productsGet = query.list() ;
		return productsGet;
	}
	public List<Products> Genderproduct(String gender){ //lay san phan biet theo tui nam hay tui nu
		Session session = factory.getCurrentSession();
		String hql = "from Products Where GENDERBAG = :gender"; // Users la lay tu entity
		Query query = session.createQuery(hql).setFirstResult(0).setMaxResults(10);
		query.setParameter("gender", gender);
		List<Products> productsGet = query.list();
		return productsGet;
	}
	public List<Products> Allproduct(){
		Session session = factory.getCurrentSession();
		String hql = "from Products"; // Users la lay tu entity
		Query query = session.createQuery(hql);
		List<Products> list = query.list() ;
		return list;
	}
	public List<ProductType> productType(){
		Session session = factory.getCurrentSession();
		String hql = "from ProductType"; // Users la lay tu entity
		Query query = session.createQuery(hql);
		List<ProductType> list = query.list() ;
		return list;
	}
}
