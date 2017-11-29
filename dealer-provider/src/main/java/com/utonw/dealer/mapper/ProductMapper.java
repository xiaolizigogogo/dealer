package com.utonw.dealer.mapper;

import com.utonw.dealer.api.entity.Product;
import org.springframework.stereotype.Component;
import java.util.Map;

@Component
public interface ProductMapper {

    Product selectByModel(Map param);

}