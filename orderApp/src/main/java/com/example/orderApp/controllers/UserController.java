package com.example.orderApp.controllers;

import com.example.orderApp.models.LoginForm;
import com.example.orderApp.models.User;
import com.example.orderApp.sevice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping(value = "/getAllUser")
    ResponseEntity<Object> getAllUsers(){
        return  new ResponseEntity<>(userService.getData(), HttpStatus.OK);
    }

    @PostMapping(value = "/addUser")
    ResponseEntity <String> addUser(@RequestBody User user){
        userService.addData(user);
        return new ResponseEntity<>("New user Added", HttpStatus.OK);
    }

    @RequestMapping(value = "/deleteUser/{id}",method = RequestMethod.DELETE)
    ResponseEntity<String> deleteUser(@PathVariable("id") int userId){
        userService.deleteData(userId);
        return new ResponseEntity<>("User deleted",HttpStatus.OK);
    }

    @RequestMapping(value = "/updateUser/{id}" , method = RequestMethod.PUT)
    ResponseEntity<String> updateUser(@PathVariable("id") int userId,@RequestBody User user){
        userService.updateData(userId,user);
        return new ResponseEntity<>("User updated",HttpStatus.OK);
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    ResponseEntity<Object> loginUser(@RequestBody LoginForm loginForm){
        System.out.println(loginForm.getUsername() + " " + loginForm.getPassword());
        return new ResponseEntity<Object>(userService.login(loginForm.getUsername(),loginForm.getPassword()),HttpStatus.OK);
    }
}
