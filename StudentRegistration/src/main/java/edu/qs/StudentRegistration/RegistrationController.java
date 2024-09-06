package edu.qs.StudentRegistration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

import java.util.List;

@Controller
public class RegistrationController {

    @Autowired
    private UserService userService;
    
   


    @GetMapping("")
    public String viewHomePage() {
        return "index";
    }
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/process_login")
    public String processLogin(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               Model model,
                               HttpSession session) {
        User user = userService.findUserByEmail(email);

        // Check if user exists and password matches
        if (user != null && user.getPassword().equals(password)) {
            // Store user in session
            session.setAttribute("loggedInUser", user);
            return "redirect:/list_users"; // Redirect to list users page after successful login
        } else {
            // Return login page with error message
            model.addAttribute("error", "Invalid email or password");
            return "login";
        }
    }

    @GetMapping("/register")
    public String showSignUpForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register_sucess")
    public ModelAndView processRegister(@RequestParam("email") String email,
                                        @RequestParam("password") String password,
                                        @RequestParam("first_name") String firstName,
                                        @RequestParam("last_name") String lastName) {

        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setFirst_name(firstName);
        user.setLast_name(lastName);

        userService.saveUser(user);

        ModelAndView mav = new ModelAndView("register_sucess");
        mav.addObject("user", user);
        return mav;
    }

    @GetMapping("/list_users")
    public String listUsers(Model model, HttpSession session) {
        // Check if the user is logged in
        if (session.getAttribute("loggedInUser") == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "list_users";
    }
    
    @GetMapping("/update_user")
    public String showUpdateForm(@RequestParam("id") Long id, Model model) {
        User user = userService.findUserById(id);
        model.addAttribute("user", user);
        return "update_user";  // Return the JSP view for updating the user
    }

    @PostMapping("/process_update")
    public String processUpdate(User updatedUser) {
        // Fetch the existing user from the database
        User existingUser = userService.findUserById(updatedUser.getId());

        // Update the user's details
        existingUser.setEmail(updatedUser.getEmail());
        existingUser.setPassword(updatedUser.getPassword());
        existingUser.setFirst_name(updatedUser.getFirst_name());
        existingUser.setLast_name(updatedUser.getLast_name());

        // Save the updated user back to the database
        userService.saveUser(existingUser);

        return "redirect:/list_users";  // Redirect to the user list page after updating
    }
    
    @GetMapping("/delete_user")
    public String deleteUser(@RequestParam("id") Long id) {
        userService.deleteUserById(id);
        return "redirect:/list_users";  // Redirect back to the list of users after deletion
    }
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the session
        return "redirect:/login"; // Redirect to login page after logout
    }


}
