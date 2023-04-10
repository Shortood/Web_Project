
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Servlet implementation class Web_Word_6_1
 */
@WebServlet("/webwork_6-1")
public class Web_Word_6_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Web_Word_6_1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		String number = request.getParameter("number");
		String address = request.getParameter("address");
		PrintWriter out = response.getWriter();

		out.println("<HTML>");
		out.println("<HEAD></HEAD>");
		out.println("<BODY>");
		out.println("NAME = " + name + "<br/>");
		out.println("PHONE = " + number + "<br/>");
		out.println("ADDRESS = " + address + "<br/>");
		out.println("</BODY");
		out.println("</HTML>");
	}

}
