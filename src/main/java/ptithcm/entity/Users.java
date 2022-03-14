package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name="USERLOGIN")
public class Users {
	@Id
	@Column(name="ID")
	private String id;
	@Column(name="EMAIL")
	private String email;
	@Column(name="USERNAME")
	private String username;
	@Column(name="PASS")
	private String password;
	@Column(name="STATUS")
	private String status;
	public Users() {
	}
	public Users(String id, String email, String username, String password, String status) {
		super();
		this.id = id;
		this.email = email;
		this.username = username;
		this.password = password;
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}	
