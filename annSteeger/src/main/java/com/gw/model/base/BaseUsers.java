package com.gw.model.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the users table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="users"
 */

public abstract class BaseUsers  implements Serializable {

	public static String REF = "Users";
	public static String PROP_ENABLED = "Enabled";
	public static String PROP_ID = "Id";
	public static String PROP_PASSWORD = "Password";


	// constructors
	public BaseUsers () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseUsers (java.lang.String id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.String id;

	// fields
	private boolean enabled;
	private java.lang.String password;

	// collections
	private java.util.Set<com.gw.model.Authorities> authorities;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="native"
     *  column="username"
     */
	public java.lang.String getId () {
		return id;
	}

	/**
	 * Set the unique identifier of this class
	 * @param id the new ID
	 */
	public void setId (java.lang.String id) {
		this.id = id;
		this.hashCode = Integer.MIN_VALUE;
	}




	/**
	 * Return the value associated with the column: enabled
	 */
	public boolean isEnabled () {
		return enabled;
	}

	/**
	 * Set the value related to the column: enabled
	 * @param enabled the enabled value
	 */
	public void setEnabled (boolean enabled) {
		this.enabled = enabled;
	}



	/**
	 * Return the value associated with the column: password
	 */
	public java.lang.String getPassword () {
		return password;
	}

	/**
	 * Set the value related to the column: password
	 * @param password the password value
	 */
	public void setPassword (java.lang.String password) {
		this.password = password;
	}



	/**
	 * Return the value associated with the column: Authorities
	 */
	public java.util.Set<com.gw.model.Authorities> getAuthorities () {
		return authorities;
	}

	/**
	 * Set the value related to the column: Authorities
	 * @param authorities the Authorities value
	 */
	public void setAuthorities (java.util.Set<com.gw.model.Authorities> authorities) {
		this.authorities = authorities;
	}

	public void addToAuthorities (com.gw.model.Authorities authorities) {
		if (null == getAuthorities()) setAuthorities(new java.util.TreeSet<com.gw.model.Authorities>());
		getAuthorities().add(authorities);
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.gw.model.Users)) return false;
		else {
			com.gw.model.Users users = (com.gw.model.Users) obj;
			if (null == this.getId() || null == users.getId()) return false;
			else return (this.getId().equals(users.getId()));
		}
	}

	public int hashCode () {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getId()) return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":" + this.getId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}


	public String toString () {
		return super.toString();
	}


}