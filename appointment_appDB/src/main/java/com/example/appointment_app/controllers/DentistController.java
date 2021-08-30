package com.example.appointment_app.controllers;

import com.example.appointment_app.entity.DentistEntity;
import com.example.appointment_app.models.Dentist;
import com.example.appointment_app.service.DentistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class DentistController {
    @Autowired
    DentistService dentistService;

    @RequestMapping(value = "/getAllDentists",method = RequestMethod.GET)
    public List<Dentist> getAllDentists(){
        return dentistService.getAllDentists();
    }

    @RequestMapping(value = "/addDentist", method = RequestMethod.POST)
    public String addDentist(@RequestBody DentistEntity dentist) {
        return dentistService.addDentist(dentist);
    }

    @RequestMapping(value = "/updateDentist", method = RequestMethod.PUT)
    public String updateDentist(@RequestBody DentistEntity dentist) {
        return dentistService.updateDentist(dentist);
    }

    @RequestMapping(value = "/deleteDentist", method = RequestMethod.DELETE)
    public String removeEmployee(@RequestBody DentistEntity dentist) {
        return dentistService.removeDentist(dentist);
    }
}
