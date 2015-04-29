package org.gwu.dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.gwu.dao.AbstractDAO;
import org.gwu.dao.IMusicDao;
import org.gwu.db.DataBaseManager;
import org.gwu.model.Album;
import org.gwu.model.Music;
import org.gwu.service.search.Criteria;
import org.gwu.service.search.MusicCriteria;

public class MySqlMusicDao extends AbstractDAO implements IMusicDao {
	
	/*
	 * Get one user's favorite music
	 * @param username
	 */
	/* (non-Javadoc)
	 * @see org.gwu.dao.IMusicDao#getFavorite(java.lang.String)
	 */
	@Override
	public List<Music> getFavorite(String username){
		List<Music> favo = new ArrayList<Music>();
		if(username.equals("")){
			return favo;
		}
		
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		try{
			String selectSql = "select id, name, duration, artist, album, category, year, lyric, resource, pace "
					+ "from favorite inner join music on favorite.music_id = music.id "
					+ "where favorite.user_id = (select userid from user where username=?)";
			st=conn.prepareStatement(selectSql);
			st.setString(1,username); 

			rs=st.executeQuery();
			while(rs.next()){
				Music m = new Music();
				m.setId(rs.getInt(1));
				m.setName(rs.getString(2));
				m.setDuration(rs.getString(3));
				m.setArtist(rs.getString(4));
				m.setAlbum(rs.getString(5));
				m.setCategory(rs.getString(6));
				m.setYear(rs.getInt(7));
				m.setLyric(rs.getString(8));
				m.setResource(rs.getString(9));
				m.setPace(rs.getInt(10));
				favo.add(m);
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("error in getFavorite():",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return favo;
	}
	
	/*
	 * Get the music which are newly added to the database
	 * @param count: the number of music returned
	 */
	/* (non-Javadoc)
	 * @see org.gwu.dao.IMusicDao#getNew(int)
	 */
	@Override
	public List<Music> getNew(int count){
		List<Music> newest = new ArrayList<Music>();
		
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		try{
			String selectSql = "select id, name, duration, artist, album, category, year, lyric, resource, pace "
					+ "from music where id > (select max(id) from music)-?";
			st=conn.prepareStatement(selectSql);
			st.setInt(1,count); 

			rs=st.executeQuery();
			while(rs.next()){
				Music m = new Music();
				m.setId(rs.getInt(1));
				m.setName(rs.getString(2));
				m.setDuration(rs.getString(3));
				m.setArtist(rs.getString(4));
				m.setAlbum(rs.getString(5));
				m.setCategory(rs.getString(6));
				m.setYear(rs.getInt(7));
				m.setLyric(rs.getString(8));
				m.setResource(rs.getString(9));
				m.setPace(rs.getInt(10));
				newest.add(m);
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("error in getNew():",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return newest;
	}
	
	/*
	 * Precisely search for music according to some conditions
	 * @param name: the name of the target music
	 * @param artist: the artist name of the target music
	 * @param album: the name of the album which contains the target music
	 * @param category: the category in which the target music belonged
	 * @param year: the year when the target music published
	 * @param pace: the pace of the target music
	 */
	/* (non-Javadoc)
	 * @see org.gwu.dao.IMusicDao#preciseSearch(java.lang.String, java.lang.String, java.lang.String, java.lang.String, int, int)
	 */
	@Override
	public List<Music> preciseSearch(Criteria criteria){
		List<Music> newest = new ArrayList<Music>();
		
		MusicCriteria ca = (MusicCriteria)criteria;
		
		String name = ca.getName();
		String artist = ca.getArtist();
		String album = ca.getAlbum();
		String category = ca.getCategory();
		int year = ca.getYear();
		int pace = ca.getPace();
		
		int conditionCount = 0;
		if(!name.equals(""))
			conditionCount++;
		if(!artist.equals(""))
			conditionCount++;
		if(!album.equals(""))
			conditionCount++;
		if(!category.equals(""))
			conditionCount++;
		if(year != 0)
			conditionCount++;
		if(pace != 0)
			conditionCount++;
		if(conditionCount == 0)
			return getNew(5);
		
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		try{
			String selectSql = "select id, name, duration, artist, album, category, year, lyric, resource, pace "
					+ "from music where ";
			if(!name.equals("")){
				selectSql += ("name='" + name + "' ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(!artist.equals("")){
				selectSql += ("artist='" + artist + "' ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(!album.equals("")){
				selectSql += ("album='" + album + "' ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(!category.equals("")){
				selectSql += ("category='" + category + "' ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(year != 0){
				selectSql += ("year=" + year + " ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(pace != 0){
				selectSql += ("pace=" + pace + " ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
			System.out.println(selectSql);
			st=conn.prepareStatement(selectSql);
			rs=st.executeQuery();
			while(rs.next()){
				Music m = new Music();
				m.setId(rs.getInt(1));
				m.setName(rs.getString(2));
				m.setDuration(rs.getString(3));
				m.setArtist(rs.getString(4));
				m.setAlbum(rs.getString(5));
				m.setCategory(rs.getString(6));
				m.setYear(rs.getInt(7));
				m.setLyric(rs.getString(8));
				m.setResource(rs.getString(9));
				m.setPace(rs.getInt(10));
				newest.add(m);
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("error in search():",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return newest;
	}
	
	/*
	 * Fuzzy search for music according to some conditions
	 * @param name: the name of the target music
	 * @param artist: the artist name of the target music
	 * @param album: the name of the album which contains the target music
	 * @param category: the category in which the target music belonged
	 * @param year: the year when the target music published
	 * @param pace: the pace of the target music
	 */
	/* (non-Javadoc)
	 * @see org.gwu.dao.IMusicDao#fuzzySearch(java.lang.String, java.lang.String, java.lang.String, java.lang.String, int, int)
	 */
	@Override
	public List<Music> fuzzySearch(Criteria criteria){
		List<Music> newest = new ArrayList<Music>();
		
		MusicCriteria ca = (MusicCriteria)criteria;
		
		String name = ca.getName();
		String artist = ca.getArtist();
		String album = ca.getAlbum();
		String category = ca.getCategory();
		int year = ca.getYear();
		int pace = ca.getPace();
		
		int conditionCount = 0;
		if(!name.equals(""))
			conditionCount++;
		if(!artist.equals(""))
			conditionCount++;
		if(!album.equals(""))
			conditionCount++;
		if(!category.equals(""))
			conditionCount++;
		if(year != 0)
			conditionCount++;
		if(pace != 0)
			conditionCount++;
		if(conditionCount == 0)
			return getNew(5);
		
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		try{
			String selectSql = "select id, name, duration, artist, album, category, year, lyric, resource, pace "
					+ "from music where ";
			if(!name.equals("")){
				selectSql += ("name like'%" + name + "%' ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(!artist.equals("")){
				selectSql += ("artist like'%" + artist + "%' ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(!album.equals("")){
				selectSql += ("album like'%" + album + "%' ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(!category.equals("")){
				selectSql += ("category='" + category + "' ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(year != 0){
				selectSql += ("year between " + (year-5) + " and " + (year+5) + " ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
				
			if(pace != 0){
				selectSql += ("pace between " + (pace-5) + " and " + (pace+5) + " ");
				if(conditionCount>1){
					selectSql += "and ";
					conditionCount--;
				}
			}
			System.out.println(selectSql);
			st=conn.prepareStatement(selectSql);
			rs=st.executeQuery();
			while(rs.next()){
				Music m = new Music();
				m.setId(rs.getInt(1));
				m.setName(rs.getString(2));
				m.setDuration(rs.getString(3));
				m.setArtist(rs.getString(4));
				m.setAlbum(rs.getString(5));
				m.setCategory(rs.getString(6));
				m.setYear(rs.getInt(7));
				m.setLyric(rs.getString(8));
				m.setResource(rs.getString(9));
				m.setPace(rs.getInt(10));
				newest.add(m);
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("error in search():",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return newest;
	}
	
	/*
	 * Get one user's album list
	 * @param username
	 */
	/* (non-Javadoc)
	 * @see org.gwu.dao.IMusicDao#getAlbum(java.lang.String)
	 */
	@Override
	public List<Album> getAlbum(String username){
		List<Album> albums = new ArrayList<Album>();
		
		if(username.equals("")){
			return albums;
		}
		
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		try{
			String selectSql = "select id, name, artist, year, track "
					+ "from user_album inner join album on user_album.album_id = album.id "
					+ "where user_album.user_id = (select userid from user where username=?)";
			st=conn.prepareStatement(selectSql);
			st.setString(1,username); 

			rs=st.executeQuery();
			while(rs.next()){
				Album a = new Album();
				a.setId(rs.getInt(1));
				a.setName(rs.getString(2));				
				a.setArtist(rs.getString(3));				
				a.setYear(rs.getInt(4));
				a.setTrack(rs.getInt(5));
				albums.add(a);
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("error in getAlbum():",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return albums;
	}
	
	/*
	 * Get one album's music list
	 * @param albumid: the id of one album
	 */
	/* (non-Javadoc)
	 * @see org.gwu.dao.IMusicDao#getAllFromAlbum(int)
	 */
	@Override
	public List<Music> getAllFromAlbum(int albumId){
		List<Music> all = new ArrayList<Music>();
		
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		try{
			String selectSql = "select id, name, duration, artist, album, category, year, lyric, resource, pace "
					+ "from music where album=(select name from album where id=?)";
			st=conn.prepareStatement(selectSql);
			st.setInt(1, albumId); 

			rs=st.executeQuery();
			while(rs.next()){
				Music m = new Music();
				m.setId(rs.getInt(1));
				m.setName(rs.getString(2));
				m.setDuration(rs.getString(3));
				m.setArtist(rs.getString(4));
				m.setAlbum(rs.getString(5));
				m.setCategory(rs.getString(6));
				m.setYear(rs.getInt(7));
				m.setLyric(rs.getString(8));
				m.setResource(rs.getString(9));
				m.setPace(rs.getInt(10));
				all.add(m);
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("error in getAllFromAlbum():",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return all;
	}
}
