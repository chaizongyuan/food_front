package com.res.controller.desk;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.res.model.DeskUtils;

/**
 * Servlet implementation class SubDeskServlet
 */
public class SubDeskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SubDeskServlet() {
        super();
    }

    DeskUtils dUtils = new DeskUtils();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String deskId = request.getParameter("deskId");
	    try {
            dUtils.subDesk(deskId);
            HttpSession session = request.getSession();
            if (session.getAttribute("deskId") == null) {
                session.setAttribute("deskId", deskId);
            }
            request.getRequestDispatcher("FoodListServlet").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
