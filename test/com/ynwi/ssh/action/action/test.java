package com.ynwi.ssh.action.action;

import java.io.IOException;

import org.junit.Test;

import com.ynwi.ssh.action.ExcuseAction;
import com.ynwi.ssh.action.TestAction;

public class test {
	@Test
	public void test11() throws IOException {
		TestAction test = new TestAction();
		test.change();
	}
	
	@Test
	public void test12() {
		ExcuseAction testAction = new ExcuseAction();
		System.out.println(testAction.editExcuse());
		
	}
}
