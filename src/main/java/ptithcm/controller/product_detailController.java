package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.Products;

@Transactional
@Controller
public class product_detailController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("/product")
	public String productdeil(@RequestParam("id") String id,ModelMap model) {
		List<Products> products = getProduct(id);
		model.addAttribute("product",products.get(0));
		
		return "products/productdetail";
	}
	
	public List<Products> getProduct(String id){
		Session session = factory.getCurrentSession();
		String hql = "from Products Where PRODUCTID = :id"; // Users la lay tu entity
		Query query = session.createQuery(hql).setFirstResult(0).setMaxResults(10);
		query.setParameter("id", id);
		List<Products> productsGet = query.list();
		return productsGet;
	}
}
