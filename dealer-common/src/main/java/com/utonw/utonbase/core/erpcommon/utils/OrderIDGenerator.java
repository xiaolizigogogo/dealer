package com.utonw.utonbase.core.erpcommon.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderIDGenerator {
       /**
     * 创建一个唯一的订单ID。
     *
     * @return String orderID
     */
   private static volatile OrderIDGenerator instance = null;

   private OrderIDGenerator() { }

   public synchronized static  OrderIDGenerator getInstance() {
            if(instance == null) {
               instance = new OrderIDGenerator();
            }
      return instance;
   }
    /**
     * 生成Order ID的方法。
     *
     * @param flownumber 借款列表中贷款记录的个数
     * @return String 订单ID的字符串
     */
   public synchronized String getOrderID(Integer flownumber) {
      //如果订单大于100000万的话，则用100000进行取余运算
      int num = flownumber % 100000;
      SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
      String dateStr = sf.format(new Date());
      String preStr = "ECD";
      String productStr = "01";
      //订单ID=公司前缀+产品ID+时间戳+产品序号，保证再任何情况下，订单ID的唯一性。
      String orderId = preStr + productStr;
      orderId += productStr;
      orderId += dateStr;
      String numStr = String.format("%05d", num);
      orderId +=  numStr;
      return orderId;
   }
   public synchronized String getOrderIDCYB(String prefix,String flownumber){
      SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
      String orderid = prefix.concat("-").concat(sf.format(new Date()).substring(2))
              .concat("-")
              .concat(String.format("%04d",Integer.valueOf(flownumber)));
      return orderid;
   }
}

