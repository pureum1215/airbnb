package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
		
	public ActionForward execute(HttpServletRequest requesßt, HttpServletResponse response) throws Exception;

}