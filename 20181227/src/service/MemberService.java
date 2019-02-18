package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import util.Cookies;
import vo.MemberVo;

public class MemberService {
	
	MemberDao dao = MemberDao.getInstance();
	
	public void memberJoin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		
		MemberVo member = new MemberVo(id,pass,name,addr,phone);
		
		boolean success = dao.memberJoin(member);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String url = "join.mb";
		out.println("<script>");
		if(success) {
			url="login.mb";
			out.print("alert('회원가입 성공');");
		}else {
			url="join.mb";
			out.print("alert('회원가입 실패');");
		}
		out.println("location.href='"+url+"';");
		out.println("</script>");		
	}

	public void memberLogin(
			HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String login = request.getParameter("login");
		
		MemberVo member = dao.memberLogin(id, pass);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		writer.print("<script>");
		String url;
		if(member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			if(login != null) {
				/*Cookies c = new Cookies(request);
				Cookie c1 = c.createCookie("id", member.getId(), 60*60*24*15);
				response.addCookie(c1);*/
				response.addCookie(Cookies.createCookie("id", member.getId(), 60*60*24*15));
			}
			writer.print("alert('로그인 성공');");
			url = "test1";
		}else {
			writer.println("alert('로그인 실패');");
			url = "login.mb";
		}
		writer.println("location.href='"+url+"';");
		writer.println("</script>");
	}
	
	public static void loginCheck(HttpServletRequest request) {
		Cookies cookie = new Cookies(request);
		if(cookie.exists("id")) {
			String id = cookie.getValue("id");
			MemberDao mDao = MemberDao.getInstance();
			MemberVo member = mDao.getMemberVo(id);
			if(member != null) {
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
			}
		}
	}

	// 회원정보 수정
	public void memberUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		MemberVo member = new MemberVo(
				request.getParameter("id"),
				request.getParameter("pass"),
				request.getParameter("name"),
				request.getParameter("addr"),
				request.getParameter("phone")				
		);
		
		System.out.println("memberUpdate : "+member);
		
		boolean success = dao.memberUpdate(member);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		String url = "update.mb";
		if(success) {
			MemberVo memberUpdate = dao.getMemberVo(request.getParameter("id"));
			HttpSession session = request.getSession();
			session.setAttribute("member", memberUpdate);
			url = "info.mb";
			out.print("alert('수정완료');");
		}else {
			out.print("alert('수정실패');");
		}
		out.println("location.href='"+url+"';");
		out.println("</script>");
	}
	
	// 회원탈퇴 요청 처리
	public void withDrawSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String tempPass = request.getParameter("tempPass");
		System.out.println("tempPass : "+tempPass);
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		System.out.println("session Member : " + member.toString());
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		String url="info.mb";
		if(member != null && tempPass.equals(member.getPass())) {
			dao.deleteMember(member.getId());
			
			logOut(request,response);
			
			out.println("alert('회원탈퇴 성공');");
			url = "test1";
		}else {
			out.println("alert('회원탈퇴 실패\n 비밀번호가 일치 하지 않습니다.');");
		}
		out.println("location.href='"+url+"';");
		out.println("</script>");
		System.out.println("url : " + url);
		
	}

	// 로그아웃 처리
	public void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Cookies cookies = new Cookies(request);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		HttpSession session = request.getSession();
		session.invalidate();
		if(cookies.exists("id")) {
			System.out.println("Cookie id 존재");
			cookies.removeCookie(request, response, "id");
			System.out.println("삭제");
		}

		out.println("<script>");
		out.println("alert('로그아웃');");
		out.println("</script>");
	}
}






