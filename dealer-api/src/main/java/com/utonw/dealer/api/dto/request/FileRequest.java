package com.utonw.dealer.api.dto.request;

import java.io.Serializable;

public class FileRequest implements Serializable {

	private String fileName;
	private String fileKey;
	private String linkId;
	private String filePath;
	private String fileSource;
	
	
	
	public String getFileSource() {
		return fileSource;
	}

	public void setFileSource(String fileSource) {
		this.fileSource = fileSource;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileKey() {
		return fileKey;
	}

	public void setFileKey(String fileKey) {
		this.fileKey = fileKey;
	}

	public String getLinkId() {
		return linkId;
	}

	public void setLinkId(String linkId) {
		this.linkId = linkId;
	}

}
