package pkiapp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {

    private static final long serialVersionUID = -4751096228274971485L;
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";

    private static Connection getConnection() throws URISyntaxException, SQLException {
        URI dbUri = new URI(
                "postgres://cufyfhbntvbmps:b36f62b672799e429f35145edaf4580617a16e2a05131167271cc380cef277d7@ec2-54-247-94-127.eu-west-1.compute.amazonaws.com:5432/d76jkk36ue2tp4");
        String username = dbUri.getUserInfo()
                               .split(":")[0];
        String password = dbUri.getUserInfo()
                               .split(":")[1];
        String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + dbUri.getPath();

        return DriverManager.getConnection(dbUrl, username, password);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        List<String> errorList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {
            statement.setInt(1, Integer.parseInt(id));
            statement.executeUpdate();
        } catch (Exception e) {
            printSQLException(e, request, response);
        } request.setAttribute("errorList", errorList);
        RequestDispatcher view = request.getRequestDispatcher("status.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("deleteUser.jsp");
    }

    private void printSQLException(Exception e, HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        List<String> errorList = new ArrayList<>();
        if (e instanceof SQLException) {
            e.printStackTrace(System.err);
            errorList.add(e.getMessage());
            System.err.println("SQLState: " + ((SQLException) e).getSQLState());
            System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
            System.err.println("Message: " + e.getMessage());
        } else {
            errorList.add(e.getMessage());
        }
        req.setAttribute("errorList", errorList);
        RequestDispatcher view = req.getRequestDispatcher("status.jsp");
        view.forward(req, response);
    }
}
