package com.nastation.pm.util.test;

import junit.framework.TestCase;

import com.nastation.pm.util.StringUtils;

/**
 * Test StringUtils.class
 * 
 * @see StringUtils
 * @author Kris
 */
public class StringUtilsTest extends TestCase {

	/**
	 * @see StringUtils#removeTime(String)
	 */
	public void testRemoveTime() {
		String date = StringUtils.removeTime("2008-12-25 11:28:00.0");
		assertEquals(date, "2008-12-25");
	}

}
