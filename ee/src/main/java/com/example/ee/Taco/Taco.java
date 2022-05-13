package com.example.ee.Taco;

import com.example.ee.database.Database;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;

public class Taco {

        private Database database = new Database("root", "root", "database");
        private StringBuilder descriptionTaco = new StringBuilder("");
        private int price = 0;

        public Taco(HttpServletRequest request, HttpServletResponse response) {
                try {
                        Statement statement = database.getStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM ingredients");

                        while (resultSet.next()) {
                                if (request.getParameter(resultSet.getString("id")) != null) {
                                        descriptionTaco.append(resultSet.getString("name") + ", ");
                                        price += resultSet.getInt("price");
                                }
                        }

                        if (!descriptionTaco.toString().equals(""))
                                descriptionTaco.replace(descriptionTaco.length() - 2, descriptionTaco.length() - 1, ".");

                } catch (SQLException e) {
                        e.printStackTrace();
                }
        }

        public String getDescriptionTaco() {
                return descriptionTaco.toString().toLowerCase(Locale.ROOT);
        }

        public int getPrice() {
                return price;
        }
}
