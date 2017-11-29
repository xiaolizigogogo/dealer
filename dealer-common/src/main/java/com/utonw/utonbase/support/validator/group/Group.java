package com.utonw.utonbase.support.validator.group;

import com.utonw.utonbase.support.validator.UpdateGroup;

import javax.validation.GroupSequence;

/**
 * 定义校验顺序，如果AddGroup组失败，则UpdateGroup组不会再校验
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-15 23:15
 */
@GroupSequence({AddGroup.class, UpdateGroup.class})
public interface Group {

}
