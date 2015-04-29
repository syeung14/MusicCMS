package org.gwu.service.search;

import java.util.List;

import org.gwu.model.Music;

public class Search {
	private Strategy strategy;
	
	public Search(Strategy _strategy){
		this.strategy = _strategy;
	}
	
	public List<Music> doSearch(Criteria criteria){
		return strategy.search(criteria);
	}
}
