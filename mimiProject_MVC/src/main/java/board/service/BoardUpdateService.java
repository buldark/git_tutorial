package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardUpdateService implements CommandProcess {

	
		@Override
		public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			//데이터
			int seq = Integer.parseInt(request.getParameter("seq"));
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			/*
			 * HttpSession session = request.getSession();
			 //이미 로그인한 상태라 이거 필요 없음 
			 */
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("seq",seq+"");//seq자체가 숫자라서 string으로 변환시키기 위해 두에 ""추가
			map.put("subject", subject);
			map.put("content", content);
			
			//DB
			BoardDAO boardDAO = BoardDAO.getInstance();
			boardDAO.boardUpdate(map);
			
			return "/board/boardUpdate.jsp";
	}

}
