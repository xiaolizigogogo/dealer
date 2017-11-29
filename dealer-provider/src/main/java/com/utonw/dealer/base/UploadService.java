package com.utonw.dealer.base;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.github.pagehelper.util.StringUtil;
import com.utonw.dealer.api.util.UploadUtil;

/**
 * Created by SEELE on 2017/5/18.
 */
@Service
public class UploadService {
	Logger logger=LoggerFactory.getLogger(UploadService.class);
    //图片服务器地址
    @Value("${pic.host}")
    private String pichost;

    //临时存储地址
    @Value("${temporary.dir}")
    private String temporary_dir;

    public String upload( String imgstr) throws IOException {
    	logger.debug("图片编码:"+imgstr);
    	logger.info("图片编码:"+imgstr);
        String name = UUID.randomUUID().toString().replaceAll("-", "")+".jpg";
        String path = temporary_dir;
        File file = new File(path);
        if(!file.exists() && !file.isDirectory()){
            file.mkdir();
        }
        logger.info("图片编码:"+imgstr);
        String filepath = path+"/"+name;
        boolean tag = UploadUtil.generateImage(imgstr, path+"/"+name);
        logger.info("图片编码,结果为:"+tag);
        if(tag){
            String key = UploadUtil.upload(filepath);
            logger.info("图片上传结果,结果为:"+key);
            if(!StringUtil.isEmpty(key)){
                UploadUtil.deleteFiles(filepath);
                String imgurl = pichost+key;
                return imgurl;
            }
        }
        return null;
    }
}

