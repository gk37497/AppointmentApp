package com.example.orderApp.sevice;

import com.example.orderApp.models.Dentist;
import com.example.orderApp.repositories.DentistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DentistService {

    @Autowired
    private DentistRepository dentistRepository;

    //Get all dentists data from database
    public List<Dentist> getData(){
        try {
            return dentistRepository.findAll();
        }
        catch (Exception e){
            throw e;
        }
    }
    //Add dentist to database
    public void addData(Dentist dentist){
        try{
            dentistRepository.save(dentist);
        }
        catch (Exception e){
            throw e;
        }
    }

    //Delete dentist data from database
    public void deleteData(int dId){
        try{
            dentistRepository.deleteById(dId);
        }
        catch (Exception e){
            throw e;
        }
    }
    //Update data
    public void updateData(int dId , Dentist dentist){
        try{
            dentistRepository.deleteById(dId);
            dentist.setdId(dId);
            dentistRepository.save(dentist);
        }
        catch (Exception e){
            throw e;
        }
    }
}