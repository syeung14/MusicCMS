package org.gwu.service;

import java.util.List;

import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.gwu.dao.DataAccess;
import org.gwu.dao.IMusicDao;
import org.gwu.model.Album;
import org.gwu.model.Music;
import org.gwu.service.command.ICommand;
import org.gwu.service.command.CommandFactory;
import org.gwu.service.search.MusicCriteria;
import org.gwu.utils.PropManager;

@Path("/music")
public class MusicService extends AbstractService {	
	String searchType = PropManager.getInstance().getProperty("search.strategy");
	
	/*
	 * Get the music which are newly added to the database
	 * @QueryParam count: the number of music returned
	 */
	@GET
	@Produces("application/xml")
	public List<Music> getNew(@DefaultValue("5") @QueryParam("count") int count) {
		IMusicDao md = DataAccess.getMusicDao();
		System.out.println(searchType);
		return md.getNew(count);
	}
	
	/*
	 * Get one user's favorite music
	 * @QueryParam name: username
	 */
	@GET
	@Path("/favorite")
	@Produces("application/xml")
	public List<Music> getFavorite(@DefaultValue("") @QueryParam("name") String name) {
		IMusicDao md=DataAccess.getMusicDao();
		return md.getFavorite(name);
	}
	
	/*
	 * Get one user's album list
	 * @QueryParam name: username
	 */
	@GET
	@Path("/album")
	@Produces("application/xml")
	public List<Album> getAlbum(@DefaultValue("") @QueryParam("name") String name) {
		IMusicDao md=DataAccess.getMusicDao();
		return md.getAlbum(name);
	}
	
	/*
	 * Get one album's music list
	 * @PathParam albumid: the id of one album
	 */
	@GET
	@Path("/album/{albumid}")
	@Produces("application/xml")
	public List<Music> getAllFromAlbum(@DefaultValue("0") @PathParam("albumid") int id) {
		IMusicDao md=DataAccess.getMusicDao();
		return md.getAllFromAlbum(id);
	}
	
	/*
	 * Search for music according to some conditions
	 * @QueryParam name: the name of the target music
	 * @QueryParam artist: the artist name of the target music
	 * @QueryParam album: the name of the album which contains the target music
	 * @QueryParam category: the category in which the target music belonged
	 * @QueryParam year: the year when the target music published
	 * @QueryParam pace: the pace of the target music
	 */
	@GET
	@Path("/search")
	@Produces("application/xml")
	public List<Music> search(@DefaultValue("") @QueryParam("name") String name, 
			@DefaultValue("") @QueryParam("artist") String artist,
			@DefaultValue("") @QueryParam("album") String album,
			@DefaultValue("") @QueryParam("category") String category,
			@DefaultValue("0") @QueryParam("year") int year,
			@DefaultValue("0") @QueryParam("pace") int pace) {		

		MusicCriteria criteria = new MusicCriteria.Builder()
				.setName(name).setArtist(artist)
				.setCategory(category).setAlbum(album)
				.setYear(year).setPace(pace).Build();		
		
		ICommand<List<Music>> s = CommandFactory.getCommand(searchType, criteria);
		s.execute();
		return s.getResult();
	}
}
