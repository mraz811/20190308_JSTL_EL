package com.happy.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.happy.dto.ScoreDto;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/ctrl.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("command"); // 이제 jsp에 java source대신 여기서
		System.out.println(str+": 요청받은 값");
		
		if(str.equalsIgnoreCase("elPage")) {
			
			ScoreDto sc = new ScoreDto("유관순누나", 100, 100, 100);
			
			// session객체 원래는 아래 처럼 되어있다.
//			HttpSession session = request.getSession();
//			session.setAttribute(name, value);
			// 모든~ 객체는 request로 되어있다. request 안에 session이 있는 것이다.
			// JSP에서는 미리 구현을 해놓은 것
			
			request.setAttribute("sc", sc);
			
			// pageContext.forward ( page내가 보는 화면, Context 여기 글자들 가지고 forward이동)
			// ㄴ얘는 request가 가지고 있는 객체 이죠
			RequestDispatcher dispatcher = request.getRequestDispatcher("elPage.jsp");
			dispatcher.forward(request, response);
			
		} else if(str.equalsIgnoreCase("jstlPage")) {
			
			List<ScoreDto> lists = new ArrayList<ScoreDto>();
			
			for (int i = 10; i <= 20; i++) {
				ScoreDto sc = new ScoreDto("도라에몽"+i, 10+i, 20+i, 30+i);
				lists.add(sc);
			}
			
			request.setAttribute("lists", lists);
			
			
			// 이동하는 것부터 하죠
			RequestDispatcher dispatcher = request.getRequestDispatcher("jstlPage.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}

}
