package com.utonw.utonbase.core.erpcommon.utils;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;
import java.security.Security;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

/**
 * 加密类
 */
public class SecurityUtils {

    private SecurityUtils() {
        // nothing
    }

    public static void main(String[] args) throws Exception {
        final String srcPassword = "771010321";
        String xxAES = AES.encrypt(AES.getKey(), srcPassword);
        System.out.println("AES encrypt:" + xxAES);

        String x2AES = AES.decrypt(AES.getKey(), xxAES);
        System.out.println("AES decrypt:" + x2AES);

        String xxDES = DES.encrypt(DES.getKey(), srcPassword);
        System.out.println("DES encrypt:" + xxDES);

        String x2DES = DES.decrypt(DES.getKey(), xxDES);
        System.out.println("DES decrypt:" + x2DES);

        String xxDES3 = DES3.encrypt(DES3.getKey(), srcPassword);
        System.out.println("DES3 encrypt:" + xxDES);

        String x2DES3 = DES3.decrypt(DES3.getKey(), xxDES3);
        System.out.println("DES3 decrypt:" + x2DES3);

        String xxMD5 = MD5.encrypt(srcPassword);
        System.out.println("MD5 encrypt:" + xxMD5);

        String xxSHA = SHA.encrypt(srcPassword);
        System.out.println("SHA encrypt:" + xxSHA);

        String xxSHA1 = SHA1.encrypt(srcPassword);
        System.out.println("SHA1 encrypt:" + xxSHA1);

        String xxSHA256 = SHA256.encrypt(srcPassword);
        System.out.println("SHA256 encrypt:" + xxSHA256);

        String xxSHA384 = SHA384.encrypt(srcPassword);
        System.out.println("SHA384 encrypt:" + xxSHA384);

        String xxSHA512 = SHA512.encrypt(srcPassword);
        System.out.println("SHA512 encrypt:" + xxSHA512);
    }


    //1.双向加密
    //1.1 DES
    //1.2 3DES
    //1.3 AES

    /**
     * @desc 1.双向加密 DES<br>
     * @create Mar 28, 2012 9:53:28 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class DES {


        /**
         * 密钥 8�?
         */
        private static final byte[] KEY_BYTES = {0x11, 0x22, 0x4F, 0x58, (byte) 0x88, 0x20, 0x50,
                0x38}; //8位元密钥

        static {
            Security.addProvider(new com.sun.crypto.provider.SunJCE());
        }

        /**
         * @return
         * @desc 获取加密KEY 24�?br>
         * @create Mar 28, 2012 4:46:35 PM by Liuyi<br>
         */
        public synchronized final static byte[] getKey() {
            return KEY_BYTES;
        }

        /**
         * @param src
         * @return
         * @desc 利用密钥加密 使用默认的密�?br>
         * @create Mar 28, 2012 2:38:30 PM by Liuyi<br>
         */
        public synchronized final static String encrypt(String src) {
            return encrypt(getKey(), src);
        }

        /**
         * @param src
         * @return
         * @desc 利用密钥解密<br>
         * @create Mar 28, 2012 2:38:38 PM by Liuyi<br>
         */
        public synchronized final static String decrypt(String src) {
            return decrypt(getKey(), src);
        }

        /**
         * @param keybyte 24�?
         * @param src
         * @return
         * @desc 利用密钥加密<br>
         * @create Mar 28, 2012 2:38:30 PM by Liuyi<br>
         */
        public synchronized final static String encrypt(byte[] keybyte, String src) {
            // 加密，结果保存进cipherByte
            byte[] cipherByte = null;
            try {
                SecretKey deskey = new SecretKeySpec(keybyte, "DES");
                //生成Cipher对象,指定其支持的DES算法
                Cipher c = Cipher.getInstance("DES");
                // 根据密钥，对Cipher对象进行初始化，ENCRYPT_MODE表示加密模式
                c.init(Cipher.ENCRYPT_MODE, deskey);
                byte[] bytes = src.getBytes();
                cipherByte = c.doFinal(bytes);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }

            String str = SecurityUtils.byte2str(cipherByte);
            return str;
        }

        /**
         * @param keybyte 24�?
         * @param src
         * @return
         * @desc 利用密钥解密<br>
         * @create Mar 28, 2012 2:38:38 PM by Liuyi<br>
         */
        public synchronized final static String decrypt(byte[] keybyte, String src) {

            byte[] cipherByte = null;
            try {
                SecretKey deskey = new SecretKeySpec(keybyte, "DES");
                //生成Cipher对象,指定其支持的DES算法
                Cipher c = Cipher.getInstance("DES");

                // 根据密钥，对Cipher对象进行初始化，DECRYPT_MODE表示加密模式
                c.init(Cipher.DECRYPT_MODE, deskey);
                cipherByte = c.doFinal(str2bytes(src));

            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }

            String str = new String(cipherByte);
            return str;

        }
    }

    /**
     * @desc 1.双向加密 DES3<br>
     * @create Mar 28, 2012 9:54:01 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class DES3 {
        /**
         * 密钥 24�?
         */
        private static final byte[] KEY_BYTES = {0x11, 0x22, 0x4F, 0x58,
                (byte) 0x88, 0x20, 0x50, 0x38, 0x28, 0x25, 0x79, 0x51, (byte) 0xCB,
                (byte) 0xDD, 0x55, 0x66, 0x77, 0x29, 0x74, (byte) 0x98, 0x30, 0x40,
                0x36, (byte) 0xE2}; //24位元密钥

        static {
            Security.addProvider(new com.sun.crypto.provider.SunJCE());
        }

        /**
         * @return
         * @desc 获取加密KEY 24�?br>
         * @create Mar 28, 2012 4:46:35 PM by Liuyi<br>
         */
        public synchronized final static byte[] getKey() {
            return KEY_BYTES;
        }

        /**
         * @param src
         * @return
         * @desc 利用密钥加密 使用默认的密�?br>
         * @create Mar 28, 2012 2:38:30 PM by Liuyi<br>
         */
        public synchronized final static String encrypt(String src) {
            return encrypt(getKey(), src);
        }

        /**
         * @param src
         * @return
         * @desc 利用密钥解密<br>
         * @create Mar 28, 2012 2:38:38 PM by Liuyi<br>
         */
        public synchronized final static String decrypt(String src) {
            return decrypt(getKey(), src);
        }

        /**
         * @param keybyte 24�?
         * @param src
         * @return
         * @desc 利用密钥加密<br>
         * @create Mar 28, 2012 2:38:30 PM by Liuyi<br>
         */
        public synchronized final static String encrypt(byte[] keybyte, String src) {
            // 加密，结果保存进cipherByte
            byte[] cipherByte = null;
            try {
                SecretKey deskey = new SecretKeySpec(keybyte, "DESede");
                //生成Cipher对象,指定其支持的DES算法
                Cipher c = Cipher.getInstance("DESede");
                // 根据密钥，对Cipher对象进行初始化，ENCRYPT_MODE表示加密模式
                c.init(Cipher.ENCRYPT_MODE, deskey);
                byte[] bytes = src.getBytes();
                cipherByte = c.doFinal(bytes);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }

            String str = SecurityUtils.byte2str(cipherByte);
            return str;
        }

        /**
         * @param keybyte 24�?
         * @param src
         * @return
         * @desc 利用密钥解密<br>
         * @create Mar 28, 2012 2:38:38 PM by Liuyi<br>
         */
        public synchronized final static String decrypt(byte[] keybyte, String src) {

            byte[] cipherByte = null;
            try {
                SecretKey deskey = new SecretKeySpec(keybyte, "DESede");
                //生成Cipher对象,指定其支持的DES算法
                Cipher c = Cipher.getInstance("DESede");

                // 根据密钥，对Cipher对象进行初始化，DECRYPT_MODE表示加密模式
                c.init(Cipher.DECRYPT_MODE, deskey);
                cipherByte = c.doFinal(str2bytes(src));

            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }

            String str = new String(cipherByte);
            return str;

        }
    }

    /**
     * @desc 1.双向加密 AES 16字节 128�?密钥 <br>
     * @create Mar 28, 2012 9:56:57 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class AES {
        /**
         * 密钥 16�?
         */
        private static final byte[] KEY_BYTES = {0x11, 0x22, 0x4F, 0x58,
                (byte) 0x88, 0x20, 0x50, 0x38, 0x28, 0x25, 0x79, 0x51, (byte) 0xCB,
                (byte) 0xDD, 0x55, 0x66}; //16位加密KEY

        static {
            Security.addProvider(new com.sun.crypto.provider.SunJCE());
        }

        /**
         * @return
         * @desc 获取加密KEY 16�?br>
         * @create Mar 28, 2012 4:46:35 PM by Liuyi<br>
         */
        public synchronized final static byte[] getKey() {
            return KEY_BYTES;
        }

        /**
         * @param src
         * @return
         * @desc 使用默认密钥加密<br>
         * @create Jun 13, 2012 4:13:55 PM by Liuyi<br>
         */
        public synchronized final static String encrypt(String src) {
            return encrypt(getKey(), src);
        }

        /**
         * @param src
         * @return
         * @desc 使用默认密钥解密<br>
         * @create Jun 13, 2012 4:14:05 PM by Liuyi<br>
         */
        public synchronized final static String decrypt(String src) {
            return decrypt(getKey(), src);
        }

        /**
         * @param keybyte 16字节 128�?
         * @param src
         * @return
         * @desc 利用密钥加密<br>
         * @create Mar 28, 2012 2:38:30 PM by Liuyi<br>
         */
        public synchronized final static String encrypt(byte[] keybyte, String src) {
            // 加密，结果保存进cipherByte
            byte[] cipherByte = null;
            try {
                SecretKey deskey = new SecretKeySpec(keybyte, "AES");
                //生成Cipher对象,指定其支持的DES算法
                Cipher c = Cipher.getInstance("AES");
                // 根据密钥，对Cipher对象进行初始化，ENCRYPT_MODE表示加密模式
                c.init(Cipher.ENCRYPT_MODE, deskey);
                byte[] bytes = src.getBytes();
                cipherByte = c.doFinal(bytes);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }

            String str = SecurityUtils.byte2str(cipherByte);
            return str;
        }

        /**
         * @param keybyte 16字节 128�?
         * @param src
         * @return
         * @desc 利用密钥解密<br>
         * @create Mar 28, 2012 2:38:38 PM by Liuyi<br>
         */
        public synchronized final static String decrypt(byte[] keybyte, String src) {

            byte[] cipherByte = null;
            try {
                SecretKey deskey = new SecretKeySpec(keybyte, "AES");
                //生成Cipher对象,指定其支持的DES算法
                Cipher c = Cipher.getInstance("AES");

                // 根据密钥，对Cipher对象进行初始化，DECRYPT_MODE表示加密模式
                c.init(Cipher.DECRYPT_MODE, deskey);
                cipherByte = c.doFinal(str2bytes(src));

            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }

            String str = new String(cipherByte);
            return str;

        }
    }


    //2.非对称加�?
    //2.1 RSA

    /**
     * @desc 非对称加�?RSA<br>
     * @create Mar 28, 2012 11:34:29 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class RSA {

        /**
         * @param src
         * @return
         * @desc 公钥加密<br>
         * @create Mar 28, 2012 11:05:14 AM by Liuyi<br>
         */
        public static final String encrypt(RSAPublicKey publicKey, String src) {
            byte[] bytes = encrypt(publicKey, src.getBytes());
            String str = byte2str(bytes);
            return str;
        }

        /**
         * @param src
         * @return
         * @desc 私钥解密<br>
         * @create Mar 28, 2012 11:05:14 AM by Liuyi<br>
         */
        public static final String decrypt(RSAPrivateKey privateKey, String src) {
            byte[] srcBytes = str2bytes(src);
            byte[] bytes = decrypt(privateKey, srcBytes);
            String str = new String(bytes);
            return str;
        }


        /**
         * 加密
         *
         * @param publicKey
         * @param srcBytes
         * @return
         * @throws java.security.NoSuchAlgorithmException
         * @throws javax.crypto.NoSuchPaddingException
         * @throws java.security.InvalidKeyException
         * @throws javax.crypto.IllegalBlockSizeException
         * @throws javax.crypto.BadPaddingException
         */
        private synchronized static final byte[] encrypt(RSAPublicKey publicKey, byte[] srcBytes) {
            if (publicKey != null) {
                try {
                    //Cipher负责完成加密或解密工作，基于RSA
                    Cipher cipher = Cipher.getInstance("RSA");
                    //根据公钥，对Cipher对象进行初始�?
                    cipher.init(Cipher.ENCRYPT_MODE, publicKey);
                    byte[] resultBytes = cipher.doFinal(srcBytes);
                    return resultBytes;
                } catch (Exception e) {
                    e.printStackTrace();
                    return null;
                }
            }
            return null;
        }

        /**
         * 解密
         *
         * @param privateKey
         * @param srcBytes
         * @return byte[]
         */
        private synchronized static final byte[] decrypt(RSAPrivateKey privateKey, byte[]
                srcBytes) {
            if (privateKey != null) {
                try {
                    //Cipher负责完成加密或解密工作，基于RSA
                    Cipher cipher = Cipher.getInstance("RSA");
                    //根据公钥，对Cipher对象进行初始�?
                    cipher.init(Cipher.DECRYPT_MODE, privateKey);
                    byte[] resultBytes = cipher.doFinal(srcBytes);
                    return resultBytes;
                } catch (Exception e) {
                    e.printStackTrace();
                    return null;
                }
            }
            return null;
        }

//	    /**   
//	     * @param args   
//	     * @throws NoSuchAlgorithmException    
//	     * @throws BadPaddingException    
//	     * @throws IllegalBlockSizeException    
//	     * @throws NoSuchPaddingException    
//	     * @throws InvalidKeyException    
//	     */   
//	    public static void main(String[] args) throws NoSuchAlgorithmException,
// InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
//	        EncrypRSA rsa = new EncrypRSA();    
//	        String msg = "郭XX-精品相声";    
//	        //KeyPairGenerator类用于生成公钥和私钥对，基于RSA算法生成对象    
//	        KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");    
//	        //初始化密钥对生成器，密钥大小�?024�?   
//	        keyPairGen.initialize(1024);    
//	        //生成�?��密钥对，保存在keyPair�?   
//	        KeyPair keyPair = keyPairGen.generateKeyPair();    
//	        //得到私钥    
//	        RSAPrivateKey privateKey = (RSAPrivateKey)keyPair.getPrivate();                 
//	        //得到公钥    
//	        RSAPublicKey publicKey = (RSAPublicKey)keyPair.getPublic();    
//	            
//	        //用公钥加�?   
//	        byte[] srcBytes = msg.getBytes();    
//	        byte[] resultBytes = rsa.encrypt(publicKey, srcBytes);    
//	            
//	        //用私钥解�?   
//	        byte[] decBytes = rsa.decrypt(privateKey, resultBytes);    
//	            
//	        System.out.println("明文�?" + msg);    
//	        System.out.println("加密后是:" + new String(resultBytes));    
//	        System.out.println("解密后是:" + new String(decBytes));    
//	    }    

    }


    //3.单向加密
    //3.1 MD5 不安�?
    //3.2 SHA

    /**
     * @desc 单向加密 MD5算法<br>
     * @create Mar 28, 2012 10:55:00 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class MD5 {

        /**
         * @param src
         * @return
         * @desc 加密<br>
         * @create Mar 28, 2012 11:05:14 AM by Liuyi<br>
         */
        public static final String encrypt(String src) {
            byte[] bytes = eccrypt(src);
            String str = byte2str(bytes);
            return str;
        }

        private synchronized static final byte[] eccrypt(String info) {
            try {
                //根据MD5算法生成MessageDigest对象
                MessageDigest md5 = MessageDigest.getInstance("MD5");
                byte[] srcBytes = info.getBytes();
                //使用srcBytes更新摘要
                md5.update(srcBytes);
                //完成哈希计算，得到result
                byte[] resultBytes = md5.digest();
                return resultBytes;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

    }

    /**
     * @desc 单向加密 SHA算法<br>
     * @create Mar 28, 2012 10:55:00 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class SHA {

        /**
         * @param src
         * @return
         * @desc 加密 默认SHA-1<br>
         * @create Mar 28, 2012 11:05:14 AM by Liuyi<br>
         */
        public static final String encrypt(String src) {
            return SHA256.encrypt(src);
        }
    }

    /**
     * @desc 单向加密 SHA1(SHA-1)算法<br>
     * @create Mar 28, 2012 10:55:00 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class SHA1 {

        /**
         * @param src
         * @return
         * @desc 加密<br>
         * @create Mar 28, 2012 11:05:14 AM by Liuyi<br>
         */
        public static final String encrypt(String src) {
            byte[] bytes = eccrypt(src);
            String str = byte2str(bytes);
            return str;
        }

        private synchronized static final byte[] eccrypt(String info) {
            try {
                MessageDigest md5 = MessageDigest.getInstance("SHA");
                byte[] srcBytes = info.getBytes();
                //使用srcBytes更新摘要
                md5.update(srcBytes);
                //完成哈希计算，得到result
                byte[] resultBytes = md5.digest();
                return resultBytes;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

    }

    /**
     * @desc 单向加密 SHA256(SHA-256)算法<br>
     * @create Mar 28, 2012 10:55:00 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class SHA256 {
        /**
         * @param src
         * @return
         * @desc 加密<br>
         * @create Mar 28, 2012 11:05:14 AM by Liuyi<br>
         */
        public static final String encrypt(String src) {
            byte[] bytes = eccrypt(src);
            String str = byte2str(bytes);
            return str;
        }

        private synchronized static final byte[] eccrypt(String info) {
            try {
                MessageDigest md5 = MessageDigest.getInstance("SHA-256");
                byte[] srcBytes = info.getBytes();
                //使用srcBytes更新摘要
                md5.update(srcBytes);
                //完成哈希计算，得到result
                byte[] resultBytes = md5.digest();
                return resultBytes;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

    }

    /**
     * @desc 单向加密 SHA384(SHA-384)算法<br>
     * @create Mar 28, 2012 10:55:00 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class SHA384 {
        /**
         * @param src
         * @return
         * @desc 加密<br>
         * @create Mar 28, 2012 11:05:14 AM by Liuyi<br>
         */
        public static final String encrypt(String src) {
            byte[] bytes = eccrypt(src);
            String str = byte2str(bytes);
            return str;
        }

        private synchronized static final byte[] eccrypt(String info) {
            try {
                MessageDigest md5 = MessageDigest.getInstance("SHA-384");
                byte[] srcBytes = info.getBytes();
                //使用srcBytes更新摘要
                md5.update(srcBytes);
                //完成哈希计算，得到result
                byte[] resultBytes = md5.digest();
                return resultBytes;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

    }

    /**
     * @desc 单向加密 SHA512(SHA-512)算法<br>
     * @create Mar 28, 2012 10:55:00 AM<br>
     * @auhtor Liuyi 联系方式�?5308404493 邮箱�?5637131@qq.com<br>
     */
    public static class SHA512 {
        /**
         * @param src
         * @return
         * @desc 加密<br>
         * @create Mar 28, 2012 11:05:14 AM by Liuyi<br>
         */
        public static final String encrypt(String src) {
            byte[] bytes = eccrypt(src);
            String str = byte2str(bytes);
            return str;
        }

        private synchronized static final byte[] eccrypt(String info) {
            try {
                MessageDigest md5 = MessageDigest.getInstance("SHA-512");
                byte[] srcBytes = info.getBytes();
                //使用srcBytes更新摘要
                md5.update(srcBytes);
                //完成哈希计算，得到result
                byte[] resultBytes = md5.digest();
                return resultBytes;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

    }

    /**
     * @param bytes
     * @return
     * @desc 字节数组转换�?6进制字符�?br>
     * @create Mar 28, 2012 10:51:45 AM by Liuyi<br>
     */
    private static final String byte2str(byte[] bytes) {
        if (bytes == null) {
            return null;
        }

        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd',
                'e', 'f'};
        int j = bytes.length;
        char str[] = new char[j * 2];
        int k = 0;
        for (int i = 0; i < j; i++) {
            byte byte0 = bytes[i];
            str[k++] = hexDigits[byte0 >>> 4 & 0xf];
            str[k++] = hexDigits[byte0 & 0xf];
        }
        return new String(str);
    }

    /**
     * @param str
     * @return byte[] bytes
     * @desc �?6进制的字符串转换为字节数�?br> 例如：如输入字符串：AD67EA2F3BE6E5AD 返回字节数组：{173,103,234,47,59,230,229,
     * 173 }<br>
     * @create Mar 28, 2012 10:52:11 AM by Liuyi<br>
     */
    private static final byte[] str2bytes(String str) {
        if (str == null) {
            return null;
        }
        byte[] bRet = new byte[str.length() / 2];
        for (int i = 0; i < str.length() / 2; i++) {
            Integer itg = new Integer(16 * getChrInt(str.charAt(2 * i)) + getChrInt(str.charAt(2
                    * i + 1)));
            bRet[i] = itg.byteValue();
        }
        return bRet;
    }

    /**
     * @param chr
     * @return
     * @desc �?6进制字符转换�?0进制数�?<br>
     * @create Mar 28, 2012 10:53:49 AM by Liuyi<br>
     */
    private static final int getChrInt(char chr) {
        int iRet = 0;

        if (chr == "0".charAt(0))
            iRet = 0;
        else if (chr == "1".charAt(0))
            iRet = 1;
        else if (chr == "2".charAt(0))
            iRet = 2;
        else if (chr == "3".charAt(0))
            iRet = 3;
        else if (chr == "4".charAt(0))
            iRet = 4;
        else if (chr == "5".charAt(0))
            iRet = 5;
        else if (chr == "6".charAt(0))
            iRet = 6;
        else if (chr == "7".charAt(0))
            iRet = 7;
        else if (chr == "8".charAt(0))
            iRet = 8;
        else if (chr == "9".charAt(0))
            iRet = 9;
        else if (chr == "A".charAt(0) || chr == "a".charAt(0))
            iRet = 10;
        else if (chr == "B".charAt(0) || chr == "b".charAt(0))
            iRet = 11;
        else if (chr == "C".charAt(0) || chr == "c".charAt(0))
            iRet = 12;
        else if (chr == "D".charAt(0) || chr == "d".charAt(0))
            iRet = 13;
        else if (chr == "E".charAt(0) || chr == "e".charAt(0))
            iRet = 14;
        else if (chr == "F".charAt(0) || chr == "f".charAt(0))
            iRet = 15;

        return iRet;
    }
}
