package org.gwu.service;

import java.util.List;

import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import org.gwu.dao.MusicDAO;
import org.gwu.model.Music;

@Path("/music")
public class MusicService extends AbstractService {	
	@GET
	@Produces("application/xml")
	public List<Music> getNew(@DefaultValue("5") @QueryParam("count") int count) {
		MusicDAO md=new MusicDAO();
		return md.getNew(count);
	}
	
	@GET
	@Path("/favorite")
	@Produces("application/xml")
	public List<Music> getFavorite(@DefaultValue("") @QueryParam("name") String name) {
		MusicDAO md=new MusicDAO();
		return md.getFavorite(name);
	}
}
