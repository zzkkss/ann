package com.gw.model.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the work table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="work"
 */

public abstract class BaseWork  implements Serializable {

	public static String REF = "Work";
	public static String PROP_CONTENT = "Content";
	public static String PROP_QUANTITY = "Quantity";
	public static String PROP_ID = "Id";
	public static String PROP_PLACE = "Place";
	public static String PROP_IMGPATH = "Imgpath";
	public static String PROP_NAME = "Name";
	public static String PROP_ADDTIME = "Addtime";


	// constructors
	public BaseWork () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseWork (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String name;
	private java.lang.String place;
	private java.lang.Integer quantity;
	private java.util.Date addtime;
	private java.lang.String imgpath;
	private java.lang.String content;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="native"
     *  column="id"
     */
	public java.lang.Integer getId () {
		return id;
	}

	/**
	 * Set the unique identifier of this class
	 * @param id the new ID
	 */
	public void setId (java.lang.Integer id) {
		this.id = id;
		this.hashCode = Integer.MIN_VALUE;
	}




	/**
	 * Return the value associated with the column: name
	 */
	public java.lang.String getName () {
		return name;
	}

	/**
	 * Set the value related to the column: name
	 * @param name the name value
	 */
	public void setName (java.lang.String name) {
		this.name = name;
	}



	/**
	 * Return the value associated with the column: place
	 */
	public java.lang.String getPlace () {
		return place;
	}

	/**
	 * Set the value related to the column: place
	 * @param place the place value
	 */
	public void setPlace (java.lang.String place) {
		this.place = place;
	}



	/**
	 * Return the value associated with the column: quantity
	 */
	public java.lang.Integer getQuantity () {
		return quantity;
	}

	/**
	 * Set the value related to the column: quantity
	 * @param quantity the quantity value
	 */
	public void setQuantity (java.lang.Integer quantity) {
		this.quantity = quantity;
	}



	/**
	 * Return the value associated with the column: addtime
	 */
	public java.util.Date getAddtime () {
		return addtime;
	}

	/**
	 * Set the value related to the column: addtime
	 * @param addtime the addtime value
	 */
	public void setAddtime (java.util.Date addtime) {
		this.addtime = addtime;
	}



	/**
	 * Return the value associated with the column: imgpath
	 */
	public java.lang.String getImgpath () {
		return imgpath;
	}

	/**
	 * Set the value related to the column: imgpath
	 * @param imgpath the imgpath value
	 */
	public void setImgpath (java.lang.String imgpath) {
		this.imgpath = imgpath;
	}



	/**
	 * Return the value associated with the column: content
	 */
	public java.lang.String getContent () {
		return content;
	}

	/**
	 * Set the value related to the column: content
	 * @param content the content value
	 */
	public void setContent (java.lang.String content) {
		this.content = content;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.gw.model.Work)) return false;
		else {
			com.gw.model.Work work = (com.gw.model.Work) obj;
			if (null == this.getId() || null == work.getId()) return false;
			else return (this.getId().equals(work.getId()));
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