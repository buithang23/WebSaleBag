package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.Products;
import ptithcm.entity.SaleOderDetail;
import ptithcm.entity.Users;

@Transactional
@Controller
@RequestMapping("/shop")
public class shopController {
	@Autowired
	SessionFactory factory;

	
	// dung de phan trang
	@RequestMapping("/page-{page}")
	public String Shop(@PathVariable("page") int page,HttpServletRequest request,ModelMap model) {
		ArrayList<SaleOderDetail> cart = (ArrayList<SaleOderDetail>) request.getSession().getAttribute("cart");
		if(cart == null) {
			System.out.println("deo co san pham");
		}else {
			System.out.println("San pham trong gio hang la");
			System.out.println(cart.size());
		}
		int skip = (page - 1) * 12;
		List<Products> pageproduct = this.pageproduct(skip);
		List<Products> allproduct = this.Allproduct();
		int totalPage = allproduct.size()/12 + (allproduct.size()%12 == 0 ? 0 : 1);
		Users user = (Users) request.getSession().getAttribute("user");
		if(user != null) {
			System.out.println(user.getEmail().toString());
			model.addAttribute("user",user);
			if(user.getStatus().equalsIgnoreCase("admin")) {
				model.addAttribute("admin",user.getStatus());
			}
		}
		model.addAttribute("page",page);System.out.println(page);
		
		model.addAttribute("tottalPage",totalPage);
		System.out.println(totalPage);
		model.addAttribute("allproduct",pageproduct);
		return "products/shop";
	}
	
	@RequestMapping("/{Gender}") // tim kiem theo gioi tinh
	public String GenderShop(@PathVariable("Gender") String Gender,HttpServletRequest request,ModelMap model) {
		ArrayList<SaleOderDetail> cart = (ArrayList<SaleOderDetail>) request.getSession().getAttribute("cart");
		if(cart == null) {
			System.out.println("deo co san pham");
		}else {
			System.out.println("San pham trong gio hang la");
			System.out.println(cart.size());
		}
		List<Products> pageproduct = this.pageproductGender(0,Gender);
		List<Products> allproduct = this.Allproduct();
		int totalPage = allproduct.size()/12;
		Users user = (Users) request.getSession().getAttribute("user");
		if(user != null) {
			System.out.println(user.getEmail().toString());
			model.addAttribute("user",user);
			if(user.getStatus().equalsIgnoreCase("admin")) {
				model.addAttribute("admin",user.getStatus());
			}
		}
		model.addAttribute("type",Gender);
		model.addAttribute("page",1);
		model.addAttribute("tottalPage",totalPage);
		System.out.println(totalPage);
		model.addAttribute("allproduct",pageproduct);
		return "products/shop";
	}
	
	
	@RequestMapping("/{Gender}/page-{page}") // phan trang theo gioi tinh
	public String GenderShop2(@PathVariable("Gender") String Gender,@PathVariable("page") int page,HttpServletRequest request,ModelMap model) {
		int skip = (page - 1) * 12;
		List<Products> pageproduct = this.pageproductGender(skip,Gender);
		List<Products> allproduct = this.Allproduct();
		int totalPage = allproduct.size()/12;
		Users user = (Users) request.getSession().getAttribute("user");
		if(user != null) {
			System.out.println(user.getEmail().toString());
			model.addAttribute("user",user);
			if(user.getStatus().equalsIgnoreCase("admin")) {
				model.addAttribute("admin",user.getStatus());
			}
		}
		model.addAttribute("type",Gender);
		System.out.println(page);
		model.addAttribute("page",page);
		model.addAttribute("tottalPage",totalPage);
		System.out.println(totalPage);
		model.addAttribute("allproduct",pageproduct);
		return "products/shop";
	}
	
	
	public List<Products> pageproduct(int number){
		Session session = factory.getCurrentSession();
		String hql = "from Products"; // Users la lay tu entity
		Query query = session.createQuery(hql).setFirstResult(number).setMaxResults(12);
		List<Products> list = query.list() ;
		return list;
	}
	
	
	public List<Products> pageproductGender(int number,String Gender){
		Session session = factory.getCurrentSession();
		String hql = "from Products Where GENDERBAG = :Gender OR TYPEPRODUCTID = :Gender"; // Users la lay tu entity
		Query query = session.createQuery(hql).setFirstResult(number).setMaxResults(12);
		query.setParameter("Gender", Gender);
		List<Products> list = query.list() ;
		return list;
	}
	
	public List<Products> Allproduct(){
		Session session = factory.getCurrentSession();
		String hql = "from Products"; // Users la lay tu entity
		Query query = session.createQuery(hql);
		List<Products> list = query.list() ;
		return list;
	}
}
