package com.example.orderApp.controllers;

import com.example.orderApp.models.Order;
import com.example.orderApp.sevice.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class OrderController {
    @Autowired

    public OrderService orderService;

    @GetMapping(value = "/getAllOrders")
    ResponseEntity<Object> getAllOrders(){
        return  new ResponseEntity<>(orderService.getData(), HttpStatus.OK);
    }

    @PostMapping(value = "/addOrders")
    ResponseEntity <String> addOrders(@RequestBody Order order){
        orderService.addData(order);
        return new ResponseEntity<>("New Order Added", HttpStatus.OK);
    }

    @RequestMapping(value = "/deleteOrder/{id}",method = RequestMethod.DELETE)
    ResponseEntity<String> deleteOrder(@PathVariable("id") int oId){
        orderService.deleteData(oId);
        return new ResponseEntity<>("Order deleted",HttpStatus.OK);
    }

    @RequestMapping(value = "/updateOrder/{id}" , method = RequestMethod.PUT)
    ResponseEntity<String> updateOrder(@PathVariable("id") int oId,@RequestBody Order order){
        orderService.updateData(oId,order);
        return new ResponseEntity<>("Order updated",HttpStatus.OK);
    }
}
