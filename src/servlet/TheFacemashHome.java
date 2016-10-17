package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ratinglogic.FaceRating;
import dbhandler.FacesDbHandler;

/**
 * Servlet implementation class TheFacemashHome
 */
@WebServlet("/TheFacemashHome")
public class TheFacemashHome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TheFacemashHome() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// get ids of the 2 images
		String id1 = request.getParameter("id1");
		String id2 = request.getParameter("id2");

		String img1 = request.getParameter("img1");
		String img2 = request.getParameter("img2");

		if (img1 != null) {
			// Player1 wins
			FacesDbHandler.calculateNewRating(Integer.parseInt(id1),
					Integer.parseInt(id2), true);
		} else if (img2 != null) {
			// Player2 wins
			FacesDbHandler.calculateNewRating(Integer.parseInt(id1),
					Integer.parseInt(id2), false);
		}

		// Generate random id for next page
		Random random = new Random();
		int val1 = random.nextInt(50) + 1;
		int val2 = 0;
		// make sure 2 random ids not equal
		do {
			val2 = random.nextInt(50) + 1;
		} while (val2 == val1);

		String url1 = FacesDbHandler.getUrl(val1);
		String url2 = FacesDbHandler.getUrl(val2);

		// For ratings table
		ArrayList<FaceRating> fr = FacesDbHandler.getTableData();
		request.setAttribute("tab", fr);

		request.setAttribute("id1", val1);
		request.setAttribute("id2", val2);
		request.setAttribute("url1", url1);
		request.setAttribute("url2", url2);

		// show next page
		getServletConfig().getServletContext()
				.getRequestDispatcher("/Next.jsp").forward(request, response);
	}

}
