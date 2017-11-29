package com.utonw.utonbase.core.erpcommon.utils;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * excel操作类
 */
public class ExcelUtil {

    /**
     * 创建excel文档并写入outStream输出流中
     *
     * @param outStream
     * @param mainTitle
     * @param titles
     * @param contents
     */
    public final static void buildExcel(OutputStream outStream,
                                        String mainTitle, String[] titles, List<String[]>
                                                contents) {
        int beginRow = 0;
        try {
            /** **********创建工作簿************ */
            WritableWorkbook workbook = Workbook.createWorkbook(outStream);

            /** **********创建工作表************ */
            WritableSheet sheet = workbook.createSheet("Sheet1", 0);

            /** **********设置纵横打印（默认为纵打）、打印纸***************** */
            jxl.SheetSettings sheetset = sheet.getSettings();
            sheetset.setProtected(false);

            /** ************设置单元格字体************** */
            WritableFont NormalFont = new WritableFont(WritableFont.ARIAL, 10);
            WritableFont BoldFont = new WritableFont(WritableFont.ARIAL, 10,
                    WritableFont.BOLD);

            /** ************以下设置三种单元格样式************ */
            // 用于标题居中
            WritableCellFormat wcf_center = new WritableCellFormat(BoldFont);
            wcf_center.setBorder(Border.ALL, BorderLineStyle.THIN); // 线条
            wcf_center.setVerticalAlignment(VerticalAlignment.CENTRE); // 文字垂直对齐
            wcf_center.setAlignment(Alignment.CENTRE); // 文字水平对齐
            wcf_center.setWrap(false); // 文字是否换行
            // 用于正文居左
            WritableCellFormat wcf_left = new WritableCellFormat(NormalFont);
            wcf_left.setBorder(Border.ALL, BorderLineStyle.THIN); // 线条
            wcf_left.setVerticalAlignment(VerticalAlignment.CENTRE); // 文字垂直对齐
            wcf_left.setAlignment(Alignment.LEFT); // 文字水平对齐
            wcf_left.setWrap(false); // 文字是否换行
            // 用于正文居右
            WritableCellFormat wcf_right = new WritableCellFormat(NormalFont);
            wcf_right.setBorder(Border.ALL, BorderLineStyle.THIN); // 线条
            wcf_right.setVerticalAlignment(VerticalAlignment.CENTRE); // 文字垂直对齐
            wcf_right.setAlignment(Alignment.RIGHT); // 文字水平对齐
            wcf_right.setWrap(false); // 文字是否换行

            // excel大标题
            if (mainTitle != null && !mainTitle.equals("")) {
                sheet.mergeCells(0, 0, titles.length - 1, 0);
                sheet.addCell(new Label(0, 0, mainTitle, wcf_center));
                beginRow = beginRow + 1;
            }

            /** ***************以下是EXCEL第一行列标题********************* */
            if (titles != null && titles.length > 1) {
                for (int i = 0; i < titles.length; i++) {
                    sheet.addCell(new Label(i, beginRow, titles[i], wcf_center));
                }
                beginRow = beginRow + 1;
            }
            /** ***************以下是EXCEL正文数据********************* */
            for (int i = 0; i < contents.size(); i++) {// row
                String[] rowContent = contents.get(i);
                for (int j = 0; j < titles.length; j++) { // cell
                    String content = "";
                    if (j < rowContent.length) {
                        content = rowContent[j];
                    }
                    if (StringUtil.isNumeric(content) && content.length() <= 11) {
                        double c = Double.parseDouble(content);
                        sheet.addCell(new jxl.write.Number(j, i + beginRow, c, wcf_right));
                    } else {
                        sheet.addCell(new Label(j, i + beginRow, content, wcf_center));
                    }

                }
            }
            workbook.write();
            workbook.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 导出类
     *
     * @param response
     * @param mainTitle 一级标题
     * @param fileName  文件名
     * @param title     表头
     * @param contents  内容
     */
    public static void downLoadHelper(HttpServletResponse response, String mainTitle, String
            fileName, String[] title, List<String[]> contents) {
        try {
            OutputStream os = response.getOutputStream();
            response.reset();// 清空输出流
            response.setHeader("Content-disposition", "attachment; filename=" +
                    new String(fileName.getBytes("UTF-8"), "ISO8859-1"));

            response.setContentType("application/msexcel");// 定义输出类型
            ExcelUtil.buildExcel(os, mainTitle, title, contents);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
