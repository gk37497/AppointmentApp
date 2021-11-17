package com.example.orderApp.repositories;

import com.example.orderApp.entities.OrderType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderTypeRepository extends JpaRepository<OrderType,Integer> {

}
