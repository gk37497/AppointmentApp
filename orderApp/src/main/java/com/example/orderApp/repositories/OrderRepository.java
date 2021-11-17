package com.example.orderApp.repositories;

import com.example.orderApp.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order,Integer> {
    Order findByOrderId(Integer order_id);

    @Query("SELECT o FROM Order AS o WHERE o.employee.employeeId=?1")
    List<Order> findByEmployeeId(Integer id );

//    List<Order> findByDate(LocalDateTime dateTime);
}
