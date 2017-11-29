package com.utonw.utonbase.core.erpcommon.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class IrrUtil {
    private double MINDIF = 0.001;

    private int LOOPNUM = 2000;

    private static int period = 0;

    @SuppressWarnings("rawtypes")
    private List netCash = new ArrayList();


    /**
     * @param repayCapitalSum 欠款本金
     * @param listParam       每期还款金额列表
     * @param period          还款总期数
     * @return
     */
    public String getIrrValue(Double repayCapitalSum, List<Double> listParam, Integer period) {
        Double db = null;
        List<Double> list = new ArrayList<Double>();
        DecimalFormat df = new DecimalFormat("#.00");

        if (repayCapitalSum < 0) {
            list.add(repayCapitalSum);
            list.addAll(listParam);
            netCash = list;
            this.period = 12 / period;
            db = this.calculator();
        } else {
            throw new RuntimeException("还款本金和必须为负");
        }
        return df.format(db * 100);
    }

    public IrrUtil() {
    }

    @SuppressWarnings("rawtypes")
    public IrrUtil(List netCashArr, int interval) {
        super();
        netCash = netCashArr;
        period = 12 / interval;
    }


    private double NPV(double r) {
        double npv = 0;
        if (netCash.size() != 0) {
            for (int count = 0; count < netCash.size(); count++) {
                npv += Double.valueOf(netCash.get(count).toString()) / Math.pow(1 + r, count);
            }
            return npv;
        }
        return Double.NaN;
    }

    public double calculator() {
        double irr = 0;
        double r1 = new BigDecimal("0.1").doubleValue();
        double r2 = new BigDecimal("0.09").doubleValue();
        double npv1 = NPV(r1);
        double npv2 = NPV(r2);
        int count = 0;
        while (Math.abs(npv2) > MINDIF & count < LOOPNUM) {
            irr = r2 - npv2 * (r2 - r1) / (npv2 - npv1);
            r1 = r2;
            r2 = irr;
            npv1 = npv2;
            npv2 = NPV(r2);
            count++;
        }
        if (Math.abs(npv2) < MINDIF & count <= LOOPNUM)
            return irr;
        else
            return Double.NaN;
    }


}
