package com.utonw.utonerp.common.Editor;

import org.springframework.beans.propertyeditors.PropertiesEditor;

/**
 * 自定义Double 类型数据编辑器
 * <p/>
 * Created by user on 2015/5/29.
 */
public class DoubleEditor extends PropertiesEditor {

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (text == null || text.equals("")) {
            text = "0";
        }
        setValue(Double.parseDouble(text));
    }

    @Override
    public String getAsText() {
        return getValue().toString();
    }
}
