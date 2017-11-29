package com.utonw.utonerp.core;

import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.CacheUtil;
import com.utonw.utonbase.core.erpcommon.utils.LicenseManagerHolder;
import de.schlichtherle.license.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.Properties;
import java.util.prefs.Preferences;

/**
 * Created by WANGYJ on 2017/3/6.
 */
public class VerifyExecutor {
    //common param
    private static String PUBLICALIAS = "";
    private static String STOREPWD = "";
    private static String SUBJECT = "";
    private static String licPath = "";
    private static String pubPath = "";
    private static String licp = null;
    private static String pubp = null;

    // 获取参数
    public void setParam(String propertiesPath) {
        // 获取参数
        Properties prop = new Properties();
        InputStream inputStream = VerifyExecutor.class.getClassLoader().getResourceAsStream(propertiesPath);
        try {
            prop.load(inputStream);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        PUBLICALIAS = prop.getProperty("PUBLICALIAS");
        STOREPWD = prop.getProperty("STOREPWD");
        SUBJECT = prop.getProperty("SUBJECT");
        licPath = prop.getProperty("licPath");
        licp = VerifyExecutor.class.getClassLoader().getResource(licPath).getPath();
        pubPath = prop.getProperty("pubPath");
        //采用绝对路径
        pubp = new String("../../../../").concat(pubPath);
    }

    public boolean verify() {
        /************** 证书使用者端执行 ******************/

        LicenseManager licenseManager = LicenseManagerHolder
                .getLicenseManager(initLicenseParams());
        // 安装证书
        try {
            licenseManager.install(new File(licp));
            System.out.println("客户端安装证书成功!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("客户端证书安装失败!");
            CacheUtil.put(Constants.LIC_CACHE,"lic","outdate");
            return false;
        }
        // 验证证书
        try {
            licenseManager.verify();
            System.out.println("客户端验证证书成功!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("客户端证书验证失效!");
            CacheUtil.put(Constants.LIC_CACHE,"lic","outdate");
            return false;
        }
        CacheUtil.put(Constants.LIC_CACHE,"lic","inuse");
        return true;
    }

    // 返回验证证书需要的参数
    private static LicenseParam initLicenseParams() {
        Preferences preference = Preferences
                .userNodeForPackage(VerifyExecutor.class);
        CipherParam cipherParam = new DefaultCipherParam(STOREPWD);
        try {
            KeyStoreParam privateStoreParam = new DefaultKeyStoreParam(
                    VerifyExecutor.class, URLDecoder.decode(pubp,"UTF-8"), PUBLICALIAS, STOREPWD, null);
            LicenseParam licenseParams = new DefaultLicenseParam(SUBJECT,
                    preference, privateStoreParam, cipherParam);
            return licenseParams;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
