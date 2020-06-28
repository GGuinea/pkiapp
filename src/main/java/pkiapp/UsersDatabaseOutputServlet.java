package pkiapp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsersDatabaseOutputServlet extends HttpServlet {

    private static final long serialVersionUID = -4751096228274971485L;

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<UsersDatabaseOutput> output = new ArrayList<>();
            Statement stmt = getConnection().createStatement();
            ResultSet rs = stmt.executeQuery("Select * from users");
            while (rs.next()) {
            output.add(new UsersDatabaseOutput(rs.getInt("id"), rs.getString("name"), rs.getTimestamp("joined").toString(),
                        rs.getTimestamp("lastvisit").toString(), rs.getInt("counter")));
            }
            req.setAttribute("data", output);
            RequestDispatcher view = req.getRequestDispatcher("users.jsp");
            view.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

    }
}
