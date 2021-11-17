package com.example.orderApp.sevice;

import com.example.orderApp.entities.Hospital;
import com.example.orderApp.repositories.HospitalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HospitalService {
    @Autowired
    private HospitalRepository hospitalRepository;

    public List<Hospital> getAll(){
        try {
            return hospitalRepository.findAll();
        }
        catch (Exception e){
            throw e;
        }
    }


    public void add(Hospital hospital){
        try {
            hospitalRepository.save(hospital);
        }
        catch (Exception e){
            throw e;
        }
    }

    public void delete(int hospital_id){
        try {
            hospitalRepository.deleteById(hospital_id);
        }
        catch (Exception e){
            throw e;
        }
    }

    public void update(int hospital_id , Hospital hospital) {
        try {
            hospitalRepository.deleteById(hospital_id);
            hospital.setHospitalId(hospital_id);
            hospitalRepository.save(hospital);
        } catch (Exception e) {
            throw e;
        }
    }
}
