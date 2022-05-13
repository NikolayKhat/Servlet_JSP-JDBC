package com.example.ee.database;

import com.example.ee.Taco.Ingredient;
import com.example.ee.Taco.Taco;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Database {

    private String userName;
    private String password;
    private String nameDatabase;

    public Database(String userName, String password, String nameDatabase) {
        this.userName = userName;
        this.password = password;
        this.nameDatabase = nameDatabase;
    }

    /* Возвращает Connection */
    public Connection getConnection() {
        try {
            String url = "jdbc:postgresql://localhost:5432/" + nameDatabase;
            Class.forName("org.postgresql.Driver");

            Connection connection = DriverManager.getConnection(url, userName, password);

            return connection;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* Возвращает Statement */
    public Statement getStatement() {
        try {
            String url = "jdbc:postgresql://localhost:5432/" + nameDatabase;
            Class.forName("org.postgresql.Driver");

            Connection connection = DriverManager.getConnection(url, userName, password);
            Statement statement = connection.createStatement();

            return statement;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }


    /* Авторизация */

    /* Проверяет, если ли login в базе данных */
    public boolean checkLogin(String login) {
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = getStatement();
            resultSet = statement.executeQuery("SELECT * FROM accounts");
            while (resultSet.next()) {
                if (resultSet.getString("login").equals(login)) return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closeDB(null, statement, resultSet);
        }
    }

    /* Проверяет пароль от аккаунта*/
    public boolean checkPassword(String login, String password) {
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = getStatement();
            resultSet = statement.executeQuery("SELECT * FROM accounts");
            while (resultSet.next()) {
                if (resultSet.getString("login").equals(login) &&
                        resultSet.getString("password").equals(password)) return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }  finally {
            closeDB(null, statement, resultSet);
        }
    }

    /* Добавляет нового пользователя в базу данных */
    public void addUser(String login, String password) {
        PreparedStatement ps = null;
        try {
            String sql = "insert into accounts (login, password) values (?, ?)";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, login);
            ps.setString(2, password);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeDB(null, ps, null);
        }
    }

    /* Страница создания тако */
    /* Создает список ингредиентов List<Ingredient> */
    public List<Ingredient> createListIngredients() {
        List<Ingredient> listIngredients = new ArrayList<>();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = getStatement();
            resultSet = statement.executeQuery("SELECT * FROM ingredients");
            while (resultSet.next()) {
                listIngredients.add(new Ingredient(resultSet.getString("id"),
                                                    resultSet.getString("name"),
                                                    resultSet.getInt("price")));
            }
            return listIngredients;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            closeDB(null, statement, resultSet);
        }
    }


    /* Корзина */

    /* Добавляет тако в корзину для заданного пользователя */
    public void addTacoInCart(String login, Taco taco) {
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        if (taco.getPrice() != 0) {
            try {
                String sql = "select * from cart where login = ?";
                ps = getConnection().prepareStatement(sql);
                ps.setString(1, login);
                resultSet = ps.executeQuery();

                if (!resultSet.isBeforeFirst()) {
                    String sql1 = "insert into cart (login, number, description, price) values (?, 1, ?, ?)";
                    ps = getConnection().prepareStatement(sql1);
                    ps.setString(1, login);
                    ps.setString(2, taco.getDescriptionTaco());
                    ps.setInt(3, taco.getPrice());
                    ps.executeUpdate();
                } else {
                    String sql1 = "select * from cart where login = ?";
                    ps = getConnection().prepareStatement(sql1);
                    ps.setString(1, login);
                    resultSet = ps.executeQuery();
                    int numberTaco = 1;
                    while (resultSet.next()) {
                        numberTaco += 1;
                    }
                    String sql2 = "insert into cart (login, number, description, price) values (?, ?, ?, ?)";
                    ps = getConnection().prepareStatement(sql2);
                    ps.setString(1, login);
                    ps.setInt(2, numberTaco);
                    ps.setString(3, taco.getDescriptionTaco());
                    ps.setInt(4, taco.getPrice());
                    ps.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                closeDB(null, ps, resultSet);
            }
        }
    }

    /* Создает список номеров для каждого тако */
    public List<Integer> createListTacoNumber(String login) {
        List<Integer> listTacoNumber = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            String sql = "select * from cart where login = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, login);
            resultSet = ps.executeQuery();

            while (resultSet.next()) {
                listTacoNumber.add(resultSet.getInt("number"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeDB(null, ps, resultSet);
        }
        return listTacoNumber;
    }

    /* Создает список описания для каждого тако */
    public List<String> createListTacoDescription(String login) {
        List<String> listTacoDescription = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            String sql = "select * from cart where login = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, login);
            resultSet = ps.executeQuery();

            while (resultSet.next()) {
                listTacoDescription.add(resultSet.getString("description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeDB(null, ps, resultSet);
        }
        return listTacoDescription;
    }

    /* Создает список цен тако */
    public List<Integer> createListTacoPrice(String login) {
        List<Integer> listTacoPrice = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            String sql = "select * from cart where login = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, login);
            resultSet = ps.executeQuery();

            while (resultSet.next()) {
                listTacoPrice.add(resultSet.getInt("price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeDB(null, ps, resultSet);
        }
        return listTacoPrice;
    }

    /* Возвращает общую цену заказа */
    public int createTacoPriceAll(String login) {
        int priceAll = 0;
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
            String sql = "select * from cart where login = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, login);
            resultSet = ps.executeQuery();

            while (resultSet.next()) {
                priceAll += resultSet.getInt("price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeDB(null, ps, resultSet);
        }
        return priceAll;
    }

    /* Удаляет тако из корзины для заданного пользователя */
    public void deleteTaco(String login, Integer tacoNumber) {
        PreparedStatement ps = null;
        try {
            String sql = "delete from cart where login = ? and number = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, login);
            ps.setInt(2, tacoNumber);
            ps.execute();

            sql = "update cart set number = number - 1 where login = ? and number > ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, login);
            ps.setInt(2, tacoNumber);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeDB(null, ps, null);
        }
    }

    /* Очищает корзину клиента после удачной оплаты */
    public void deleteListTaco(String login) {
        PreparedStatement ps = null;
        try {
            String sql = "delete from cart where login = ?";
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, login);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeDB(null, ps, null);
        }
    }

    /* Закрытие соединения с БД */
    public void closeDB(Connection connection, Statement statement, ResultSet resultSet) {
        try {
            if (connection != null) connection.close();
            if (statement != null) statement.close();
            if (resultSet != null) resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
