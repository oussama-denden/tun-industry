package JsonModel;

public class ActivityBranchJson {
	
	private long activityBranchId;
	private long sectorId;
	private String activityName;
	
	public ActivityBranchJson() {

	}

	public ActivityBranchJson(long activityBranchId, long sectorId, String activityName) {
		super();
		this.activityBranchId = activityBranchId;
		this.sectorId = sectorId;
		this.activityName = activityName;
	}
	
	public long getActivityBranchId() {
		return activityBranchId;
	}

	public void setActivityBranchId(long activityBranchId) {
		this.activityBranchId = activityBranchId;
	}

	public long getSectorId() {
		return sectorId;
	}

	public void setSectorId(long sectorId) {
		this.sectorId = sectorId;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
	
	
}
