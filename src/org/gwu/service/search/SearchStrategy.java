package org.gwu.service.search;

import java.util.List;

import org.gwu.model.Music;

public interface SearchStrategy {
	public List<Music> search(Criteria criteria);
}
