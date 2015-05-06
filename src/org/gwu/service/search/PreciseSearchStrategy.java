package org.gwu.service.search;

import java.util.List;

import org.gwu.dao.DataAccess;
import org.gwu.dao.IMusicDao;
import org.gwu.model.Music;

public class PreciseSearchStrategy implements SearchStrategy{
	
	@Override
	public List<Music> search(Criteria criteria) {
		// TODO Auto-generated method stub
		IMusicDao md= DataAccess.getMusicDao();
		return md.preciseSearch(criteria);
	}
	
}
