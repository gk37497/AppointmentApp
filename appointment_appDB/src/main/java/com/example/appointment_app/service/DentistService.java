package com.example.appointment_app.service;

import com.example.appointment_app.entity.DentistEntity;
import com.example.appointment_app.models.Dentist;
import com.example.appointment_app.repository.DentistRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DentistService {

    @Autowired
    public DentistRepository dentistRepository;

    public List<Dentist> getAllDentists(){

        try {
            List<DentistEntity> dentists = dentistRepository.findAll();
            List<Dentist> customDentists = new ArrayList<>();
            dentists.forEach(e -> {
                Dentist dentist = new Dentist();
                BeanUtils.copyProperties(e, dentist);
                customDentists.add(dentist);
            });
            return customDentists;
        }catch(Exception e) {
            throw e;
        }
    }

    public String addDentist(DentistEntity dentist) {
        try {
            if (!dentistRepository.existsByFirstNameAndLastName(dentist.getFirstName(), dentist.getLastName())) {
                dentistRepository.save(dentist);
                return "added ";
            }else {
                return " dentist already exists .";
            }
        }catch (Exception e) {
            throw e;
        }
    }

    public String removeDentist(DentistEntity dentist) {
        try {
            if (dentistRepository.existsByFirstNameAndLastName(dentist.getFirstName(), dentist.getLastName())) {
                dentistRepository.delete(dentist);
                return " deleted .";
            } else {
                return "Dentist does not exist.";
            }
        }catch (Exception e) {
            throw e;
        }
    }

    public String updateDentist(DentistEntity dentist) {
        try {
            if (dentistRepository.existsById(dentist.getId())) {
                dentistRepository.save(dentist);
                return " updated .";
            } else {
                return "Dentist does not exist.";
            }
        }catch (Exception e) {
            throw e;
        }
    }
}
