package com.example.orderApp.controllers;

import com.example.orderApp.entities.Order;
import com.example.orderApp.sevice.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class OrderController {
    @Autowired

    public OrderService orderService;

    @GetMapping(value = "/order/getAll")
    ResponseEntity<Object> getAllOrders(){
        return  new ResponseEntity<>(orderService.getData(), HttpStatus.OK);
    }

    @PostMapping(value = "/order/add")
    ResponseEntity <String> addOrders(@RequestBody Order order){
        orderService.addData(order);
        return new ResponseEntity<>("New Order Added", HttpStatus.OK);
    }

    @RequestMapping(value = "/order/delete/{id}",method = RequestMethod.DELETE)
    ResponseEntity<String> deleteOrder(@PathVariable("id") int order_id){
        orderService.deleteData(order_id);
        return new ResponseEntity<>("Order deleted",HttpStatus.OK);
    }

    @RequestMapping(value = "/order/update/{id}" , method = RequestMethod.PUT)
    ResponseEntity<String> updateOrder(@PathVariable("id") int order_id,@RequestBody Order order){
        orderService.updateData(order_id,order);
        return new ResponseEntity<>("Order updated",HttpStatus.OK);
    }

    @RequestMapping(value = "/order/get/{id}" , method = RequestMethod.GET)
    ResponseEntity<List<Order>> getOrderByEmpId(@PathVariable("id") int employeeId){
        List<Order>  orders = orderService.getOrdersByEmpId(employeeId);
        return new ResponseEntity<>(orders,HttpStatus.OK);
    }
}
