package com.example.orderApp.repositories;

import com.example.orderApp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {
    User findByUserNameAndPassword(String username , String password);
}
