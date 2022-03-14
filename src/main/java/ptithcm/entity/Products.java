package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="PRODUCT")
public class Products {
	@Id
	@Column(name="PRODUCTID")
	private String productid;
	@Column(name="TYPEPRODUCTID")
	private String typeproduct;
	@Column(name="PRODUCTNAME")
	private String productname;
	@Column(name="IMAGE")
	private String img;
	@Column(name="PRICE")
	private float price;
	@Column(name="GENDERBAG")
	private String genderbag;
	@Column(name="DESCRIPTION")
	private String description;
	@Column(name="QUANTITY")
	private int quantity;
	@Column(name="SALE")
	private int sale;

	public Products() {
	}

	public Products(String productid, String typeproduct, String productname, String img, float price,
			String genderbag, String description, int quantity, int sale) {
		super();
		this.productid = productid;
		this.typeproduct = typeproduct;
		this.productname = productname;
		this.img = img;
		this.price = price;
		this.genderbag = genderbag;
		this.description = description;
		this.quantity = quantity;
		this.sale = sale;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getTypeproduct() {
		return typeproduct;
	}

	public void setTypeproduct(String typeproduct) {
		this.typeproduct = typeproduct;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getGenderbag() {
		return genderbag;
	}

	public void setGenderbag(String genderbag) {
		this.genderbag = genderbag;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}
	
}
