package org.gwu.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public final class WebUtil {
	public static final String getUrlString(String url) {
		try {
			return new String(getUrlE(url));
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static final byte[] getUrlE(String urlString) throws IOException {
		HttpURLConnection con = null;
		BufferedInputStream in = null;
		if(urlString==null||urlString.trim().equals(""))
			return new byte[0];
		try {
			ByteArrayOutputStream urlData = new ByteArrayOutputStream();
			URL url = new URL(urlString);
			con = (HttpURLConnection) url.openConnection();
			con.setConnectTimeout(15 * 1000);
			con.setReadTimeout(15 * 1000);
			in = new BufferedInputStream(con.getInputStream());
			byte[] buf2 = new byte[1024];
			int n;
			while ((n = in.read(buf2)) > 0) {
				urlData.write(buf2, 0, n);
			}
			in.close();
			return urlData.toByteArray();
		} catch (IOException e) {
			throw e;
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					throw e;
				}
				in = null;
			}
		}
	}

	public static final String postUrl(String url, String msg) {
		byte[] b = postUrlByte(url, msg);
		if (b == null)
			return null;
		return new String(b);
	}

	public static final byte[] postUrlByte(String urlString, String msg) {
		HttpURLConnection con = null;
		BufferedInputStream in = null;
		OutputStreamWriter out = null;
		try {
			ByteArrayOutputStream urlData = new ByteArrayOutputStream();
			URL url = new URL(urlString);
			con = (HttpURLConnection) url.openConnection();
			con.setConnectTimeout(15 * 1000);
			con.setReadTimeout(15 * 1000);

			con.setDoOutput(true);
			out = new OutputStreamWriter(con.getOutputStream());
			out.write(msg);
			out.flush();
			in = new BufferedInputStream(con.getInputStream());
			byte[] buf2 = new byte[1024];
			int n;
			while ((n = in.read(buf2)) > 0) {
				urlData.write(buf2, 0, n);
			}
			in.close();
			return urlData.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (out != null)
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			out = null;
			if (in != null)
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			in = null;
		}
	}

	public static boolean downLoadFile(String fileUrl,String filename)
	{
		int bytesum = 0;
        int byteread = 0;
        URL url;
		try {
			url = new URL(fileUrl);
            URLConnection conn = url.openConnection();
            InputStream inStream = conn.getInputStream();
            FileOutputStream fs = new FileOutputStream(filename);

            byte[] buffer = new byte[1204];
            while ((byteread = inStream.read(buffer)) != -1) {
                bytesum += byteread;
                fs.write(buffer, 0, byteread);
            }
            return true;
        } catch (Exception e) {
            return false;
        } 
	}
}
