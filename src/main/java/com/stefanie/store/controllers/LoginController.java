package com.stefanie.store.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.stefanie.store.models.Cart;
import com.stefanie.store.models.LoginUser;
import com.stefanie.store.models.User;
import com.stefanie.store.services.CartService;
import com.stefanie.store.services.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;

//	   
//    @GetMapping("/")
//    public String index(Model model) {
//    
//        // Bind empty User and LoginUser objects to the JSP
//        // to capture the form input
//        model.addAttribute("newUser", new User());
//        model.addAttribute("newLogin", new LoginUser());
//        return "index.jsp";
//    }
//    
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {

		// TO-DO Later -- call a register method in the service
		userService.register(newUser, result);
		// to do some extra validations and create a new user!

		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		} else {
			// No errors!
			// TO-DO Later: Store their ID from the DB in session,
			// in other words, log them in.
			session.setAttribute("user_id", newUser.getId());

			session.setAttribute("user_id", newUser.getId());
			Long cartId = (Long) session.getAttribute("cart_id");
			// If not create a new cart
			if (cartId == null) {
				Cart cart = cartService.createCart(new Cart());
				session.setAttribute("cart_id", cart.getId());
			} else {
				Cart cart = cartService.findCart(cartId);
				cart.setUser(newUser);
				cartService.createCart(cart);
			}

			return "redirect:/allcandies";

		}

	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		// Add once service is implemented:
		User user = userService.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		} else {
			session.setAttribute("user_id", user.getId());
			Long cartId = (Long) session.getAttribute("cart_id");
			// If not create a new cart
			if (cartId == null) {
				Cart cart = cartService.createCart(new Cart());
				session.setAttribute("cart_id", cart.getId());
			} else {
				Cart cart = cartService.findCart(cartId);
				cart.setUser(user);
				cartService.createCart(cart);
			}

			return "redirect:/showpurchase";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.

	}

	@GetMapping("/main")
	public String main(HttpSession s, Model model) {
		Long userId = (Long) s.getAttribute("user_id");
		// check if is in session
		if (userId == null) {
			return "redirect:/";
		} else {
			User thisUser = userService.findUser(userId);
			model.addAttribute("thisUser", thisUser);
			return "main.jsp";
		}
	}

}
