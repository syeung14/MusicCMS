package org.gwu.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Message {
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
