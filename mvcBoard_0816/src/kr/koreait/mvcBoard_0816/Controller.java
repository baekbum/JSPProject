package kr.koreait.mvcBoard_0816;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.koreait.Service.MvcBoardService;

@WebServlet("*.nhn")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MvcBoardService service = MvcBoardService.getInstance();
       
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String context = uri.substring(contextPath.length());
		
		String viewPage = "";
		switch (context) {
			case "/insert.nhn":
				viewPage = "/WEB-INF/insert.jsp";
				break;
			case "/insertOK.nhn":
				System.out.println(request.getParameter("name"));
				System.out.println(request.getParameter("subject"));
				System.out.println(request.getParameter("content"));				
				service.insert(request, response);
				viewPage = "/WEB-INF/insertOK.jsp";
				break;
			case "/list.nhn":
				service.select(request, response);
				viewPage = "/WEB-INF/list.jsp";
				break;
			case "/increment.nhn":
				service.increment(request, response);
				viewPage = "/WEB-INF/increment.jsp";
				break;
			case "/view.nhn" :
				service.selectByIdx(request, response);
				viewPage = "/WEB-INF/view.jsp";
				request.setAttribute("rn", "\r\n");
				break;
			case "/update.nhn" :
				service.update(request, response);
				viewPage = "list.nhn";
				break;
			case "/delete.nhn" :
				service.delete(request, response);
				viewPage = "list.nhn";
				break;
			case "/reply.nhn" :
//				답글을 입력하는 페이지에 메인 글을 출력하기 위해 메인글을 얻어서 답글을 입력하는 페이지로 간다.
				service.selectByIdx(request, response);
				request.setAttribute("rn", "\r\n");
				viewPage = "/WEB-INF/reply.jsp";
				break;
			case "/replyOK.nhn" :
				service.reply(request, response);
				viewPage = "list.nhn";
				break;				
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
}







