package com.example.orderApp.sevice;

import com.example.orderApp.models.OrderType;
import com.example.orderApp.repositories.OrderTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderTypeService {
    @Autowired
    public OrderTypeRepository orderTypeRepository;

    public List<OrderType> getData(){
        try {
            return orderTypeRepository.findAll();
        }
        catch (Exception e){
            throw e;
        }
    }
    public void addData(OrderType orderType){
        try{
            orderTypeRepository.save(orderType);
        }
        catch (Exception e){
            throw e;
        }
    }

    public void deleteData(int tId){
        try{
            orderTypeRepository.deleteById(tId);
        }
        catch (Exception e){
            throw e;
        }
    }
    public void updateData(int tId , OrderType orderType){
        try{
            orderTypeRepository.deleteById(tId);
            orderType.settId(tId);
            orderTypeRepository.save(orderType);
        }
        catch (Exception e){
            throw e;
        }
    }
}
