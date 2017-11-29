package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author wangyj
 * @since 2017-07-22
 */
@TableName("merchant_video")
public class MerchantVideo extends Model<MerchantVideo> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 申请表id
	 */
	private String applyid;

	/**
	 * 视频类型（scene：现场视频）
	 */
	private String videotitle;

	/**
	 * 创建时间
	 */
	private Date createddate;

	/**
	 * 视频路径
	 */
	private String videourl;

	/**
	 * 更新时间
	 */
	private Date updatetime;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getApplyid() {
		return applyid;
	}

	public void setApplyid(String applyid) {
		this.applyid = applyid;
	}

	public String getVideotitle() {
		return videotitle;
	}

	public void setVideotitle(String videotitle) {
		this.videotitle = videotitle;
	}

	public Date getCreateddate() {
		return createddate;
	}

	public void setCreateddate(Date createddate) {
		this.createddate = createddate;
	}

	public String getVideourl() {
		return videourl;
	}

	public void setVideourl(String videourl) {
		this.videourl = videourl;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
