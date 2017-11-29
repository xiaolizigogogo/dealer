package com.utonw.utonbase.core.erpcommon.utils;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.Toolkit;
import java.awt.Transparency;
import java.awt.color.ColorSpace;
import java.awt.color.ICC_ColorSpace;
import java.awt.color.ICC_Profile;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorConvertOp;
import java.awt.image.ColorModel;
import java.awt.image.CropImageFilter;
import java.awt.image.DataBufferByte;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageProducer;
import java.awt.image.Raster;
import java.awt.image.WritableRaster;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.imageio.IIOException;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageInputStream;
import javax.imageio.stream.ImageOutputStream;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.sanselan.ImageReadException;
import org.apache.sanselan.Sanselan;
import org.apache.sanselan.common.byteSources.ByteSource;
import org.apache.sanselan.common.byteSources.ByteSourceArray;
import org.apache.sanselan.formats.jpeg.JpegImageParser;
import org.apache.sanselan.formats.jpeg.segments.UnknownSegment;
import org.imgscalr.Scalr;

import com.mortennobel.imagescaling.AdvancedResizeOp.UnsharpenMask;
import com.mortennobel.imagescaling.ResampleOp;

public class LocalImageUtils {

	private static final Logger log = Logger.getLogger(LocalImageUtils.class);

	private static ICC_Profile CMYK_PROFILE;

	static {
		String cmykProfileFilePath = "/image/ISOcoated_v2_300_eci.icc";
		try {
			CMYK_PROFILE = ICC_Profile.getInstance(LocalImageUtils.class.getResourceAsStream(cmykProfileFilePath));

		} catch (Exception e) {
			throw new RuntimeException("读取资源文件异常，path=" + cmykProfileFilePath, e);
		}
	}

	/**
	 * 缩放图片
	 * 
	 * @param imageData
	 * @param maxWith
	 * @param maxHeight
	 * @param extension
	 * @return
	 */
	public static byte[] resizeMax(byte[] imageData, int maxWith, int maxHeight, String extension) {
		BufferedImage bi = LocalImageUtils.getImage(imageData);
		try {
			if (bi.getWidth() <= maxWith && bi.getHeight() <= maxHeight) {
				return imageData;
			}
			bi = LocalImageUtils.resizeMax(bi, maxWith, maxHeight);
			return LocalImageUtils.getImageData(bi, extension);
		} catch (Exception e) {
			return null;
		}
	}

	public static BufferedImage resizeBytes(byte[] imgData, double ratio) {
		ByteArrayInputStream is = new ByteArrayInputStream(imgData);
		BufferedImage bi = null;
		try {
			bi = ImageIO.read(is);
		} catch (Exception e) {
			log.error("调整图片大小异常，ex");
			return null;
		} finally {
			IOUtils.closeQuietly(is);
		}
		return resize(bi, ratio);
	}

	public static BufferedImage resizeBytes(byte[] imgData, int width, int height) {
		ByteArrayInputStream is = new ByteArrayInputStream(imgData);
		BufferedImage bi = null;

		try {
			bi = ImageIO.read(is);
		} catch (Exception e) {
			log.error("调整图片大小异常，ex");
			return null;
		} finally {
			IOUtils.closeQuietly(is);
		}
		return resize(bi, width, height);
	}

	public static BufferedImage resize(BufferedImage bi, double ratio) {
		int width = (int) (bi.getWidth() * ratio);
		int height = (int) (bi.getHeight() * ratio);
		return resize(bi, width, height);
	}

	/**
	 * 缩放图片
	 * 
	 * @param bi
	 * @param width
	 * @param height
	 * @return
	 */
	public static BufferedImage resize(BufferedImage bi, int width, int height) {
		ResampleOp resampleOp = new ResampleOp(width, height);
		resampleOp.setUnsharpenMask(UnsharpenMask.None);
		return resampleOp.filter(bi, null);
	}

	public static BufferedImage zoom(BufferedImage bi, int width, int height) {
		BufferedImage tagImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		tagImage.getGraphics().drawImage(bi.getScaledInstance(width, height, BufferedImage.SCALE_SMOOTH), 0, 0, null);
		return tagImage;
	}

	/**
	 * * 调整图片最大尺寸，<br>
	 * .如果原始图片高宽都小于最大值，则直接以原始图片为准，否则，将原始图片按比例调整到，高度不超过maxHeight， 宽度不超过maxWidth
	 * 
	 * @param bi
	 * @param maxWidth
	 * @param maxHeight
	 * @return
	 */
	public static BufferedImage resizeMax(BufferedImage bi, int maxWidth, int maxHeight) {
		int[] widthHeight = resizeWidthHeight(bi.getWidth(), bi.getHeight(), maxWidth, maxHeight);
		return resize(bi, widthHeight[0], widthHeight[1]);
	}

	/**
	 * 使用Scalr调整图像大小
	 * 
	 * @param bi
	 * @param scale
	 * @return
	 * @deprecated 使用 reszie
	 */
	public static BufferedImage scalrResize(BufferedImage bi, double scale) {
		return Scalr.resize(bi, Scalr.Method.QUALITY, Scalr.Mode.FIT_EXACT, (int) (bi.getWidth() * scale),
				(int) (bi.getHeight() * scale), Scalr.OP_ANTIALIAS);
	}

	/**
	 * @deprecated 使用 reszie
	 * @param bi
	 * @param width
	 * @param height
	 * @return
	 */
	public static BufferedImage scalrResize(BufferedImage bi, int width, int height) {
		return Scalr.resize(bi, Scalr.Method.ULTRA_QUALITY, Scalr.Mode.FIT_EXACT, width, height, Scalr.OP_ANTIALIAS);
	}

	/**
	 * 调整图片最大尺寸，<br>
	 * .如果原始图片高宽都小于最大值，则直接以原始图片为准，否则，将原始图片按比例调整到，高度不超过maxHeight， 宽度不超过maxWidth
	 * 
	 * @param width
	 * @param height
	 * @param maxWidth
	 * @param maxHeight
	 * @return
	 */
	private static int[] resizeWidthHeight(int width, int height, int maxWidth, int maxHeight) {
		int destWidth = -1;
		int destHeight = -1;
		if (width <= maxWidth && height <= maxHeight) {
			destWidth = width;
			destHeight = height;
		} else if ((width - maxWidth) / maxWidth >= (height - maxHeight) / maxHeight) {
			if (height > width) {
				if (height > maxHeight) {
					destHeight = maxHeight;
				} else {
					destHeight = height;
				}
				destWidth = width * destHeight / height;
			} else {
				if (width > maxWidth) {
					destWidth = maxWidth;
				} else {
					destWidth = width;
				}
				destHeight = height * destWidth / width;
			}
		} else {
			if (height > maxHeight) {
				destHeight = maxHeight;
			} else {
				destHeight = height;
			}
			destWidth = width * destHeight / height;
		}
		return new int[] { destWidth, destHeight };

		// int destWidth = -1;
		// int destHeight = -1;
		// if (width <= maxWidth && height <= maxHeight) {
		// destWidth = width;
		// destHeight = height;
		// } else if ((width - maxWidth) / maxWidth < (height - maxHeight) /
		// maxHeight) {
		// if (width > maxWidth) {
		// destWidth = maxWidth;
		// } else {
		// destWidth = width;
		// }
		// destHeight = height * destWidth / width;
		// } else {
		// if(height>width){
		// if (height > maxHeight) {
		// destHeight = maxHeight;
		// } else {
		// destHeight = height;
		// }
		// destWidth = width * destHeight / height;
		// }else{
		// if (width > maxWidth) {
		// destWidth = maxWidth;
		// } else {
		// destWidth = width;
		// }
		// destHeight = height * destWidth / width;
		// }
		// }
		// return new int[] { destWidth, destHeight };
	}

	/**
	 * 调整图片最大尺寸，<br>
	 * 如果原始图片高宽都小于最大值，则直接以原始图片为准，否则，将原始图片按比例调整到，高度不超过maxHeight， 宽度不超过maxWidth
	 * 
	 * @param bi
	 * @param maxWidth
	 * @param maxHeight
	 * @deprecated 使用 reszieMax
	 * @return
	 */
	public static BufferedImage scalrResizeMax(BufferedImage bi, int maxWidth, int maxHeight) {
		int[] widthHeight = resizeWidthHeight(bi.getWidth(), bi.getHeight(), maxWidth, maxHeight);
		return scalrResize(bi, widthHeight[0], widthHeight[1]);
	}

	/**
	 * 读取图片数据
	 * 
	 * @param data
	 * @return
	 */
	public static BufferedImage getImage(byte[] imageData) {
		try {
			ImageInputStream stream = ImageIO.createImageInputStream(new ByteArrayInputStream(imageData));
			Iterator<ImageReader> iter = ImageIO.getImageReaders(stream);
			while (iter.hasNext()) {
				ImageReader reader = iter.next();
				reader.setInput(stream);
				BufferedImage image;
				try {
					image = reader.read(0);
				} catch (IIOException e) {
					ICC_Profile profile = Sanselan.getICCProfile(imageData);
					if (profile == null) {
						profile = CMYK_PROFILE;
					}
					WritableRaster raster = (WritableRaster) reader.readRaster(0, null);
					if (checkAdobeMarker(imageData)) {
						convertInvertedColors(raster);
					}
					image = convertCmykToRgb(raster, profile);

				}
				return image;
			}
		} catch (Exception e) {
			log.error("读取byte[]图片数据异常", e);
			return null;
		}
		return null;
	}

	/**
	 * 从原始图片中，x、y坐标开始，取width*height的图片
	 * 
	 * @param sourceData
	 * @param x
	 * @param y
	 * @param width
	 * @param height
	 * @return
	 */
	public static BufferedImage getCropedImage(byte[] sourceData, int x, int y, int width, int height) {
		ByteArrayInputStream is = new ByteArrayInputStream(sourceData);
		try {
			// 读取源图像
			BufferedImage bi = ImageIO.read(is);
			int srcWidth = bi.getWidth(); // 源图宽度
			int srcHeight = bi.getHeight(); // 源图高度
			Image image = bi.getScaledInstance(srcWidth, srcHeight, Image.SCALE_DEFAULT);
			java.awt.image.ImageFilter cropFilter = new CropImageFilter(x, y, width, height);
			Image img = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(image.getSource(), cropFilter));
			BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics g = tag.getGraphics();
			g.drawImage(img, 0, 0, null); // 绘制缩小后的图
			g.dispose();
			return tag;
		} catch (Exception e) {
			log.error("截取图片异常", e);
			e.printStackTrace();
		}
		return null;
	}

	public static byte[] getJpgData(BufferedImage bi) {
		return getJpgData(bi, 0.9f);
	}

	/**
	 * 填充透明像素以指定颜色
	 * 
	 * @param image
	 * @param fillColor
	 * @return
	 */
	public static BufferedImage fillTransparentPixels(BufferedImage image, Color fillColor) {
		int w = image.getWidth();
		int h = image.getHeight();
		BufferedImage image2 = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = image2.createGraphics();
		g.setColor(fillColor);
		g.fillRect(0, 0, w, h);
		g.drawRenderedImage(image, null);
		g.dispose();
		return image2;
	}

	public static byte[] getJpgData(BufferedImage bi, float qualtity) {
		if (bi.getColorModel().getTransparency() != Transparency.OPAQUE) {
			bi = fillTransparentPixels(bi, Color.WHITE);
		}
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		try {
			// 得到指定Format图片的writer
			Iterator<ImageWriter> iter = ImageIO.getImageWritersByFormatName("jpeg");// 得到迭代器
			ImageWriter writer = (ImageWriter) iter.next(); // 得到writer
			// 得到指定writer的输出参数设置(ImageWriteParam )
			ImageWriteParam iwp = writer.getDefaultWriteParam();
			iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT); // 设置可否压缩
			iwp.setCompressionQuality(qualtity); // 设置压缩质量参数

			IIOImage iIamge = new IIOImage(bi, null, null);

			// 此处因为ImageWriter中用来接收write信息的output要求必须是ImageOutput
			// 通过ImageIo中的静态方法，得到byteArrayOutputStream的ImageOutput
			writer.setOutput(ImageIO.createImageOutputStream(bos));
			writer.write(null, iIamge, iwp);
			return bos.toByteArray();
		} catch (Exception e) {
			return getImageData(bi, "jpg");
		} finally {
			IOUtils.closeQuietly(bos);
		}
	}

	/**
	 * 获取Image的二进制数据
	 * 
	 * @param image
	 * @return
	 */
	public static byte[] getImageData(Image image, String type) {
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		int width = image.getWidth(null);
		int height = image.getHeight(null);
		BufferedImage bi = null;
		if (image instanceof BufferedImage) {
			bi = (BufferedImage) image;
		} else {
			bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics g = bi.getGraphics();
			g.drawImage(image, 0, 0, width, height, null);
			g.dispose();
		}

		if (StringUtils.equalsIgnoreCase(type, "jpg") || StringUtils.equalsIgnoreCase(type, "jpeg")) {
			try {
				return getJpgData(bi, 1);
			} catch (Exception e) {
			}
		}
		try {
			ImageIO.write(bi, type, bos);
			return bos.toByteArray();
		} catch (IOException e) {
			return null;
		} finally {
			IOUtils.closeQuietly(bos);
		}

	}

	/**
	 * 根据多个坐标,得到平均颜色
	 * 
	 * @return
	 */
	public static int getAverageRgbColor(BufferedImage bi, int[][] positions) {
		int totalColor = 0;
		for (int[] position : positions) {
			totalColor += bi.getRGB(position[0], position[1]);
		}
		return totalColor / positions.length;
	}

	public static int getAverageRgbColor(BufferedImage bi, int[] rect) {
		int totalColor = 0;
		for (int i = rect[0]; i < rect[2] + rect[0]; i++) {
			for (int j = rect[1]; j < rect[3] + rect[1]; j++) {
				totalColor += bi.getRGB(i, j);
			}
		}
		return totalColor / (rect[2] * rect[3]);
	}

	/**
	 * 从右往左,过滤掉symbolsCount个符号,注意,这些符号的颜色都不是notSymbolesColor
	 * 
	 * @param bi
	 * @return
	 */
	public static BufferedImage subLeft(BufferedImage bi, int notSymbolesRgbColor, int symbolsCount) {
		boolean start = false;
		int count = 0;
		for (int i = bi.getWidth() - 1; i > 0; i--) {
			boolean contain = false;
			for (int j = 0; j < bi.getHeight(); j++) {
				// 不等于该颜色,说明有符号
				if (bi.getRGB(i, j) < notSymbolesRgbColor) {
					contain = true;
					if (start == false) {
						start = true;
					}
					break;
				}
			}
			if (!contain && start) {
				count++;
				start = false;
			}

			// 如果没有符号
			if (count == symbolsCount) {
				return LocalImageUtils.imageToBufferedImage(LocalImageUtils.cropImage(bi, 0, 0, i, bi.getHeight()));
			}
		}
		return null;
	}

	public static Image cropImage(Image image, int x, int y, int width, int height) {
		// //四个参数分别为图像起点坐标和宽高，即CropImageFilter(int x,int y,int width,int
		// height)，详细情况请参考API
		CropImageFilter cropFilter = new CropImageFilter(x, y, width, height);
		Image croppedImage = Toolkit.getDefaultToolkit()
				.createImage(new FilteredImageSource(image.getSource(), cropFilter));
		return croppedImage;
	}

	public static BufferedImage cropBufferedImage(Image image, int x, int y, int width, int height) {
		return imageToBufferedImage(cropImage(image, x, y, width, height));
	}

	public static File tempImageFile(File imageFile) {

		String path = imageFile.getPath();

		StringBuffer strB = new StringBuffer(path);

		strB.insert(path.lastIndexOf('.'), 0);

		return new File(strB.toString().replaceFirst("(?<=//.)(//w+)$", "tif"));

	}

	public static void saveToFile(BufferedImage image, String format, File saveFile) {
		try {
			FileOutputStream fos = new FileOutputStream(saveFile);
			ImageIO.write(image, format, fos);
			IOUtils.closeQuietly(fos);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

	public static void saveToFile(Image image, String format, File saveFile) {
		saveToFile(imageToBufferedImage(image), format, saveFile);
	}

	public static void saveToFile(Image image, String format, String saveFile) {
		saveToFile(imageToBufferedImage(image), format, new File(saveFile));
	}

	public static BufferedImage getImage(File imageFile) {
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(imageFile);
			return getImage(IOUtils.toByteArray(fis));
		} catch (Exception e) {
			log.error("读取图片文件异常，imageFile=" + imageFile, e);
			return null;
		} finally {
			IOUtils.closeQuietly(fis);
		}
	}

	public static BufferedImage imageToBufferedImage(Image image) {
		if (image instanceof BufferedImage) {
			return (BufferedImage) image;
		}
		BufferedImage bufferedImage = new BufferedImage(image.getWidth(null), image.getHeight(null),

				BufferedImage.TYPE_INT_RGB);

		Graphics2D g = bufferedImage.createGraphics();

		g.drawImage(image, 0, 0, null);

		return bufferedImage;

	}

	public static BufferedImage imageProducerToBufferedImage(ImageProducer imageProducer) {

		return imageToBufferedImage(Toolkit.getDefaultToolkit().createImage(imageProducer));

	}

	public static byte[] image_byte_data(BufferedImage image) {

		WritableRaster raster = image.getRaster();

		DataBufferByte buffer = (DataBufferByte) raster.getDataBuffer();

		return buffer.getData();

	}

	/**
	 * 生成缩略图 <br/>
	 * 保存:ImageIO.write(BufferedImage, imgType[jpg/png/...], File);
	 * 
	 * @param source
	 *            原图片
	 * @param width
	 *            缩略图宽
	 * @param height
	 *            缩略图高
	 * @param b
	 *            是否等比缩放
	 */
	public static BufferedImage thumb(BufferedImage source, int width, int height, boolean b) {
		// targetW，targetH分别表示目标长和宽
		int type = source.getType();
		BufferedImage target = null;
		double sx = (double) width / source.getWidth();
		double sy = (double) height / source.getHeight();

		if (b) {
			if (sx > sy) {
				sx = sy;
				width = (int) (sx * source.getWidth());
			} else {
				sy = sx;
				height = (int) (sy * source.getHeight());
			}
		}

		if (type == BufferedImage.TYPE_CUSTOM) { // handmade
			ColorModel cm = source.getColorModel();
			WritableRaster raster = cm.createCompatibleWritableRaster(width, height);
			boolean alphaPremultiplied = cm.isAlphaPremultiplied();
			target = new BufferedImage(cm, raster, alphaPremultiplied, null);
		} else
			target = new BufferedImage(width, height, type);
		Graphics2D g = target.createGraphics();
		// smoother than exlax:
		g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		g.drawRenderedImage(source, AffineTransform.getScaleInstance(sx, sy));
		g.dispose();
		return target;
	}

	/**
	 * 图片水印
	 * 
	 * @param imgPath
	 *            待处理图片
	 * @param markPath
	 *            水印图片
	 * @param x
	 *            水印位于图片左上角的 x 坐标值
	 * @param y
	 *            水印位于图片左上角的 y 坐标值
	 * @param alpha
	 *            水印透明度 0.1f ~ 1.0f
	 */
	public static byte[] waterMark(String imgPath, String markPath, int x, int y, float alpha) {
		// 保存处理后的文件
		try {
			// 加载待处理图片文件
			Image img = ImageIO.read(new File(imgPath));

			BufferedImage image = new BufferedImage(img.getWidth(null), img.getHeight(null),
					BufferedImage.TYPE_INT_RGB);
			Graphics2D g = image.createGraphics();
			g.drawImage(img, 0, 0, null);

			// 加载水印图片文件
			Image src_biao = ImageIO.read(new File(markPath));
			g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
			g.drawImage(src_biao, x, y, null);
			g.dispose();
			return getJpgData(image);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 文字水印
	 * 
	 * @param imgPath
	 *            待处理图片
	 * @param text
	 *            水印文字
	 * @param font
	 *            水印字体信息
	 * @param color
	 *            水印字体颜色
	 * @param x
	 *            水印位于图片左上角的 x 坐标值
	 * @param y
	 *            水印位于图片左上角的 y 坐标值
	 * @param alpha
	 *            水印透明度 0.1f ~ 1.0f
	 */

	public static byte[] textMark(String imgPath, String text, Font font, Color color, int x, int y, float alpha) {

		try {
			Font Dfont = (font == null) ? new Font("宋体", 20, 13) : font;

			Image img = ImageIO.read(new File(imgPath));

			BufferedImage image = new BufferedImage(img.getWidth(null), img.getHeight(null),
					BufferedImage.TYPE_INT_RGB);
			Graphics2D g = image.createGraphics();

			g.drawImage(img, 0, 0, null);
			g.setColor(color);
			g.setFont(Dfont);
			g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
			g.drawString(text, x, y);
			g.dispose();

			return getJpgData(image);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/**
	 * 灰度值计算
	 * 
	 * @param pixels
	 *            像素
	 * @return int 灰度值
	 */
	public static int rgbToGray(int pixels) {
		// int _alpha = (pixels >> 24) & 0xFF;
		int _red = (pixels >> 16) & 0xFF;
		int _green = (pixels >> 8) & 0xFF;
		int _blue = (pixels) & 0xFF;
		return (int) (0.3 * _red + 0.59 * _green + 0.11 * _blue);
	}

	/**
	 * 固定压缩
	 * 
	 * @param image
	 * @param width
	 * @param height
	 * @return
	 */
	public static BufferedImage resizeFixed(BufferedImage image, int width, int height) {
		if (height != image.getHeight() || width != image.getWidth()) {
			image = resize(image, width, height);
		}
		return image;
	}

	/**
	 * 自动宽度等比压缩，如果宽度未到width，则不压缩
	 * 
	 * @param image
	 * @param width
	 * @param height
	 * @return
	 */
	public static BufferedImage resizeAutoFitToWidth(BufferedImage image, int width) {

		if (width >= image.getWidth()) {
			return image;
		}
		return resizeMax(image, width, Integer.MAX_VALUE);

	}

	/**
	 * 宽度等比压缩
	 * 
	 * @param image
	 * @param width
	 * @param height
	 * @return
	 */
	public static BufferedImage resizeAutoFitToHeight(BufferedImage image, int height) {
		if (height >= image.getHeight()) {
			return image;
		}
		return resizeMax(image, Integer.MAX_VALUE, height);
	}

	/**
	 * 计算数组的平均值
	 * 
	 * @param pixels
	 *            数组
	 * @return int 平均值
	 */
	public static int average(int[] pixels) {
		float m = 0;
		for (int i = 0; i < pixels.length; ++i) {
			m += pixels[i];
		}
		m = m / pixels.length;
		return (int) m;
	}

	/**
	 * 返回图片格式
	 * 
	 * @param is
	 * @return
	 * @throws Exception
	 */
	public static String getRealFormatName(byte[] imgData) throws Exception {
		ImageInputStream iis = ImageIO.createImageInputStream(new ByteArrayInputStream(imgData));
		Iterator<ImageReader> iterator = ImageIO.getImageReaders(iis);
		while (iterator.hasNext()) {
			ImageReader reader = (ImageReader) iterator.next();
			return reader.getFormatName();
		}
		return null;
	}

	private static void convertInvertedColors(WritableRaster raster) {
		int height = raster.getHeight();
		int width = raster.getWidth();
		int stride = width * 4;
		int[] pixelRow = new int[stride];
		for (int h = 0; h < height; h++) {
			raster.getPixels(0, h, width, 1, pixelRow);
			for (int x = 0; x < stride; x++) {
				pixelRow[x] = 255 - pixelRow[x];
			}
			raster.setPixels(0, h, width, 1, pixelRow);
		}
	}

	private static BufferedImage convertCmykToRgb(Raster cmykRaster, ICC_Profile profile) throws IOException {
		ICC_ColorSpace cmykCS = new ICC_ColorSpace(profile);
		BufferedImage rgbImage = new BufferedImage(cmykRaster.getWidth(), cmykRaster.getHeight(),
				BufferedImage.TYPE_INT_RGB);
		WritableRaster rgbRaster = rgbImage.getRaster();
		ColorSpace rgbCS = rgbImage.getColorModel().getColorSpace();
		ColorConvertOp cmykToRgb = new ColorConvertOp(cmykCS, rgbCS, null);
		cmykToRgb.filter(cmykRaster, rgbRaster);
		return rgbImage;
	}

	/**
	 * 检查是否通过adobe生成的图片
	 * 
	 * @param imageData
	 * @return
	 * @throws IOException
	 * @throws ImageReadException
	 */
	public static boolean checkAdobeMarker(byte[] imageData) throws IOException, ImageReadException {
		JpegImageParser parser = new JpegImageParser();
		ByteSource byteSource = new ByteSourceArray(imageData);
		ArrayList<?> segments = parser.readSegments(byteSource, new int[] { 0xffee }, true);
		if (segments != null && segments.size() >= 1) {
			UnknownSegment app14Segment = (UnknownSegment) segments.get(0);
			byte[] data = app14Segment.bytes;
			if (data.length >= 12 && data[0] == 'A' && data[1] == 'd' && data[2] == 'o' && data[3] == 'b'
					&& data[4] == 'e') {
				return true;
			}
		}
		return false;
	}

	/**
	 * 将pdf转换为图片
	 * 
	 * @param saveFileName
	 * @param basePath
	 * @param page
	 * @throws IOException
	 */
	private void extractImages(String saveFileName, String basePath, PDPage page) throws IOException {
		// 将页面转换为图片
		BufferedImage image = page.convertToImage();
		Iterator iter = ImageIO.getImageWritersBySuffix("jpg");
		ImageWriter writer = (ImageWriter) iter.next();
		File outFile = new File(basePath + saveFileName);
		FileOutputStream out = new FileOutputStream(outFile);
		ImageOutputStream outImage = ImageIO.createImageOutputStream(out);
		writer.setOutput(outImage);
		writer.write(new IIOImage(image, null, null));
	}
}
