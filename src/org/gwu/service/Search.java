package org.gwu.service;

import java.util.List;

import org.gwu.model.Music;
import org.gwu.model.Strategy;

public class Search {
	private Strategy strategy;
	
	public Search(Strategy _strategy){
		this.strategy = _strategy;
	}
	
	public List<Music> doSearch(String name, String artist, String album, String category, int year, int pace){
		return strategy.search(name, artist, album, category, year, pace);
	}
}
