package com.gw.model.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the products table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="products"
 */

public abstract class BaseProducts  implements Serializable {

	public static String REF = "Products";
	public static String PROP_FIRSTIMG = "Firstimg";
	public static String PROP_TYPE = "Type";
	public static String PROP_CAPACITY = "Capacity";
	public static String PROP_CONTENT = "Content";
	public static String PROP_ID = "Id";
	public static String PROP_IMGPATH = "Imgpath";
	public static String PROP_AD2 = "Ad2";
	public static String PROP_NAME = "Name";
	public static String PROP_ENAME = "Ename";
	public static String PROP_AD1 = "Ad1";
	public static String PROP_ADDTIME = "Addtime";


	// constructors
	public BaseProducts () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseProducts (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String name;
	private java.lang.String imgpath;
	private java.lang.String ename;
	private java.lang.String ad1;
	private java.lang.String ad2;
	private java.lang.String type;
	private java.util.Date addtime;
	private java.lang.String content;
	private java.lang.String capacity;
	private java.lang.String firstimg;



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
	 * Return the value associated with the column: ename
	 */
	public java.lang.String getEname () {
		return ename;
	}

	/**
	 * Set the value related to the column: ename
	 * @param ename the ename value
	 */
	public void setEname (java.lang.String ename) {
		this.ename = ename;
	}



	/**
	 * Return the value associated with the column: ad1
	 */
	public java.lang.String getAd1 () {
		return ad1;
	}

	/**
	 * Set the value related to the column: ad1
	 * @param ad1 the ad1 value
	 */
	public void setAd1 (java.lang.String ad1) {
		this.ad1 = ad1;
	}



	/**
	 * Return the value associated with the column: ad2
	 */
	public java.lang.String getAd2 () {
		return ad2;
	}

	/**
	 * Set the value related to the column: ad2
	 * @param ad2 the ad2 value
	 */
	public void setAd2 (java.lang.String ad2) {
		this.ad2 = ad2;
	}



	/**
	 * Return the value associated with the column: type
	 */
	public java.lang.String getType () {
		return type;
	}

	/**
	 * Set the value related to the column: type
	 * @param type the type value
	 */
	public void setType (java.lang.String type) {
		this.type = type;
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



	/**
	 * Return the value associated with the column: capacity
	 */
	public java.lang.String getCapacity () {
		return capacity;
	}

	/**
	 * Set the value related to the column: capacity
	 * @param capacity the capacity value
	 */
	public void setCapacity (java.lang.String capacity) {
		this.capacity = capacity;
	}



	/**
	 * Return the value associated with the column: firstimg
	 */
	public java.lang.String getFirstimg () {
		return firstimg;
	}

	/**
	 * Set the value related to the column: firstimg
	 * @param firstimg the firstimg value
	 */
	public void setFirstimg (java.lang.String firstimg) {
		this.firstimg = firstimg;
	}




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.gw.model.Products)) return false;
		else {
			com.gw.model.Products products = (com.gw.model.Products) obj;
			if (null == this.getId() || null == products.getId()) return false;
			else return (this.getId().equals(products.getId()));
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