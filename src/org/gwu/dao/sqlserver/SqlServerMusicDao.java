package org.gwu.dao.sqlserver;

import java.util.List;

import org.gwu.dao.IMusicDao;
import org.gwu.model.Album;
import org.gwu.model.Music;
import org.gwu.service.search.Criteria;

import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class SqlServerMusicDao implements IMusicDao {

	@Override
	public List<Music> getFavorite(String username) {
		throw new NotImplementedException();
	}

	@Override
	public List<Music> getNew(int count) {
		throw new NotImplementedException();
	}

	@Override
	public List<Music> preciseSearch(Criteria criteria) {
		throw new NotImplementedException();
	}

	@Override
	public List<Music> fuzzySearch(Criteria criteria) {
		throw new NotImplementedException();
	}

	@Override
	public List<Album> getAlbum(String username) {
		throw new NotImplementedException();
	}

	@Override
	public List<Music> getAllFromAlbum(int albumId) {
		throw new NotImplementedException();
	}

}
