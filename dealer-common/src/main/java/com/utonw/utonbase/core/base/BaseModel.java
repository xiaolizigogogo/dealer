package com.utonw.utonbase.core.base;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
@JsonIgnoreProperties(ignoreUnknown = true)
public abstract class BaseModel implements Serializable {

}
