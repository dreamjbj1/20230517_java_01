package test1.jdbckh.sales_info.dto;

import java.sql.Date;

public class SalesInfoDto {
//
//	SALENOL NOT NULL NUMBER(8)   
//	CUSTNO  NOT NULL NUMBER(6)   
//	PCOST            NUMBER(8)   
//	AMOUNT           NUMBER(4)   
//	PRICE            NUMBER(8)   
//	PCODE            VARCHAR2(4) 
//	SDATE            DATE
	
	private int SaleNol;
	private int CustNo;
	private int Pcost;
	private int Amount;
	private int Price;
	private String Pcode;
	private Date Sdate;
	
	


	public SalesInfoDto() {
	}
	
	


	public SalesInfoDto(int saleNol, int custNo, int pcost, int amount, int price, String pcode, Date sdate) {
		super();
		this.SaleNol = saleNol;
		this.CustNo = custNo;
		this.Pcost = pcost;
		this.Amount = amount;
		this.Price = price;
		this.Pcode = pcode;
		this.Sdate = sdate;
	}




	@Override
	public String toString() {
		return "SalesInfoVo [SaleNol=" + SaleNol + ", CustNo=" + CustNo + ", Pcost=" + Pcost + ", Amount=" + Amount
				+ ", Price=" + Price + ", Pcode=" + Pcode + ", Sdate=" + Sdate + "]";
	}


	public int getSaleNol() {
		return SaleNol;
	}


	public void setSaleNol(int saleNol) {
		SaleNol = saleNol;
	}


	public int getCustNo() {
		return CustNo;
	}


	public void setCustNo(int custNo) {
		CustNo = custNo;
	}


	public int getPcost() {
		return Pcost;
	}


	public void setPcost(int pcost) {
		Pcost = pcost;
	}


	public int getAmount() {
		return Amount;
	}


	public void setAmount(int amount) {
		Amount = amount;
	}


	public int getPrice() {
		return Price;
	}


	public void setPrice(int price) {
		Price = price;
	}


	public String getPcode() {
		return Pcode;
	}


	public void setPcode(String pcode) {
		Pcode = pcode;
	}


	public Date getSdate() {
		return Sdate;
	}


	public void setSdate(Date sdate) {
		Sdate = sdate;
	}
	
	
	
}