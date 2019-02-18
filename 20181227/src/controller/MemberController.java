package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;

@WebServlet("*.mb")
public class MemberController extends HttpServlet {
	
	MemberService ms = new MemberService();

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ms.loginCheck(request);
		
		String requestPath = request.getRequestURI();
		System.out.println("전체 요청 경로 : " + requestPath);
		String contextPath = request.getContextPath();
		System.out.println("요청 프로젝트 경로 : " + contextPath);
		String command  = requestPath.substring(contextPath.length());
		System.out.println("실제 요청 command : "+command);
		
		if(command.equals("/login.mb")) {
			System.out.println("로그인 화면 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/login.jsp");
			rd.forward(request, response);
		}
		
		if(command.equals("/memberLogin.mb")) {
			System.out.println("로그인 요청");
			ms.memberLogin(request, response);
		}
		
		if(command.equals("/join.mb")) {
			System.out.println("회원가입 화면 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/join.jsp");
			rd.forward(request, response);
		}
		
		if(command.equals("/memberJoin.mb")) {
			System.out.println("회원가입 요청");
			ms.memberJoin(request, response);
		}
		
		if(command.equals("/info.mb")) {
			System.out.println("회원정보 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/info.jsp");
			rd.forward(request, response);
		}
		
		if(command.equals("/update.mb")) {
			System.out.println("회원정보 수정 화면 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/update.jsp");
			rd.forward(request, response);
		}
		
		if(command.equals("/memberUpdate.mb")) {
			System.out.println("회원정보 수정 요청");
			ms.memberUpdate(request,response);
		}
		
		
		if(command.equals("/withdraw.mb")) {
			System.out.println("회원탈퇴 화면 요청");
			RequestDispatcher rd = request.getRequestDispatcher("/member/withdraw.jsp");
			rd.forward(request, response);
		}
		
		if(command.equals("/withdrawSubmit.mb")) {
			System.out.println("회원 탈퇴 요청");
			ms.withDrawSubmit(request,response);
		}
		
		if(command.equals("/logout.mb")) {
			System.out.println("로그아웃 요청");
			ms.logOut(request,response);
			RequestDispatcher rd = request.getRequestDispatcher("/common/main.jsp");
			rd.forward(request, response);
		}	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
}
