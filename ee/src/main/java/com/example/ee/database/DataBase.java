package com.example.ee.database;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataBase {

    private Map<Integer, String[]> mapAccount = new HashMap<>();


    public DataBase() {
        mapAccount.put(1, new String[]{"Ivan", "1234"});
        mapAccount.put(2, new String[]{"Max", "12345"});
        mapAccount.put(3, new String[]{"Admin", "Admin"});
    }

    public boolean checkAccount(HttpServletRequest request, HttpServletResponse response) {
        for (Map.Entry<Integer, String[]> user: mapAccount.entrySet()) {
            if (user.getValue()[0].equals(request.getParameter("userNameLogin")) &&
                    user.getValue()[1].equals(request.getParameter("passwordLogin"))) {
                return true;
            }
        }
        return false;
    }
}
