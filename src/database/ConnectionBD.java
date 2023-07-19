package database;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionBD {

    public static Connection getConeConnection() {
        String url = "jdbc:sqlserver://localhost:1433;database=master;user=sa;password=190375;loginTimeout=30;TrustServerCertificate=True;";

        try {
            Connection con = java.sql.DriverManager.getConnection(url);
            return con;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return null;
        }

    }

    public static void main(String[] args) {
        //  traemos todas las bases de datos del sistema
        
        try {
            Statement st = getConeConnection().createStatement();
            java.sql.ResultSet resultSet = st.executeQuery("SELECT name FROM sys.databases");
            while (resultSet.next()) {
                System.out.println(resultSet.getString(1));
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
            
        }

    }
}
