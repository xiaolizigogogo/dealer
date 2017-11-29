package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wangyj
 * @since 2017-07-18
 */

public class CarInspectionEntity implements Serializable {

	/**
    *
    */
   private static final long serialVersionUID = 1L;
   private String realname;
   public String getRealname() {
	   return realname;
   }
   public void setRealname(String realname) {
	   this.realname = realname;
   }

}
