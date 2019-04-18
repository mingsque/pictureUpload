package egovframework.example.picture.service;

import egovframework.example.cmmn.service.CmmnVO;

public class PagingVO extends CmmnVO{
	
	private long rows	= 16;

	public long getRows() {
		return rows;
	}
	public void setRows(long rows) {
		this.rows = rows;
	}
}
