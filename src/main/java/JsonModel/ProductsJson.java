package JsonModel;

public class ProductsJson {
	
	private long productsId;
	private long activityBranchId;
	private String productsName;
	
	public ProductsJson() {

	}

	public ProductsJson(long productsId, long activityBranchId, String productsName) {
		super();
		this.productsId = productsId;
		this.activityBranchId = activityBranchId;
		this.productsName = productsName;
	}

	public long getProductsId() {
		return productsId;
	}

	public void setProductsId(long productsId) {
		this.productsId = productsId;
	}

	public long getActivityBranchId() {
		return activityBranchId;
	}

	public void setActivityBranchId(long activityBranchId) {
		this.activityBranchId = activityBranchId;
	}

	public String getProductsName() {
		return productsName;
	}

	public void setProductsName(String productsName) {
		this.productsName = productsName;
	}
	
	

}
