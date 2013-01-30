package org.jboss.qa;

import org.jboss.crypto.CryptoUtil;

public class HasherData {
	private String userName;
	private String password;
	private String realmName;

	public String getTextUsername() {
		return userName;
	}

	public void setTextUsername(String text) {
		this.userName = text;
	}
	
	public String getTextPassword() {
		return password;
	}

	public void setTextPassword(String text) {
		this.password = text;
	}

	public String getSelectRealm() {
		return realmName;
	}

	public void setSelectRealm(String realm) {
		this.realmName = realm;
	}
	
	/**
	 * Inspiration from: http://middlewaremagic.com/jboss/?p=2206
	 */
	public String getHashedText() {
		String clearTextPassword = userName  + ":" + realmName + ":" + password; 
		return CryptoUtil.createPasswordHash("MD5", "hex", null, null, clearTextPassword);
	}


}
