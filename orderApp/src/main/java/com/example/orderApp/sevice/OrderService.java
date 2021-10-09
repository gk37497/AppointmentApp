package com.example.orderApp.sevice;

import com.example.orderApp.models.Order;
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

    public void deleteData(int oId){
        try{
            orderRepository.deleteById(oId);
        }
        catch (Exception e){
            throw e;
        }
    }
    public void updateData(int oId , Order order){
        try{
            orderRepository.deleteById(oId);
            order.setoId(oId);
            orderRepository.save(order);
        }
        catch (Exception e){
            throw e;
        }
    }
}
