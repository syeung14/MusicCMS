package org.gwu.service.command;

import org.gwu.service.search.Criteria;
import org.gwu.service.search.FuzzySearchStrategy;
import org.gwu.service.search.PreciseSearchStrategy;
import org.gwu.service.search.SearchCommand;

public class CommandFactory {
	
	public static ICommand getCommand(String type, Criteria criteria) {
		
		if(type.compareToIgnoreCase("Precise")==0)
			return new SearchCommand(new PreciseSearchStrategy(),criteria);
		else if (type.compareToIgnoreCase("fuzzy") ==0){ 
			return new SearchCommand(new FuzzySearchStrategy(),criteria);	
		} else {
			return new NotFoundCommand();
		}
		
	}
}
