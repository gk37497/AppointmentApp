package com.example.appointment_app.repository;


import com.example.appointment_app.entity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity,Integer> {
    public boolean existsByOrderIdAndName(String oID,String consumerName);
    public boolean existsById(int id);

}
