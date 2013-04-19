package JsonModel;

public class SectorJson {
	
	private long sectorId;
	private String sectorName;
	
	
	public SectorJson() {

	}

	public SectorJson(long sectorId, String sectorName) {
		super();
		this.sectorId = sectorId;
		this.sectorName = sectorName;
	}
	
	

	public long getSectorId() {
		return sectorId;
	}

	public void setSectorId(long sectorId) {
		this.sectorId = sectorId;
	}

	public String getSectorName() {
		return sectorName;
	}

	public void setSectorName(String sectorName) {
		this.sectorName = sectorName;
	}
	
	

}
