package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author wangyj
 * @since 2017-05-17
 */
@TableName("merchant_contract_name")
public class MerchantContractName extends Model<MerchantContractName> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 合同名
	 */
	private String contractname;

	/**
	 * 合同类型
	 */
	private String contracttype;

	/**
	 * 顺序
	 */
	private Integer contractorder;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContractname() {
		return contractname;
	}

	public void setContractname(String contractname) {
		this.contractname = contractname;
	}

	public String getContracttype() {
		return contracttype;
	}

	public void setContracttype(String contracttype) {
		this.contracttype = contracttype;
	}

	public Integer getContractorder() {
		return contractorder;
	}

	public void setContractorder(Integer contractorder) {
		this.contractorder = contractorder;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
