package com.utonw.utonbase.core.erpcommon.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StockObjectIDGenerator {
       /**
     * 创建一个唯一的押品ID。
     *
     * @return String 押品ID
     */
   private static volatile StockObjectIDGenerator instance = null;

   private StockObjectIDGenerator() { }

   public synchronized static  StockObjectIDGenerator getInstance() {
            if(instance == null) {
               instance = new StockObjectIDGenerator();
            }
      return instance;
   }
    /**
     * 生成押品 ID的方法。
     *
     * 
     * @return String 订单ID的字符串
     */
   public synchronized String getStockObjectID() {
      //如果订单大于100000万的话，则用100000进行取余运算
      SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
      String dateStr = sf.format(new Date());
      String preStr = "ECD";
      String parkStr = "01";
      //订单ID=公司前缀+停车场ID+时间戳+产品序号，保证再任何情况下，订单ID的唯一性。
      String stockobjectId = preStr + parkStr;
      stockobjectId += dateStr;
      return stockobjectId;
   }
}

