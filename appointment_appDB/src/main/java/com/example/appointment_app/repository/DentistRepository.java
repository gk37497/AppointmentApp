package com.example.appointment_app.repository;

import com.example.appointment_app.entity.DentistEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DentistRepository extends JpaRepository<DentistEntity,Integer> {
    public boolean existsByFirstNameAndLastName(String firstName,  String lastName);
    public boolean existsById(int id);

}
