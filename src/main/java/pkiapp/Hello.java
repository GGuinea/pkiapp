package pkiapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;

public class Hello extends HttpServlet {
    private static final long serialVersionUID = -4751096228274971485L;
    private String tokID;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");

        try {
            String idToken = req.getParameter("id_token");
            tokID = idToken;
            GoogleIdToken.Payload payLoad = IdTokenVerifierAndParser.getPayload(idToken);
            String name = (String) payLoad.get("name");
            String email = payLoad.getEmail();
            System.out.println("User name: " + name);
            System.out.println("User email: " + email);

            HttpSession session = req.getSession(true);
            session.setAttribute("userName", name);
            req.getRequestDispatcher("/welcome.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
        @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        for(int i = 0; i < cookies.length; i++) {
            cookies[i].setValue(null);
            cookies[i].setMaxAge(0);
            resp.addCookie(cookies[i]);
        }
        resp.setContentType("text/html");
        try {
            HttpClient client= new DefaultHttpClient();
            HttpPost post = new HttpPost("https://accounts.google.com/o/oauth2/revoke?token="+tokID);
            org.apache.http.HttpResponse response = client.execute(post); 
            resp.sendRedirect("/");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}