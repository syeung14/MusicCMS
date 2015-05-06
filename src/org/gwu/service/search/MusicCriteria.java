package org.gwu.service.search;

public class MusicCriteria implements Criteria {
	
	private String name = "";
	private String artist = "";
	private String album = "";
	private String category = "";
	private int year = 0;
	private int pace = 0;
	
	private MusicCriteria(Builder build) {
		this.name = build.name;
		this.artist= build.artist;
		this.album = build.album;
		this.category = build.category;
		this.year = build.year;
		this.pace = build.pace;
	}
	public String getName() {
		return name;
	}
	public String getArtist() {
		return artist;
	}
	public String getAlbum() {
		return album;
	}
	public String getCategory() {
		return category;
	}
	public int getYear() {
		return year;
	}
	public int getPace() {
		return pace;
	}
	public static class Builder {
		
		private String name;
		private String artist;
		private String album;
		private String category;
		private int year;
		private int pace;
		
		public Builder(){
		}
		
		public Builder(String name){
			this.name= name;
		}
		
		public MusicCriteria Build() {
			return new MusicCriteria(this);
		}
		public Builder setName(String name) {
			this.name = name;
			return this;
		}
		public Builder setArtist(String artist) {
			this.artist = artist;
			return this;
		}
		public Builder setAlbum(String album) {
			this.album= album;
			return this;
		}
		public Builder setCategory(String category) {
			this.category=category;
			return this;
		}
		public Builder setYear(int year) {
			this.year=year;
			return this;
		}
		public Builder setPace(int pace) {
			this.pace=pace;
			return this;
		}
	}
}
