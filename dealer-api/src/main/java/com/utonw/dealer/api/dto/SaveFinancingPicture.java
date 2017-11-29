package com.utonw.dealer.api.dto;

import java.io.Serializable;
import java.util.List;

/**
 * Created by SEELE on 2017/6/13.
 */
public class SaveFinancingPicture implements Serializable{
    private static final long serialVersionUID = -4604733904717051351L;
    private List<String> imageUrls;

    public List<String> getImageUrls() {
        return imageUrls;
    }

    public void setImageUrls(List<String> imageUrls) {
        this.imageUrls = imageUrls;
    }
}
