package com.example.orderApp.sevice;

import com.example.orderApp.entities.Employee;
import com.example.orderApp.models.*;
import com.example.orderApp.repositories.EmployeeRepository;
import com.example.orderApp.repositories.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private RoleRepository roleRepository;

    //Get all employees from DB
    public List<Employee> getAllEmployee(){
        try {
            return employeeRepository.findAll();
        }
        catch (Exception e){
            throw e;
        }
    }


    //add employee to DB
    public void addEmployee(Employee employee){
        try {
            employeeRepository.save(employee);
        }
        catch (Exception e){
            throw e;
        }
    }

    //delete employee from DB
    public void deleteEmployee(int employee_id){
        try {
            employeeRepository.deleteById(employee_id);
        }
        catch (Exception e){
            throw e;
        }
    }

    //update employee information
    public void updateEmployee(int employee_id , Employee employee){
        try {
            employeeRepository.deleteById(employee_id);
            employee.setEmployeeId(employee_id);
            employeeRepository.save(employee);
        }
        catch (Exception e){
            throw e;
        }
    }

    public Employee login(LoginForm loginForm){
        try {
            return employeeRepository.findByUsernameAndPassword(loginForm.getUsername(),loginForm.getPassword());
        }
        catch (Exception e){
            throw e;
        }
    }
}
