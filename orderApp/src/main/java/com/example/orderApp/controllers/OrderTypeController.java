package com.example.orderApp.controllers;

import com.example.orderApp.models.OrderType;
import com.example.orderApp.sevice.OrderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class OrderTypeController {
    @Autowired
    public OrderTypeService orderTypeService;


    @GetMapping(value = "/getAllTypes")
    ResponseEntity<Object> getAllTypes(){
        return  new ResponseEntity<>(orderTypeService.getData(), HttpStatus.OK);
    }

    @PostMapping(value = "/addOrderType")
    ResponseEntity <String> addOrderType(@RequestBody OrderType orderType){
        orderTypeService.addData(orderType);
        return new ResponseEntity<>("New Order Type Added", HttpStatus.OK);
    }

    @RequestMapping(value = "/deleteType/{id}",method = RequestMethod.DELETE)
    ResponseEntity<String> deleteOrderType(@PathVariable("id") int tId){
        orderTypeService.deleteData(tId);
        return new ResponseEntity<>("Order Type Deleted",HttpStatus.OK);
    }

    @RequestMapping(value = "/updateType/{id}" , method = RequestMethod.PUT)
    ResponseEntity<String> updateType(@PathVariable("id") int tId,@RequestBody OrderType orderType){
        orderTypeService.updateData(tId,orderType);
        return new ResponseEntity<>("Order Type Updated",HttpStatus.OK);
    }
}
