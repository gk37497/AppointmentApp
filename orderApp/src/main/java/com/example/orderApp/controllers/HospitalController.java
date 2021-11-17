package com.example.orderApp.controllers;

import com.example.orderApp.entities.Hospital;
import com.example.orderApp.sevice.HospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class HospitalController {

    @Autowired
    private HospitalService hospitalService;


    @GetMapping(value = "/hospital/getAll")
    ResponseEntity<Object> getAll(){
        return new ResponseEntity<>(hospitalService.getAll(), HttpStatus.OK);
    }

    @PostMapping(value = "/hospital/add")
    ResponseEntity<String> add(@RequestBody Hospital hospital){
        hospitalService.add(hospital);
        return new ResponseEntity<>("new hospital added",HttpStatus.OK);
    }


    @RequestMapping(value = "/hospital/delete/{id}",method = RequestMethod.DELETE)
    ResponseEntity<String> delete(@PathVariable("id") int hospital_id){
        hospitalService.delete(hospital_id);
        return new ResponseEntity<>("Hospital deleted",HttpStatus.OK);
    }

    @RequestMapping(value = "/hospital/update/{id}" , method = RequestMethod.PUT)
    ResponseEntity<String> update(@PathVariable("id") int hospital_id,@RequestBody Hospital hospital){
        hospitalService.update(hospital_id,hospital);
        return new ResponseEntity<>("Hospital updated",HttpStatus.OK);
    }
}
