package com.stefanie.store.controllers;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.stefanie.store.models.Cart;
import com.stefanie.store.models.LoginUser;
import com.stefanie.store.models.Product;
import com.stefanie.store.models.Purchase;
import com.stefanie.store.models.User;
import com.stefanie.store.services.CartService;
import com.stefanie.store.services.ProductService;
import com.stefanie.store.services.PurchaseService;
import com.stefanie.store.services.UserService;

@Controller
public class StoreControllers {

	@Autowired
	private ProductService productService;
	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		// Check if a cart exist in session
		Long cartId = (Long) session.getAttribute("cart_id");
		// If not create a new cart
		if (cartId == null) {
			Cart cart = cartService.createCart(new Cart());
			session.setAttribute("cart_id", cart.getId());
		}
		List<Product> allproduct = productService.allProduct();
		List<Product> top3 = new ArrayList<>();
		top3.add(allproduct.get(0));
		top3.add(allproduct.get(1));
		top3.add(allproduct.get(2));
		model.addAttribute("allproduct", top3);

		return "mainpage.jsp";
	}

	@GetMapping("/logout")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:/";

	}

	// All CANDIES
	@GetMapping("/allcandies")
	public String allcandies(Model model, HttpSession session) {
		Long cartId = (Long) session.getAttribute("cart_id");
		// If not create a new cart
		if (cartId == null) {
			Cart cart = cartService.createCart(new Cart());
			session.setAttribute("cart_id", cart.getId());
		}

		//System.out.println("CartId " + cartId);
		List<Product> allproduct = productService.allProduct();
		model.addAttribute("allproduct", allproduct);

		return "allproducts.jsp";

	}

	// CANDIES BY ID
	@GetMapping("/showcandiebyid/{id}")
	public String showbyid(@ModelAttribute("purchase") Purchase purchase, @PathVariable("id") Long id, Model model,
			HttpSession session) {
		Long cartId = (Long) session.getAttribute("cart_id");
		// If not create a new cart
		if (cartId == null) {
			Cart cart = cartService.createCart(new Cart());
			session.setAttribute("cart_id", cart.getId());
		}

		List<Product> allproduct = productService.allProduct();
		List<Product> top3 = new ArrayList<>();
		top3.add(allproduct.get(6));
		top3.add(allproduct.get(4));
		top3.add(allproduct.get(8));
		model.addAttribute("allproduct", top3);
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);
		model.addAttribute("newPurchase", new Purchase());

		return "oneproduct.jsp";
	}
	// LOGIN

	@GetMapping("/log")
	public String log(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}

	// createpurchase
	@PostMapping("/createpurchase")
	public String createpurchase(@Valid @ModelAttribute("purchase") Purchase purchase, HttpSession session) {
		Long cartId = (Long) session.getAttribute("cart_id");
		// If not create a new cart
		//System.out.println(cartId);
		if (cartId == null) {
			Cart cart = cartService.createCart(new Cart());
			session.setAttribute("cart_id", cart.getId());
		}
//		System.out.println("Product id " + purchase.getProduct().getId());
//		System.out.println("cart Id " + cartId);
		Purchase dbPurchase = purchaseService.findProductInCart(purchase.getProduct().getId(), cartId);
		//System.out.println(dbPurchase);
		if (dbPurchase != null) {
			//System.out.println(dbPurchase.getProduct().getName());
			dbPurchase.setAmountof(purchase.getAmountof() + dbPurchase.getAmountof());
			purchaseService.createPurchase(dbPurchase);
		} else {
			purchase.setCart(cartService.findCart(cartId));
			purchaseService.createPurchase(purchase);
		}

		return "redirect:/showpurchase";

	}

	@GetMapping("/showpurchase")
	public String showpurchase(HttpSession session, Model model) {
		model.addAttribute("newUser", new User());
		Long user_id = (Long) session.getAttribute("user_id");
		if (user_id != null) {
		User thisuser= userService.findUser(user_id);
		model.addAttribute("thisuser", thisuser);
		};
		
		Long cartId = (Long) session.getAttribute("cart_id");
		// If not create a new cart
		//System.out.println(cartId);
		if (cartId == null) {
			Cart cart = cartService.createCart(new Cart());
			session.setAttribute("cart_id", cart.getId());
		}

		List<Purchase> allpurchases = purchaseService.allPurchaseCart(cartId);
		model.addAttribute("allpurchases", allpurchases);
		double t = 0;
		for (Purchase purchase2 : allpurchases) {
			t += ((purchase2.getProduct().getPrice()) * purchase2.getAmountof());
			// System.out.println(purchase2.getAmountof());
		}
		double total = Math.round(t * 100.0) / 100.0;
		// System.out.println(total);
		model.addAttribute("total", total);
		return "cart.jsp";

	}

	// Delete product
	@RequestMapping(value = "/delete/{id}/{id_c}")
	public String delete(@PathVariable("id") Long id, @PathVariable("id_c") Long id_c) {
//		System.out.println(id + "====");
//		System.out.println(id_c + "====");

		purchaseService.deletePurchaseCart(id, id_c);
		return "redirect:/showpurchase";
	}

}
