/**
 * 
 */
package dbhandler;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author Amit
 * 
 */
public class DbConnection {

	private static Connection connection = null;

	public static Connection getConnection() {

		if (connection == null) {
			try {
				String url = "jdbc:mysql://localhost/facemash";
				String username = "root";
				String pwd = "root";

				Class.forName("com.mysql.jdbc.Driver");

				connection = DriverManager.getConnection(url, username, pwd);
			}

			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return connection;

	}

}
