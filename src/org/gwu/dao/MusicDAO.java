package org.gwu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.gwu.db.DataBaseManager;
import org.gwu.model.Music;

public class MusicDAO extends AbstractDAO {
	public MusicDAO() {
		super();
	}
	
	public List<Music> getFavorite(String username){
		List<Music> favo = new ArrayList<Music>();
		
		if(username.equals("")){
			return getNew(3);
		}
		
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		try{
			String selectSql = "select id, name, duration, artist, album, category, year, lyric, resource "
					+ "from favorite inner join music on favorite.music_name = music.name "
					+ "where favorite.user_name = ?";
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
				favo.add(m);
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("insert error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return favo;
	}
	
	public List<Music> getNew(int count){
		List<Music> newest = new ArrayList<Music>();
		
		PreparedStatement st = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		try{
			String selectSql = "select id, name, duration, artist, album, category, year, lyric, resource "
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
				newest.add(m);
			}
			log.info(selectSql);
		}catch(SQLException e){
			log.error("insert error:",e);
			e.printStackTrace();
		}finally{
			DataBaseManager.closeStatement(st,null);
		}
		return newest;
	}
}
