package com.example.orderApp.controllers;

import com.example.orderApp.entities.Role;
import com.example.orderApp.sevice.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping(value = "/role/getAll")
    ResponseEntity<Object> getAll(){
        return new ResponseEntity<>(roleService.getAll(), HttpStatus.OK);
    }

    @PostMapping(value = "/role/add")
    ResponseEntity<String> add(@RequestBody Role role){
        roleService.add(role);
        return new ResponseEntity<>("new role added",HttpStatus.OK);
    }


    @RequestMapping(value = "/role/delete/{id}",method = RequestMethod.DELETE)
    ResponseEntity<String> delete(@PathVariable("id") int role_id){
        roleService.delete(role_id);
        return new ResponseEntity<>("Role deleted",HttpStatus.OK);
    }

    @RequestMapping(value = "/role/update/{id}" , method = RequestMethod.PUT)
    ResponseEntity<String> update(@PathVariable("id") int role_id,@RequestBody Role role){
        roleService.update(role_id,role);
        return new ResponseEntity<>("role updated",HttpStatus.OK);
    }
}
