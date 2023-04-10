
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Servlet implementation class Web_Work_6_2
 */
@WebServlet("/webwork_6-2")
public class Web_Work_6_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Web_Work_6_2() {
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
		String number1 = request.getParameter("number1");
		String number2 = request.getParameter("number2");
		int intnumber1 = Integer.parseInt(number1);
		int intnumber2 = Integer.parseInt(number2);
		PrintWriter out = response.getWriter();

		out.println("<HTML>");
		out.println("<HEAD></HEAD>");
		out.println("<BODY>");
		out.println("ADD = " + (intnumber1+intnumber2) + "<br/>");
		out.println("SUB = " + (intnumber1-intnumber2) + "<br/>");
		out.println("MUL = " + (intnumber1*intnumber2) + "<br/>");
		out.println("DIV = " + (intnumber1/intnumber2) + "<br/>");
		out.println("</BODY");
		out.println("</HTML>");
	}

}
