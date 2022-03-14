package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SALEORDER")
public class SaleOrder {
	
	@Id
	@Column(name="SALEORDERID")
	private String saleorderid;
	@Column(name="EMAIL")
	private String email;
	@Column(name="SALEDATE")
	private String saledate;
	@Column(name="SALEORDERSTATUS")
	private String salestatus;
	@Column(name="TOTALAMOUNT")
	private float total;
	
	public SaleOrder() {
	}
	public SaleOrder(String saleorderid, String email, String saledate, String salestatus, float total) {
		this.saleorderid = saleorderid;
		this.email = email;
		this.saledate = saledate;
		this.salestatus = salestatus;
		this.total = total;
	}
	public String getSaleorderid() {
		return saleorderid;
	}
	public void setSaleorderid(String saleorderid) {
		this.saleorderid = saleorderid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSaledate() {
		return saledate;
	}
	public void setSaledate(String saledate) {
		this.saledate = saledate;
	}
	public String getSalestatus() {
		return salestatus;
	}
	public void setSalestatus(String salestatus) {
		this.salestatus = salestatus;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	
}
