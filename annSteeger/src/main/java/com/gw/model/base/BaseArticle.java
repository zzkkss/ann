package com.gw.model.base;

import java.io.Serializable;


/**
 * This is an object that contains data related to the article table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="article"
 */

public abstract class BaseArticle  implements Serializable {

	public static String REF = "Article";
	public static String PROP_TYPE = "Type";
	public static String PROP_CONTENT = "Content";
	public static String PROP_TITLE = "Title";
	public static String PROP_ID = "Id";
	public static String PROP_IMGPATH = "Imgpath";
	public static String PROP_ADDTIME = "Addtime";


	// constructors
	public BaseArticle () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseArticle (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String title;
	private java.lang.String content;
	private java.lang.String type;
	private java.util.Date addtime;
	private java.lang.String imgpath;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="native"
     *  column="Id"
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
	 * Return the value associated with the column: title
	 */
	public java.lang.String getTitle () {
		return title;
	}

	/**
	 * Set the value related to the column: title
	 * @param title the title value
	 */
	public void setTitle (java.lang.String title) {
		this.title = title;
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




	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof com.gw.model.Article)) return false;
		else {
			com.gw.model.Article article = (com.gw.model.Article) obj;
			if (null == this.getId() || null == article.getId()) return false;
			else return (this.getId().equals(article.getId()));
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