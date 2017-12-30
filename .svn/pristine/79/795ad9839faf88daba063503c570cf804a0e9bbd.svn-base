package com.res.controller.desk;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.res.model.DeskUtils;
import com.res.utils.Pager;

/**
 * 主页餐桌列表
 * @author Administrator
 */
public class DeskListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeskListServlet() {
        super();
    }

    DeskUtils deskUtils = new DeskUtils();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String curPage = request.getParameter("curPage");
		Integer intCurPage = 1;
		if (curPage != null && !"".equals(curPage)) {
            intCurPage = Integer.parseInt(curPage);
        }
		
		try {
            Pager pager = deskUtils.getPager(intCurPage);
            request.setAttribute("pager", pager);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
