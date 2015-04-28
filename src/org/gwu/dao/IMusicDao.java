package org.gwu.dao;

import java.util.List;

import org.gwu.model.Album;
import org.gwu.model.Music;

public interface IMusicDao {

	/*
	 * Get one user's favorite music
	 * @param username
	 */
	public abstract List<Music> getFavorite(String username);

	/*
	 * Get the music which are newly added to the database
	 * @param count: the number of music returned
	 */
	public abstract List<Music> getNew(int count);

	/*
	 * Precisely search for music according to some conditions
	 * @param name: the name of the target music
	 * @param artist: the artist name of the target music
	 * @param album: the name of the album which contains the target music
	 * @param category: the category in which the target music belonged
	 * @param year: the year when the target music published
	 * @param pace: the pace of the target music
	 */
	public abstract List<Music> preciseSearch(String name, String artist,
			String album, String category, int year, int pace);

	/*
	 * Fuzzy search for music according to some conditions
	 * @param name: the name of the target music
	 * @param artist: the artist name of the target music
	 * @param album: the name of the album which contains the target music
	 * @param category: the category in which the target music belonged
	 * @param year: the year when the target music published
	 * @param pace: the pace of the target music
	 */
	public abstract List<Music> fuzzySearch(String name, String artist,
			String album, String category, int year, int pace);

	/*
	 * Get one user's album list
	 * @param username
	 */
	public abstract List<Album> getAlbum(String username);

	/*
	 * Get one album's music list
	 * @param albumid: the id of one album
	 */
	public abstract List<Music> getAllFromAlbum(int albumId);

}