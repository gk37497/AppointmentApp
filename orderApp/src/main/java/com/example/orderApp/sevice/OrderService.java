package com.example.orderApp.sevice;

import com.example.orderApp.entities.Order;
import com.example.orderApp.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
@Autowired
    public OrderRepository orderRepository;


    public List<Order> getData(){
        try {
            return orderRepository.findAll();
        }
        catch (Exception e){
            throw e;
        }
    }
    public void addData(Order order){
        try{
            orderRepository.save(order);
        }
        catch (Exception e){
            throw e;
        }
    }

    public void deleteData(int order_id){
        try{
            orderRepository.deleteById(order_id);
        }
        catch (Exception e){
            throw e;
        }
    }
    public void updateData(int order_id , Order order){
        try{
            orderRepository.deleteById(order_id);
            order.setOrderId(order_id);
            orderRepository.save(order);
        }
        catch (Exception e){
            throw e;
        }
    }

    public List<Order> getOrdersByEmpId(int emp_id){
        return orderRepository.findByEmployeeId(emp_id);
    }
}
