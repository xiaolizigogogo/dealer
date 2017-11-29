package com.utonw.utonbase.core.erpcommon.utils;


import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.Map;

/**
 * 导出Excel文档工具类
 */
public class MyExcelUtil {

    /**
     * @param list        数据
     * @param keys        list中map的key数组集合
     * @param columnNames excel的列名
     */
    @SuppressWarnings("deprecation")
    public static HSSFWorkbook createWorkBook(List<Map<String, Object>> list, String sheetName,
                                              String[] keys, String columnNames[]) {
        // 创建excel工作簿
        HSSFWorkbook wb = new HSSFWorkbook();
        // 创建第一个sheet（页），并命名
        HSSFSheet sheet = wb.createSheet(sheetName);
        // 手动设置列宽。第一个参数表示要为第几列设；，第二个参数表示列的宽度，n为列高的像素数。
        for (int i = 0; i < keys.length; i++) {
            sheet.setColumnWidth((short) i, (short) (35.7 * 150));
        }

        // 创建第一行
        HSSFRow row = sheet.createRow((short) 0);

        // 创建两种单元格格式
        HSSFCellStyle cs = wb.createCellStyle();
        HSSFCellStyle cs2 = wb.createCellStyle();

        // 创建两种字体
        HSSFFont f = wb.createFont();
        HSSFFont f2 = wb.createFont();

        // 创建第一种字体样式（用于列名）
        f.setFontHeightInPoints((short) 10);
        f.setColor(IndexedColors.BLACK.getIndex());
        f.setBoldweight(Font.BOLDWEIGHT_BOLD);

        // 创建第二种字体样式（用于值）
        f2.setFontHeightInPoints((short) 10);
        f2.setColor(IndexedColors.BLACK.getIndex());

//          Font f3=wb.createFont();
//          f3.setFontHeightInPoints((short) 10);
//          f3.setColor(IndexedColors.RED.getIndex());

        // 设置第一种单元格的样式（用于列名）
        cs.setFont(f);
        cs.setBorderLeft(CellStyle.BORDER_THIN);
        cs.setBorderRight(CellStyle.BORDER_THIN);
        cs.setBorderTop(CellStyle.BORDER_THIN);
        cs.setBorderBottom(CellStyle.BORDER_THIN);
        cs.setAlignment(CellStyle.ALIGN_CENTER);

        // 设置第二种单元格的样式（用于值）
        cs2.setFont(f2);
        cs2.setBorderLeft(CellStyle.BORDER_THIN);
        cs2.setBorderRight(CellStyle.BORDER_THIN);
        cs2.setBorderTop(CellStyle.BORDER_THIN);
        cs2.setBorderBottom(CellStyle.BORDER_THIN);
        cs2.setAlignment(CellStyle.ALIGN_CENTER);
        //设置列名
        for (int i = 0; i < columnNames.length; i++) {
            HSSFCell cell = row.createCell((short) i);
            cell.setCellValue(columnNames[i]);
            cell.setCellStyle(cs);
        }
        //设置每行每列的值
        for (short i = 1; i <= list.size(); i++) {
            // Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
            // 创建一行，在页sheet上
            HSSFRow row1 = sheet.createRow(i);
            // 在row行上创建一个方格
            for (short j = 0; j < keys.length; j++) {
                HSSFCell cell = row1.createCell(j);
                cell.setCellValue(list.get(i - 1).get(keys[j]) == null ? " " : list.get(i - 1)
                        .get(keys[j]).toString());
                cell.setCellStyle(cs2);
            }
        }
        return wb;

    }

    /**
     * 向已有的excel添加数据
     */
    @SuppressWarnings("deprecation")
    public static HSSFWorkbook addWorkBook(HSSFWorkbook workbook, List<Map<String, Object>> list,
                                           String[] keys, String columnNames[]) {
        HSSFSheet sheet = workbook.getSheetAt(0);  //获取到工作表，因为一个excel可能有多个工作表
        HSSFRow row = sheet.getRow(0);
        HSSFFont f2 = workbook.createFont();
        HSSFCellStyle cs2 = workbook.createCellStyle();
        // 设置第二种单元格的样式（用于值）
        cs2.setFont(f2);
        cs2.setBorderLeft(CellStyle.BORDER_THIN);
        cs2.setBorderRight(CellStyle.BORDER_THIN);
        cs2.setBorderTop(CellStyle.BORDER_THIN);
        cs2.setBorderBottom(CellStyle.BORDER_THIN);
        cs2.setAlignment(CellStyle.ALIGN_CENTER);
        //设置每行每列的值
        for (short i = 1; i <= list.size(); i++) {
            // Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
            // 创建一行，在页sheet上
            row = sheet.createRow((short) (sheet.getLastRowNum() + 1)); //在现有行号后追加数据
            // 在row行上创建一个方格
            for (short j = 0; j < keys.length; j++) {
                HSSFCell cell = row.createCell(j);
                cell.setCellValue(list.get(i - 1).get(keys[j]) == null ? " " : list.get(i - 1)
                        .get(keys[j]).toString());
                cell.setCellStyle(cs2);
            }
        }
        return workbook;
    }

    public static void downResponse(HttpServletResponse response, ByteArrayOutputStream
            byteArrayOutputStream, String fileName) {
        byte[] content = byteArrayOutputStream.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        try {
            response.setHeader("Content-Disposition", "attachment;filename=" + new String(
                    (fileName + ".xls").getBytes(), "iso-8859-1"));
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        ServletOutputStream out = null;
        try {
            out = response.getOutputStream();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (bis != null)
                try {
                    bis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if (bos != null)
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }
    }
}