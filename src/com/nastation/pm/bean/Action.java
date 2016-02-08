package com.nastation.pm.bean;

/**
 * 代表任务处理的动作
 * 
 * <pre>
 * 	以下为开发者自己的任务时：
 *  如果 (问题状态为Open), 则显示&quot;开始进行&quot;, &quot;解决问题&quot;, &quot;关闭问题&quot;
 *  如果 (问题状态为In Progress ), 则显示&quot;停止进行&quot;, &quot;解决问题&quot;, &quot;关闭问题&quot;,
 *  如果点击&quot;解决问题&quot;, &quot;关闭问题&quot;，都进入填写解决结果页面
 *  如果 (问题状态为Resolved), 则显示&quot;关闭问题&quot;, &quot;恢复开启问题&quot;
 *  如果 (问题状态为Closed), 则显示&quot;恢复开启问题&quot;
 *  如果 (问题状态为Reopened), 则显示&quot;开始进行&quot;, &quot;解决问题&quot;, &quot;关闭问题&quot;
 * </pre>
 * 
 * @author Kris
 * @version 2008-12-26
 */
public class Action {
	
	

}
