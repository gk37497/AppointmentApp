package com.example.orderApp.sevice;

import com.example.orderApp.entities.OrderType;
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

    public void deleteData(int type_id){
        try{
            orderTypeRepository.deleteById(type_id);
        }
        catch (Exception e){
            throw e;
        }
    }
    public void updateData(int type_id , OrderType orderType){
        try{
            orderTypeRepository.deleteById(type_id);
            orderType.setType_id(type_id);
            orderTypeRepository.save(orderType);
        }
        catch (Exception e){
            throw e;
        }
    }
}
