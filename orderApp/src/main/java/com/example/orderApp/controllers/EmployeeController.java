package com.example.orderApp.controllers;

import com.example.orderApp.entities.Employee;
import com.example.orderApp.models.LoginForm;
import com.example.orderApp.sevice.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping(value = "/employee/getAll")
    ResponseEntity<Object> getAll(){
        return new ResponseEntity<>(employeeService.getAllEmployee(), HttpStatus.OK);
    }

    @PostMapping(value = "/employee/add")
    ResponseEntity<String> add(@RequestBody Employee employee){
        employeeService.addEmployee(employee);
        return new ResponseEntity<>("new employee added",HttpStatus.OK);
    }


    @RequestMapping(value = "/employee/delete/{id}",method = RequestMethod.DELETE)
    ResponseEntity<String> delete(@PathVariable("id") int employee_id){
        employeeService.deleteEmployee(employee_id);
        return new ResponseEntity<>("Employee deleted",HttpStatus.OK);
    }

    @RequestMapping(value = "/employee/update/{id}" , method = RequestMethod.PUT)
    ResponseEntity<String> update(@PathVariable("id") int employee_id,@RequestBody Employee employee){
        employeeService.updateEmployee(employee_id,employee);
        return new ResponseEntity<>("employee updated",HttpStatus.OK);
    }

    @RequestMapping(value = "/employee/login" , method = RequestMethod.POST)
    ResponseEntity<Object> login(@RequestBody LoginForm loginForm){
        System.out.println("Username from controller" + loginForm.getUsername());
        return new ResponseEntity<>(employeeService.login(loginForm),HttpStatus.OK);
    }

}
