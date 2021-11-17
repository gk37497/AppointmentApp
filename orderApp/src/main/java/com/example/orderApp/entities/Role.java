package com.example.orderApp.entities;

import com.example.orderApp.entities.Employee;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity(name = "dc_role")
public class Role {
    @Id
    @SequenceGenerator(
            name = "role_sequence",
            sequenceName = "role_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "role_sequence"
    )

    private int roleId;
    private String roleName;
    private String roleCode;

    @ManyToMany(mappedBy = "empRoles",fetch = FetchType.EAGER)
    List<Employee> employees = new ArrayList<>();

    public Role(String roleName, String roleCode) {
        this.roleName = roleName;
        this.roleCode = roleCode;
    }

    public Role() {
    }

    public void setEmployee(Employee employee){
        employees.add(employee);
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    @Override
    public String toString() {
        return "Role{" +
                "role_id=" + roleId +
                ", role_name='" + roleName + '\'' +
                ", role_code='" + roleCode + '\'' +
                '}';
    }
}
