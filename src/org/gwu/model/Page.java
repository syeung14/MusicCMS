package org.gwu.model;

import java.util.List;

public class Page {
	private List<User> list;
	private int totalpage;
	private int totalrecord;
	private int pagesize = 5;
	private int pagenum;
	private int startindex;
	
	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public int getTotalrecord() {
		return totalrecord;
	}

	public void setTotalrecord(int totalrecord) {
		this.totalrecord = totalrecord;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getPagenum() {
		return pagenum;
	}

	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}

	public int getStartindex() {
		return startindex;
	}

	public void setStartindex(int startindex) {
		this.startindex = startindex;
	}

	public Page(int totalrecord, int pagenum){
		this.totalrecord = totalrecord;
		
		if(this.totalrecord%this.pagesize == 0){
			this.totalpage = this.totalrecord/this.pagesize;
		}else{
			this.totalpage = this.totalrecord/this.pagesize +1;
		}
		
		this.pagenum = pagenum;
		this.startindex = (this.pagenum-1)*this.pagesize;
	}
	
}
