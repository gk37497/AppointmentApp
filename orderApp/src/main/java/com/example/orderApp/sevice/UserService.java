package com.example.orderApp.sevice;

import com.example.orderApp.models.User;
import com.example.orderApp.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<User> getData(){
        try {
            return userRepository.findAll();
        }
        catch (Exception e){
            throw e;
        }
    }

    public void addData(User user){
        try{
            userRepository.save(user);
        }
        catch (Exception e){
            throw e;
        }
    }

    public void deleteData(int userID){
        try{
            userRepository.deleteById(userID);
        }
        catch (Exception e){
            throw e;
        }
    }
    //Update data
    public void updateData(int userID , User user){
        try{
            userRepository.deleteById(userID);
            user.setUserId(userID);
            userRepository.save(user);
        }
        catch (Exception e){
            throw e;
        }
    }

    public User login(String username , String password){
        try {
            User oldUser = userRepository.findByUserNameAndPassword(username,password);
            System.out.println(oldUser);
            return oldUser;
        }
        catch (Exception e){
            throw e;
        }
    }


}
