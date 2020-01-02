package App.Utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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

    public static byte[] getImageByte(String uri){
        Path path = Paths.get(uri);
        byte[] byteArray = null;
        try {
            byteArray = Files.readAllBytes(path);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return byteArray;
    }
}
