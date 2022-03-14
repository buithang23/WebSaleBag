package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SALEORDERDETAIL")
public class SaleOderDetail {
	@Id
	@Column(name="SALEORDERID")
	private String saleorderid;
	@Column(name="PRODUCTID")
	private String productid;
	@Column(name="PRODUCTNAME")
	private String productname;
	@Column(name="PRODUCTIMG")
	private String productimg;
	@Column(name="QUANTITYPRODUCT")
	private float quantityproduct;
	@Column(name="SALEPRICE")
	private float saleprice;
	
	public SaleOderDetail() {
		super();
	}

	public SaleOderDetail(String saleorderid, String productid, String productname, String productimg,
			float quantityproduct, float saleprice) {
		super();
		this.saleorderid = saleorderid;
		this.productid = productid;
		this.productname = productname;
		this.productimg = productimg;
		this.quantityproduct = quantityproduct;
		this.saleprice = saleprice;
	}

	public String getSaleorderid() {
		return saleorderid;
	}

	public void setSaleorderid(String saleorderid) {
		this.saleorderid = saleorderid;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductimg() {
		return productimg;
	}

	public void setProductimg(String productimg) {
		this.productimg = productimg;
	}

	public float getQuantityproduct() {
		return quantityproduct;
	}

	public void setQuantityproduct(float quantityproduct) {
		this.quantityproduct = quantityproduct;
	}

	public float getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(float saleprice) {
		this.saleprice = saleprice;
	}

	
}
