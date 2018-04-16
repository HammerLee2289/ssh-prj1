package com.ynwi.ssh.action;

import java.io.IOException;
import java.io.InputStream;

public class TestAction {
	public void change() throws IOException {
		InputStream in = System.in;
		StringBuffer sb = new StringBuffer();
		int ch = 0;
		while ((ch = in.read()) != -1) {
			if (ch == '\r')
				continue;
			if (ch == '\n') {
				String temp = sb.toString();
				if ("over".equals(temp)) {
					break;
				}
				System.out.println(temp.toUpperCase());
				sb.delete(0, sb.length());
			} else {
				sb.append((char) ch);
			}

		}
	}
}
