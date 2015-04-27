package org.gwu.model;

import java.util.List;

import org.gwu.dao.MusicDAO;

public class PreciseSearchStrategy implements Strategy{
	
	@Override
	public List<Music> search(String name, String artist, String album, String category, int year, int pace) {
		// TODO Auto-generated method stub
		MusicDAO md=new MusicDAO();
		return md.preciseSearch(name, artist, album, category, year, pace);
	}
	
}
