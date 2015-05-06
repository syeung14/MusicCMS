package org.gwu.service.search;

import java.util.List;

import org.gwu.model.Music;
import org.gwu.service.command.ICommand;
import org.gwu.service.command.CommandFactory;

public class SearchCommand implements ICommand<List<Music>> {
	private SearchStrategy strategy;
	private Criteria criteria;
	
	private List<Music> result;
	
	public SearchCommand(SearchStrategy _strategy, Criteria criteria){
		this.strategy = _strategy;
		this.criteria = criteria;
	}
	
	@Override
	public void execute() {
		result = strategy.search(criteria);
	}
	
	public List<Music> getResult() {
		return result;
	}
}
