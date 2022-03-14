package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PRODUCTTYPE")
public class ProductType {
	@Id
	@Column(name="TYPEPRODUCTID")
	private String id;
	@Column(name="TYPEPRODUCTNAME")
	private String typename;
	
	public ProductType() {
		super();
	}
	public ProductType(String id, String typename) {
		super();
		this.id = id;
		this.typename = typename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	
}
