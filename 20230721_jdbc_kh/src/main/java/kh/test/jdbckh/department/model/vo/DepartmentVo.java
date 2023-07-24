package kh.test.jdbckh.department.model.vo;

public class DepartmentVo {

//			DEPARTMENT_NO   NOT NULL VARCHAR2(10) 
//			DEPARTMENT_NAME NOT NULL VARCHAR2(40) 
//			CATEGORY                 VARCHAR2(40) 
//			OPEN_YN                  CHAR(1)      
//			CAPACITY                 NUMBER 
	
	private String Department_No;
	private String Department_Name;
	private String category;
	private String open_Yn;
	private String capacity;
	@Override
	public String toString() {
		return "DepartmentVo [Department_No=" + Department_No + ", Department_Name=" + Department_Name + ", category="
				+ category + ", open_Yn=" + open_Yn + ", capacity=" + capacity + "]";
	}
	public String getDepartment_No() {
		return Department_No;
	}
	public void setDepartment_No(String department_No) {
		Department_No = department_No;
	}
	public String getDepartment_Name() {
		return Department_Name;
	}
	public void setDepartment_Name(String department_Name) {
		Department_Name = department_Name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOpen_Yn() {
		return open_Yn;
	}
	public void setOpen_Yn(String open_Yn) {
		this.open_Yn = open_Yn;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	
	
	
	
	
}
