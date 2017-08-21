package vn.fpt.fsoft.intern517.olt.controller;
/**
 * DeleteTopicAdminServlet.java
 *
 * Copyright 
 *
 * Modification Logs:
 * DATE                 AUTHOR          			DESCRIPTION
 * -----------------------------------------------------------------------
 * June 22, 2017        Nguyen Cong Huong          	Create
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.fpt.fsoft.intern517.olt.common.Constants;
import vn.fpt.fsoft.intern517.olt.model.bo.TopicBO;

public class DeteleTopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeteleTopicServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		TopicBO topicBO = new TopicBO();

		// Kiem tra da dang nhap chua
		if (session.getAttribute("userName") == null) {
			response.sendRedirect("LoginServlet");
			return;
		}
		
		// Kiem tra quyen dang nhap
		if (Constants.STUDENT_RIGHTS.equals(session.getAttribute("type"))) {
			response.sendRedirect("WelcomeStudentServlet");
			return;
		}
		
		//Xoa 1 topic
		String topicID = request.getParameter("topicID");
		if ("submit".equals(request.getParameter("submit"))) {
			topicBO.deleteTopic(topicID);
			response.sendRedirect("ManageTopicServlet");
		}else{
			response.sendRedirect("ManageTopicServlet");
		}
	}

}
