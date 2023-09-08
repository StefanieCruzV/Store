package com.stefanie.store.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.stefanie.store.models.LoginUser;
import com.stefanie.store.models.User;
import com.stefanie.store.repos.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;

	// TO-DO: Write register and login methods!
	// ===========REGISTER========
	public User register(User newUser, BindingResult result) {
		// TO-DO: Additional validations!
		Optional<User> potencialUser = userRepo.findByEmail(newUser.getEmail());
		if (potencialUser.isPresent()) {
			result.rejectValue("mail", "registerError", "this email is taken");
		}
		if (!newUser.getPassword().isBlank() && !newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "registerError", "password must match");
		}
		// return errors back
		if (result.hasErrors()) {
			return null;
		} else {
			// hash the password
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			// save user inn the db
			return userRepo.save(newUser);
		}
	}

	// ===========LOGIN========
	public User login(LoginUser newLoginObject, BindingResult result) {
		// TO-DO: Additional validations!
		Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "loginError", "This email is not registered ");
		} else {
			User user = potentialUser.get();
			// bcryp chech the passwords
			if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
				result.rejectValue("password", "loginError", "The password is incorrect");
			}
			if (result.hasErrors()) {
				return null;
			}else {
				return user;
			}
		}

		return null;
	}

	// **********************************
	// returns all
	public List<User> allUser() {
		return userRepo.findAll();
	}

	// CREATE
	public User createUser(User b) {
		return userRepo.save(b);
	}

	// -READ ONE
	public User findUser(Long id) {

		Optional<User> optionalUser = userRepo.findById(id);

		// return optionalExpense.isPresent()? optionalExpense.get():null;

		if (optionalUser.isPresent()) {
			return optionalUser.get();
		} else {
			return null;
		}
	}

	// update
	public User updateUser(User b) {
		User updatedUser = userRepo.save(b);
		return updatedUser;
	}

	//
	// delete
	public void deleteUser(Long id) {
		userRepo.deleteById(id);
	}

}