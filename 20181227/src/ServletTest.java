

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;

@WebServlet("/test1")
public class ServletTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*response.sendRedirect(request.getContextPath()+"/common/main.jsp");*/
		
		request.setCharacterEncoding("utf-8");
		MemberService.loginCheck(request);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/common/main.jsp");
		rd.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET 요청");
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST 요청");
		doProcess(request,response);
	}

}
