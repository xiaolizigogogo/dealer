package com.utonw.dealer.mapper;


import com.utonw.dealer.api.entity.Picture;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface PictureMapper {

    List<Picture> selectByModel(Integer productId);

}