package App.Utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Util{
    public static Cookie getCookie(HttpServletRequest request, String name) {
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals(name)) {
                    return cookie;
                }
            }
        }

        return null;
    }

}
