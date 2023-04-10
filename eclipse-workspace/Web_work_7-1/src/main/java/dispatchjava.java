

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
/**
 * Servlet implementation class dispatchjava
 */
@WebServlet("/dispatchjava")
public class dispatchjava extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dispatchjava() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("test/html;charset=UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("work.jsp");
		request.setAttribute("request", "requestValue");
		request.setAttribute("requestName", "Kang-Woo-Bin");
		dispatcher.forward(request, response);
	}

}
