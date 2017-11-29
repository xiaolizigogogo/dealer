package com.utonw.utonbase.core.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.jxls.common.Context;
import org.jxls.expression.JexlExpressionEvaluator;
import org.jxls.transform.Transformer;
import org.jxls.util.JxlsHelper;

public class Jxls2Utils {

	private static final String TEMPLATE_PATH = "jxls-template";
	private static final String TEMPLATE_SUFFIX = ".xls";
	
	public static void exportExcel(InputStream is, OutputStream os, Map<String, Object> model) throws IOException {
		Context context = new Context();
		if (model != null) {
			for (String key : model.keySet()) {
				context.putVar(key, model.get(key));
			}
		}
		
		JxlsHelper jxlsHelper = JxlsHelper.getInstance();

		// 添加自定义标签
		Transformer transformer = jxlsHelper.createTransformer(is, os);
		JexlExpressionEvaluator evaluator = (JexlExpressionEvaluator) transformer.getTransformationConfig()
				.getExpressionEvaluator();
		Map<String, Object> funcs = new HashMap<String, Object>();
		funcs.put("utils", new Jxls2Utils());
		evaluator.getJexlEngine().setFunctions(funcs);

		jxlsHelper.processTemplate(context, transformer);
	}

	// 获取jxls模版文件
	public static InputStream getTemplate(String name) throws FileNotFoundException {
		String templatePath = Jxls2Utils.class.getClassLoader().getResource(TEMPLATE_PATH).getPath();
		File template = new File(templatePath, name);
		if (template.exists()) {
			return new FileInputStream(template);
		}
		return null;
	}

	public static byte[] toByteArray(File file) throws IOException {

		FileChannel channel = null;
		FileInputStream fs = null;
		try {
			fs = new FileInputStream(file);
			channel = fs.getChannel();
			ByteBuffer byteBuffer = ByteBuffer.allocate((int) channel.size());
			while ((channel.read(byteBuffer)) > 0) {
				// do nothing
				// System.out.println("reading");
			}
			return byteBuffer.array();
		} finally {
			channel.close();
			fs.close();
		}
	}

	/**
	 * 生成Excel
	 * 
	 * @param Templatename
	 *            模板的名字
	 * @param model
	 *            参数
	 * @return
	 */
	public static byte[] generateExcel(String Templatename, Map<String, Object> model) {
		byte[] bytes = null; 
		File excleFile = null;
		FileOutputStream fos = null;
		try {
			excleFile = File.createTempFile(UUID.randomUUID().toString(), TEMPLATE_SUFFIX);// 创建临时文件
			fos = new FileOutputStream(excleFile);
			InputStream is = getTemplate(Templatename);
			exportExcel(is, fos, model);
			bytes = toByteArray(excleFile);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fos.flush();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			excleFile.deleteOnExit();
		}
		return bytes;
	}
	
	// 日期格式化
    public String dateFmt(Date date, String fmt) {
        if (date == null) {
            return null;
        }
        try {
            SimpleDateFormat dateFmt = new SimpleDateFormat(fmt);
            return dateFmt.format(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    //null转空字符串
    public Object isNull(Object obj) {
        if (obj == null) {
            return "";
        }
        return obj;
    }
    

}
