package org.gwu.model;

import java.util.List;

public interface Strategy {
	public List<Music> search(String name, String artist, String album, String category, int year, int pace);
}
