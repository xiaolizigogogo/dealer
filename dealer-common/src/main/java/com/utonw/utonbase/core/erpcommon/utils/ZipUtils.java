package com.utonw.utonbase.core.erpcommon.utils;


import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import com.utonw.dealer.api.dto.request.erp.LoanOperateResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

 
/**
 *将文件或是文件夹打包压缩成zip格式
 * @author ysc
 */
public class ZipUtils {
    private static final Logger log = LoggerFactory.getLogger(ZipUtils.class);
         
    private ZipUtils(){};
   /**
     * 创建ZIP文件
     * @param sourcePath 文件或文件夹路径
     * @param zipPath 生成的zip文件存在路径（包括文件名）
     */
    public static LoanOperateResult createZip(String sourcePath, String zipPath) {
        FileOutputStream fos = null;
        ZipOutputStream zos = null;
        LoanOperateResult result=new LoanOperateResult();
        try {
            fos = new FileOutputStream(zipPath);
            zos = new ZipOutputStream(fos);
            writeZip(new File(sourcePath), "", zos);
        } catch (FileNotFoundException e) {
            log.error("创建ZIP文件失败",e);
            result.setMessage("创建ZIP文件失败");
            return result;
        } finally {
            try {
                if (zos != null) {
                    zos.close();
                }
            } catch (IOException e) {
                log.error("创建ZIP文件失败",e);
            }
 
        }
        result.setSuccess(true);
        return result;
    }
     
    private static LoanOperateResult writeZip(File file, String parentPath, ZipOutputStream zos) {
    	 LoanOperateResult result=new LoanOperateResult();
        if(file.exists()){
            if(file.isDirectory()){//处理文件夹
                parentPath+=file.getName()+File.separator;
                File [] files=file.listFiles();
                for(File f:files){
                    writeZip(f, parentPath, zos);
                }
            }else{
                FileInputStream fis=null;
                DataInputStream dis=null;
                try {
                    fis=new FileInputStream(file);
                    dis=new DataInputStream(new BufferedInputStream(fis));
                    ZipEntry ze = new ZipEntry(parentPath + file.getName());
                    zos.putNextEntry(ze);
                    byte [] content=new byte[1024];
                    int len;
                    while((len=fis.read(content))!=-1){
                        zos.write(content,0,len);
                        zos.flush();
                    }
                     
                 
                } catch (FileNotFoundException e) {
                    log.error("创建ZIP文件失败",e);
                } catch (IOException e) {
                    log.error("创建ZIP文件失败",e);
                }finally{
                    try {
                        if(dis!=null){
                            dis.close();
                        }
                    }catch(IOException e){
                        log.error("创建ZIP文件失败",e);
                    }
                }
            }
            result.setSuccess(true);
            return result;
        }
        result.setMessage("文件目录不存在");
        return result;
    }   
    public static void main(String[] args) {
        ZipUtils.createZip("E:\\Downloads", "E:\\backup.zip");
         
    }
}

