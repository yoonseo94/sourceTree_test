package com.kh.ajax.jquery;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.ajax.celeb.dto.Celeb;
import com.kh.ajax.celeb.manager.CelebManager;

/**
 * Servlet implementation class CsvServlet
 */
@WebServlet("/jquery/csv")
public class CsvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값
		
		// 2. 업무로직
		CelebManager manager = CelebManager.getInstance();
		List<Celeb> celebList = manager.getCelebList();
		
		// 3. view단처리
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		for(Celeb celeb : celebList) {
			out.println(celeb); // celeb.toString() + "\n"
		}
	}

}
