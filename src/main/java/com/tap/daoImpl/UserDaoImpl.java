package com.tap.daoImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.UserDAO;
import com.tap.model.User;
import com.tap.util.DBConnection;

public class UserDaoImpl implements UserDAO {
	
	private static final String INSERT_QUERY = "INSERT INTO user (userName, email, phoneNumber, password, address, role) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String GET_USER = "SELECT * FROM user WHERE userid = ?;";
	private static final String SELECT_ALL_USERS = "SELECT * FROM user;";
	private static final String UPDATE_USER = "UPDATE user SET userName = ?,email = ?,phoneNumber = ?,password = ?,address = ?,role = ? WHERE userId = ?;";
	private static final String LOGIN_QUERY = 
	        "SELECT * FROM user WHERE email = ? AND password = ?";
	private static final String DELETE_USER= " DELETE FROM user WHERE userId = ?;";

	
	
	@Override
	public void addUser(User user) {
		
		
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);) {
			
			
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPhoneNumber());
			pstmt.setString(4, user.getPassWord());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getRole());
			
			
			int res = pstmt.executeUpdate();
			
			System.out.println( res + " ✅ User Added Successfully!");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
	}
	
	
	@Override
	public User getUser(int id) {

	    User user = null;

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement pstmt = connection.prepareStatement(GET_USER);) {

	        pstmt.setInt(1, id);

	        ResultSet res = pstmt.executeQuery();

	        if (res.next()) {

	            int userid = res.getInt("userid");
	            String username = res.getString("userName");
	            String email = res.getString("email");
	            String phonenumber = res.getString("phoneNumber");
	            String password = res.getString("password");
	            String address = res.getString("address");
	            String role = res.getString("role");

	            user = new User(userid, username, email, phonenumber, password, address, role);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}




	@Override
	public List<User> getAllUser() {
	    
	    List<User> users = new ArrayList<>();
	    
	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL_USERS)) {
	        
	        ResultSet resultSet = pstmt.executeQuery();
	        
	        while (resultSet.next()) {
	            User u = new User(
	                resultSet.getInt("userId"),
	                resultSet.getString("userName"),
	                resultSet.getString("email"),
	                resultSet.getString("phoneNumber"),
	                resultSet.getString("password"),
	                resultSet.getString("address"),
	                resultSet.getString("role")
	            );
	            
	            users.add(u);
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return users;
	}


	@Override
	public void updateUser(User user) {
		
		  try (Connection connection = DBConnection.getConnection();
			         PreparedStatement pstmt = connection.prepareStatement(UPDATE_USER)) {
			  

				pstmt.setString(1, user.getUserName());
				pstmt.setString(2, user.getEmail());
				pstmt.setString(3, user.getPhoneNumber());
				pstmt.setString(4, user.getPassWord());
				pstmt.setString(5, user.getAddress());
				pstmt.setString(6, user.getRole());
				pstmt.setInt(7, user.getUserId());
				
				int result = pstmt.executeUpdate();
				
				   if(result > 0)
			            System.out.println("✅ User Updated Successfully!");
			        else
			            System.out.println("❌ User Not Found!");
				
			  
			  
		  }
		
		  catch (Exception e) {
			  e.printStackTrace();
		}
	}
	
	@Override
	public User loginUser(String email, String password) {

	    User user = null;

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement pstmt = connection.prepareStatement(LOGIN_QUERY)) {

	        pstmt.setString(1, email);
	        pstmt.setString(2, password);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            user = new User(
	                rs.getInt("userId"),
	                rs.getString("userName"),
	                rs.getString("email"),
	                rs.getString("phoneNumber"),
	                rs.getString("password"),
	                rs.getString("address"),
	                rs.getString("role")
	            );
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return user; // returns null if login failed
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	@Override
	public void deleteUser(int id) {

	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement pstmt = connection.prepareStatement(DELETE_USER)) {

	        pstmt.setInt(1, id);

	        int result = pstmt.executeUpdate();

	        if(result > 0) {
	            System.out.println("✅ User Deleted Successfully!");
	        } else {
	            System.out.println("❌ No User Found with ID: " + id);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
	
}

