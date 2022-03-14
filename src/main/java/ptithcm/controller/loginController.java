package ptithcm.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ptithcm.entity.Products;
import ptithcm.entity.Users;


@Controller
@Transactional
public class loginController {
	@Autowired
	SessionFactory factory;
	
	//---------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String Login(ModelMap model,HttpSession session,HttpServletRequest request) {
		String message1 =  (String) request.getSession().getAttribute("message1"); // kiem tra co thong ko, neu co thi xoa no
		if(message1 != null) {
			session.removeAttribute("message1");
		}
		return "user/login";
	}
	
	
	//---------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/login",method = RequestMethod.POST) // form dang nhap 
	public String Userlogin(@RequestParam String emaillogin,@RequestParam String pswdlogin,HttpSession session,HttpServletRequest request) {
		System.out.println(emaillogin);
		System.out.println(pswdlogin);
		
		List<Users> userlogin = this.getUserLogin(emaillogin,pswdlogin); // lay danh sach userlogin
		System.out.println(userlogin.size());
		if(userlogin.size()==1) {
			Users user = new Users();
			user = userlogin.get(0);
			System.out.println(user.getUsername());
			session.setAttribute("user", user);  // lay thong tin user va day len session
			return "redirect:/trangchu.htm"; // tra ve giao dien trang chu
		}else {
			session.setAttribute("message1", "Email or Password is incorrest");
		}
		return "user/login";
	}
	
	//--------------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/register",method = RequestMethod.GET) // form dang ky
	public String Register(HttpServletRequest request,ModelMap modelMap,HttpSession session) {
		String message2 =  (String) request.getSession().getAttribute("message2"); // kiem tra co thong ko, neu co thi xoa no
		if(message2 != null) {
			session.removeAttribute("message2");
		}
		return "user/register";
	}
	@RequestMapping(value="/register",method = RequestMethod.POST) 
	public String RegisterSave(@RequestParam String username, @RequestParam String email,@RequestParam String pswd,ModelMap model,HttpSession session,HttpServletRequest request) {
		boolean result = this.InsertUser(email, pswd, username); // insert user moi vao
		if(!result) {
			session.setAttribute("message2", "Email is already existed");// user da ton tai thi xe hien thi ra thong bao sau
			return "user/register";
		}
		return "redirect:/login.htm";
	}
	
	//----------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/logout",method = RequestMethod.GET)// ham logout
	public void logout(HttpServletRequest request,HttpSession session) {// xoa user va tat ca thong bao
		System.out.println("ham logout");
		
		Users user = (Users) request.getSession().getAttribute("user");
		
		String message1 =  (String) request.getSession().getAttribute("message1");
		String message2 =  (String) request.getSession().getAttribute("message2");
		String message3 =  (String) request.getSession().getAttribute("message3");
		session.removeAttribute("user");
		session.removeAttribute("message1");
		session.removeAttribute("message2");
		session.removeAttribute("message3");
	}
	
	//-------------------------------------------------------------------------------------------------------
	
	@RequestMapping(value = "/forgot",method = RequestMethod.GET)// ham logout
	public String forgot(HttpServletRequest request,HttpSession session) {// xoa user va tat ca thong bao
		String message3 =  (String) request.getSession().getAttribute("message3"); // kiem tra co thong ko, neu co thi xoa no
		if(message3 != null) {
			session.removeAttribute("message3");
		}
		return "user/forgot";
	}
	
	@RequestMapping(value = "/forgot",method = RequestMethod.POST)// ham forgot
	public String forgotPass(@RequestParam String email,HttpServletRequest request,HttpSession httpsession) {// xoa user va tat ca thong bao
		List<Users> userlogin = this.Checklogin(email);
		if(userlogin.size()==0) {
			httpsession.setAttribute("message3", "Email is not existed");
			return "user/forgot";
		}else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			for (Users users : userlogin) {
				if (users.getEmail().equalsIgnoreCase(email)) {
					users.setPassword("1");
					System.out.println("-------------------------------------------------------");
					System.out.println(userlogin.get(0).getPassword());
					try {
						System.out.println("-------------------------------------------------------");
						session.update(users);
						t.commit();
					} catch (Exception e) {
						t.rollback();
						// TODO: handle exception
					}finally {
						session.close();
					}
				}
			}
			
		}
		MailForgot(userlogin.get(0).getEmail(),userlogin.get(0).getUsername());
		return "redirect:/login.htm";
	}
	
	//----------------------------------------------------------------------------------------------------------------------------
	
	public Boolean InsertUser(String email,String password,String username) {
		Session session = factory.openSession();
		Transaction t= session.beginTransaction();
		long id = System.currentTimeMillis();
		List<Users> userlogin = this.Checklogin(email); // lay danh sach userlogin de kiem tra user co ton tai khong
		if(userlogin.size()>0) {
			return false;
		}else {
			Users user = new Users();
			user.setId(String.valueOf(id));
			user.setEmail(email);
			user.setPassword(password);
			user.setUsername(username);
			user.setStatus("guest");
			String emailget = null;
			try {
				emailget = (String) session.save(user);
				t.commit();

			} catch (Exception e) {
				t.rollback();
				// TODO: handle exception
			}finally {
				session.close();
			}
			if(emailget!=null) {
				return true;
			}else {
				return false;
			}
		}
	}

	public List<Users> Checklogin(String email){ // Users la lay tu entity
		Session session = factory.getCurrentSession();
		String hql = "from Users where EMAIL = :email"; // Users la lay tu entity
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		@SuppressWarnings("unchecked")
		List<Users> list = query.list();
		session.clear();
		return list;
	}
	
	public List<Users> getUserLogin(String email,String password){ // Users la lay tu entity
		Session session = factory.getCurrentSession();
		String hql = "from Users where EMAIL = :email  AND PASS = :password  "; // Users la lay tu entity
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		query.setParameter("password", password);
		@SuppressWarnings("unchecked")
		List<Users> list = query.list();
		session.clear();
		return list;
	}
	
	public List<Products> allproduct(){
		Session session = factory.getCurrentSession();
		String hql = "from Products"; // Users la lay tu entity
		Query query = session.createQuery(hql);
		List<Products> list = query.list() ;
		session.clear();
		return list;
	}
	
	@Autowired
	JavaMailSender mailer;
	public void MailForgot(String email, String tenkh) { // ham gui mail

		String from="caloshopmail@gmail.com";
		String to= email;
		String subject="Reset PassWord";
		String body="Xin Chào "+tenkh+",chúng tôi đã reset mật khẩu của bạn thành 1. Bạn hãy thay đổi mật khẩu sau khi đăng nhập nhé !!!!";
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
 