package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 车商联络人相关
 * </p>
 *
 * @author wangyj
 * @since 2017-05-08
 */
@TableName("merchant_contactinfo")
public class MerchantContactinfo extends Model<MerchantContactinfo> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 商家ID
	 */
	private Long acountid;

	/**
	 * 姓名
	 */
	private String personname;

	/**
	 * 电话
	 */
	private String phonenumber;

	/**
	 * (1.法人代表 2：实际控股人 3：业务联络人 4：金融保险经理 5：财务经理)
	 */
	private Integer rolename;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getAcountid() {
		return acountid;
	}

	public void setAcountid(Long acountid) {
		this.acountid = acountid;
	}

	public String getPersonname() {
		return personname;
	}

	public void setPersonname(String personname) {
		this.personname = personname;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public Integer getRolename() {
		return rolename;
	}

	public void setRolename(Integer rolename) {
		this.rolename = rolename;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
