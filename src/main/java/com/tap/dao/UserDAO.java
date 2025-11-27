package com.tap.dao;
import com.tap.model.*;
import java.util.List;


public interface UserDAO {
	void addUser(User user);
	User getUser(int id);
	List<User> getAllUser();
	void updateUser(User user);
	User loginUser(String email, String password);
	void deleteUser(int id);

}
