package com.example.orderApp.sevice;

import com.example.orderApp.entities.Role;
import com.example.orderApp.repositories.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService
{

    @Autowired
    private RoleRepository roleRepository;

    public List<Role> getAll(){
        try {
            return roleRepository.findAll();
        }
        catch (Exception e){
            throw e;
        }
    }


    public void add(Role role){
        try {
            roleRepository.save(role);
        }
        catch (Exception e){
            throw e;
        }
    }

    public void delete(int role_id){
        try {
            roleRepository.deleteById(role_id);
        }
        catch (Exception e){
            throw e;
        }
    }

    public void update(int role_id , Role role){
        try {
            roleRepository.updateRole(role_id,role.getRoleName(),role.getRoleCode());
        }
        catch (Exception e){
            throw e;
        }
    }
}
