package JsonModel;

import java.util.Date;

public class CompanyJson {
	
	private long companyId;
	
	private long productsId;
	
	private String denomination;

    private String companyName;

    private String responsible;

    private String factoryAddress;

    private String governorate;

    private String phones;

    private String faxes;

    private String email;

    private String url;

    private String regime;

    private String ppe;
    
    private Date intoProduction;

    private double capital;

    private long workersNum;
    
    public CompanyJson() {

	}

	public CompanyJson(long companyId, long productsId, String denomination,
			String companyName, String responsible, String factoryAddress,
			String governorate, String phones, String faxes, String email,
			String url, String regime, String ppe, Date intoProduction,
			double capital, long workersNum) {
		super();
		this.companyId = companyId;
		this.productsId = productsId;
		this.denomination = denomination;
		this.companyName = companyName;
		this.responsible = responsible;
		this.factoryAddress = factoryAddress;
		this.governorate = governorate;
		this.phones = phones;
		this.faxes = faxes;
		this.email = email;
		this.url = url;
		this.regime = regime;
		this.ppe = ppe;
		this.intoProduction = intoProduction;
		this.capital = capital;
		this.workersNum = workersNum;
	}

	public long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(long companyId) {
		this.companyId = companyId;
	}

	public long getProductsId() {
		return productsId;
	}

	public void setProductsId(long productsId) {
		this.productsId = productsId;
	}

	public String getDenomination() {
		return denomination;
	}

	public void setDenomination(String denomination) {
		this.denomination = denomination;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getResponsible() {
		return responsible;
	}

	public void setResponsible(String responsible) {
		this.responsible = responsible;
	}

	public String getFactoryAddress() {
		return factoryAddress;
	}

	public void setFactoryAddress(String factoryAddress) {
		this.factoryAddress = factoryAddress;
	}

	public String getGovernorate() {
		return governorate;
	}

	public void setGovernorate(String governorate) {
		this.governorate = governorate;
	}

	public String getPhones() {
		return phones;
	}

	public void setPhones(String phones) {
		this.phones = phones;
	}

	public String getFaxes() {
		return faxes;
	}

	public void setFaxes(String faxes) {
		this.faxes = faxes;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRegime() {
		return regime;
	}

	public void setRegime(String regime) {
		this.regime = regime;
	}

	public String getPpe() {
		return ppe;
	}

	public void setPpe(String ppe) {
		this.ppe = ppe;
	}

	public Date getIntoProduction() {
		return intoProduction;
	}

	public void setIntoProduction(Date intoProduction) {
		this.intoProduction = intoProduction;
	}

	public double getCapital() {
		return capital;
	}

	public void setCapital(double capital) {
		this.capital = capital;
	}

	public long getWorkersNum() {
		return workersNum;
	}

	public void setWorkersNum(long workersNum) {
		this.workersNum = workersNum;
	}
    
    

}
