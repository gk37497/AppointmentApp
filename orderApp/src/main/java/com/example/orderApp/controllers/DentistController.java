package com.example.orderApp.controllers;

import com.example.orderApp.models.Dentist;
import com.example.orderApp.sevice.DentistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class DentistController {

    @Autowired
    public DentistService dentistService;

    @GetMapping(value = "/getAllDentists")
    ResponseEntity<Object> getAllDentists(){
        return  new ResponseEntity<>(dentistService.getData(),HttpStatus.OK);
    }

    @PostMapping(value = "/addDentist")
    ResponseEntity <String> addDentist(@RequestBody Dentist dentist){
        dentistService.addData(dentist);
        return new ResponseEntity<>("New Dentist Added", HttpStatus.OK);
    }

    @RequestMapping(value = "/deleteDentist/{id}",method = RequestMethod.DELETE)
    ResponseEntity<String> deleteDentist(@PathVariable("id") int dId){
        dentistService.deleteData(dId);
        return new ResponseEntity<>("Dentist deleted",HttpStatus.OK);
    }

    @RequestMapping(value = "/updateDentist/{id}" , method = RequestMethod.PUT)
    ResponseEntity<String> updateDentist(@PathVariable("id") int dId,@RequestBody Dentist dentist){
        dentistService.updateData(dId,dentist);
        return new ResponseEntity<>("Dentist updated",HttpStatus.OK);
    }
}
