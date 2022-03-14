package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.ProductType;
import ptithcm.entity.Products;
import ptithcm.entity.SaleOderDetail;
import ptithcm.entity.Users;

@Controller
@Transactional
public class adminController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/admin")
	public String admindefault(HttpServletRequest request,ModelMap modelMap,HttpSession session) {
		Users user = (Users) request.getSession().getAttribute("user");
		if(user != null) {
			if(user.getStatus().equalsIgnoreCase("admin")) {
				modelMap.addAttribute("user",user);
				List<ProductType> allproductType = this.productType();
				List<Products> allproduct = this.Allproduct();
				modelMap.addAttribute("allproduct",allproduct);
				modelMap.addAttribute("allproductType",allproductType);
				return "admin/admin";
			}
		}
		return "other/error";

	}
	
	//--------------------------------------------------------------------------------------
	
	@RequestMapping(value="/deleteProduct",method = RequestMethod.GET) // xoa san pham vao gio hang
	public void Delete(@RequestParam String id) {
		System.out.println(id);
		boolean result = DeleteProduct(id);
		if(result) {
			System.out.println("Xoa thanh cong");
		}else {
			System.out.println("Xoa that bai");
		}
	}
	
	//-----------------------------------------------------------------------------------------
	@Autowired ServletContext context;
	@RequestMapping(value="/updateProduct" ,method = RequestMethod.POST) // xoa san pham vao gio hang
	public String update(@RequestParam("img") MultipartFile img,HttpServletRequest request) throws IllegalStateException, IOException {
		try {
			String imgPath = context.getRealPath("/resources/images/" + img.getOriginalFilename());
			img.transferTo(new File(imgPath));
			System.out.println(img.getOriginalFilename());
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("productname"));
			System.out.println(request.getParameter("description"));
			System.out.println(Float.parseFloat(request.getParameter("price")));

			boolean result = UpdateProduct(request.getParameter("id"),request.getParameter("productname"),request.getParameter("description") ,Float.parseFloat(request.getParameter("price")) , img.getOriginalFilename());
			if(result) {
				System.out.println("cap nhat thanh cong");
			}else {
				System.out.println("cap nhat that bai");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/admin.htm";
	}
	
	//--------------------------------------------------------------------------------------

	@RequestMapping(value="/NewProduct",method = RequestMethod.POST) // xoa san pham vao gio hang
	public String Insert(@RequestParam("img") MultipartFile img,HttpServletRequest request,HttpSession httpsession) {
		try {
			String imgPath = context.getRealPath("/resources/images/" + img.getOriginalFilename());
			img.transferTo(new File(imgPath));
			Boolean checkproduct = CheckProduct(request.getParameter("id"));
			if(checkproduct) {
				httpsession.setAttribute("message4", "Id product is already existed");
				return "redirect:/admin.htm";
			}else {
				String message4 =  (String) request.getSession().getAttribute("message4"); // kiem tra co thong ko, neu co thi xoa no
				if(message4 != null) {
					httpsession.removeAttribute("message4");
				}
			}
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("productname"));
			System.out.println(request.getParameter("gender"));
			System.out.println(request.getParameter("producttype"));
			System.out.println(request.getParameter("description"));
			System.out.println(Float.parseFloat(request.getParameter("price")));
			System.out.println(img.getOriginalFilename());
			Boolean result = InsertProduct(request.getParameter("id"),request.getParameter("productname"),request.getParameter("gender"),request.getParameter("producttype"),request.getParameter("description"),Float.parseFloat(request.getParameter("price")),img.getOriginalFilename());
			if(result) {
				System.out.println("them thanh cong");
			}else {
				System.out.println("them that bai");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/admin.htm";
	}
	//----------------------------------------------------------------------------------------
	
	@RequestMapping(value="/find",method = RequestMethod.POST) // xoa san pham vao gio hang
	public String find(@RequestParam String searchInput,ModelMap modelMap) {
		List<Products> allproduct = productFind(searchInput);
		modelMap.addAttribute("allproduct",allproduct);
		return "admin/admin";
	}
	//
	public List<Products> Allproduct(){
		Session session = factory.getCurrentSession();
		String hql = "from Products"; // Users la lay tu entity
		Query query = session.createQuery(hql);
		List<Products> list = query.list() ;
		return list;
	}
	public Boolean DeleteProduct(String id){ //lay san phan biet theo tui nam hay tui nu
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "from Products Where PRODUCTID = :id"; // Users la lay tu entity
		Query query  = session.createQuery(hql);
		query.setParameter("id", id);
		List<Products> productsGet = query.list();
		for (Products products : productsGet) {
			if(products.getProductid().equalsIgnoreCase(id)) {
				try {
					session.delete(products);
					t.commit();
				} catch (Exception e) {
					t.rollback();
					// TODO: handle exception
				}finally {
					session.close();
				}
				return true;
			}
		}
		return false;
	}
	
	public Boolean InsertProduct(String id,String productname,String gender,String producttype,String description,float price,String img){ //lay san phan biet theo tui nam hay tui nu
		Session session = factory.getCurrentSession();
		Products productsGet = new Products();
		productsGet.setProductid(id);
		productsGet.setTypeproduct(producttype);
		productsGet.setProductname(productname);
		productsGet.setGenderbag(gender);
		productsGet.setDescription(description);
		productsGet.setPrice(price);
		productsGet.setImg(img);
		Boolean result = (Boolean) session.save(productsGet);
		return result;
	}
	
	public Boolean UpdateProduct(String id,String productname,String description,float price,String img ){ //lay san phan biet theo tui nam hay tui nu
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String hql = "from Products Where PRODUCTID = :id"; // Users la lay tu entity
		Query query  = session.createQuery(hql);
		query.setParameter("id", id);
		List<Products> productsGet = query.list();
		for (Products products : productsGet) {
			if(products.getProductid().equalsIgnoreCase(id)) {
				products.setProductname(productname);
				products.setPrice(price);
				products.setDescription(description);
				products.setImg(img);
				try {
					session.update(products);
					t.commit();
				} catch (Exception e) {
					t.rollback();
					// TODO: handle exception
				}finally {
					session.close();
				}
				return true;
			}
		}
		return false;
	}
	
	public List<ProductType> productType(){
		Session session = factory.getCurrentSession();
		String hql = "from ProductType"; // Users la lay tu entity
		Query query = session.createQuery(hql);
		List<ProductType> list = query.list() ;
		return list;
	}
	public List<Products> productFind(String product){
		Session session = factory.getCurrentSession();
		String hql = "from Products Where PRODUCTNAME like :product"; // Users la lay tu entity
		Query query = session.createQuery(hql);
		query.setParameter("product", product);
		List<Products> list = query.list() ;
		return list;
	}
	public Boolean CheckProduct(String id){
		Session session = factory.getCurrentSession();
		String hql = "from Products Where PRODUCTID = :id"; // Users la lay tu entity
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<Products> list = query.list() ;
		if(list.size()>0) {
			return true;
		}
		return false;
	}
}
