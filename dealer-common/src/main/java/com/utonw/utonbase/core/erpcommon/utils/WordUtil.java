package com.utonw.utonbase.core.erpcommon.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import com.utonw.utonbase.core.erpcommon.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * word文档工具类 Created by Vic on 2015/11/15.
 */
public class WordUtil {

	public static final Logger logger = LoggerFactory.getLogger(WordUtil.class);

	private Configuration configuration = null;

	public WordUtil() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("UTF-8");
	}

	/**
	 * 创建word文档
	 *
	 * @param dataMap
	 *            数据
	 * @param saveFileName
	 *            保存文件名字
	 * @param templateFile
	 *            模板文件
	 */
	public String createWord(String basePath, Map<String, Object> dataMap, String saveFileName, String templateFile,
			String templatePath) {
		configuration.setClassForTemplateLoading(this.getClass(), "");
		// FTL文件所存在的位置
		try {
			configuration.setDirectoryForTemplateLoading(new File(templatePath));
		} catch (Exception e) {
			e.printStackTrace();
		}

		Template t = null;
		try {
			t = configuration.getTemplate(templateFile, "utf-8"); // 文件名
		} catch (IOException e) {
			e.printStackTrace();
		}
		File file = new File(basePath);
		if (!file.exists()) {
			if (!file.mkdirs()) {
				logger.error("创建" + basePath + "目录失败!");
			}
		}
		String fullFile = basePath + saveFileName + ".doc";
		File outFile = new File(fullFile);

		Writer out = null;
		try {
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "utf-8"));
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			if (t != null) {
				t.process(dataMap, out);
			}
			if (out != null) {
				out.close();
			}
		} catch (TemplateException | IOException e) {
			e.printStackTrace();
		}
		return fullFile;
	}

	public String createExecl(String basePath, Map<String, Object> dataMap, String saveFileName, String templateFile,
			String templatePath) {
		configuration.setClassForTemplateLoading(BaseController.class.getClass(), "");
		// FTL文件所存在的位置
		try {
			configuration.setDirectoryForTemplateLoading(new File(SpringContext.getResourceRootRealPath()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		Template t = null;
		try {
			t = configuration.getTemplate(templateFile, "utf-8"); // 文件名
		} catch (IOException e) {
			e.printStackTrace();
		}
		File file = new File(basePath);
		if (!file.exists()) {
			if (!file.mkdirs()) {
				logger.error("创建" + basePath + "目录失败!");
			}
		}
		String fullFile = basePath + saveFileName + ".xlsx";
		File outFile = new File(fullFile);

		Writer out = null;
		try {
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "utf-8"));
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			if (t != null) {
				t.process(dataMap, out);
			}
			if (out != null) {
				out.close();
			}
		} catch (TemplateException | IOException e) {
			e.printStackTrace();
		}
		return fullFile;
	}
}
