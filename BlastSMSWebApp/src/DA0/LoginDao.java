package DA0;

import java.sql.*;

import Model.LoginModel;
import Utility.JDBCUtility;


public class LoginDao {

	public boolean validate(LoginModel loginModel) throws ClassNotFoundException {
		boolean status = false;

		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection connection = JDBCUtility.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from users where username = ? and password = ? ")) {
			preparedStatement.setString(1, loginModel.getUsername());
			preparedStatement.setString(2, loginModel.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			// process sql exception
			JDBCUtility.printSQLException(e);
		}
		return status;
	}
}

