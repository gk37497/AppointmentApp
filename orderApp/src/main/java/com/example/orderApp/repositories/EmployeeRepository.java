package com.example.orderApp.repositories;

import com.example.orderApp.entities.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface EmployeeRepository extends JpaRepository<Employee,Integer> {
     Employee findByUsernameAndPassword(String username,String password);

}
