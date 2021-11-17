package com.example.orderApp.repositories;

import com.example.orderApp.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface RoleRepository extends JpaRepository<Role,Integer> {

    @Transactional(readOnly = false)
    @Modifying
    @Query(value = "update dc_role as r set r.roleName=:roleName , r.roleCode=:roleCode where r.roleId=:roleId")
    void updateRole(
            @Param(value = "roleId") int roleId ,
            @Param(value = "roleName") String roleName ,
            @Param(value = "roleCode") String roleCode
    );
}
