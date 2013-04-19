package JsonModel;

import java.util.List;

public class IndusResponse {
	
	private List<SectorJson> sectors;
	
	public IndusResponse() {

	}

	public IndusResponse(List<SectorJson> sectors) {
		super();
		this.sectors = sectors;
	}

	public List<SectorJson> getSectors() {
		return sectors;
	}

	public void setSectors(List<SectorJson> sectors) {
		this.sectors = sectors;
	}
	
	

}
