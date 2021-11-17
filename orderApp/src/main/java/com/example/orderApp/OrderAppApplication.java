package com.example.orderApp;

import com.example.orderApp.entities.*;
import com.example.orderApp.models.*;
import com.example.orderApp.repositories.*;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@SpringBootApplication
public class OrderAppApplication {
	public static void main(String[] args) {
    ConfigurableApplicationContext configurableApplicationContext = SpringApplication.run(OrderAppApplication.class, args);

		EmployeeRepository employeeRepository = configurableApplicationContext.getBean(EmployeeRepository.class);
		RoleRepository roleRepository = configurableApplicationContext.getBean(RoleRepository.class);
		HospitalRepository hospitalRepository = configurableApplicationContext.getBean(HospitalRepository.class);
		OrderRepository orderRepository = configurableApplicationContext.getBean(OrderRepository.class);
		OrderTypeRepository orderTypeRepository = configurableApplicationContext.getBean(OrderTypeRepository.class);

//		Role role1 = new Role("Эмч","dentist");
//		Role role2 = new Role("Админ","admin");
//		Role role3 = new Role("Угтагч","reception");
//
//		List<Role> roles = Arrays.asList(role1,role3,role2);
//		roleRepository.saveAll(roles);
//
//		Hospital hospital1 = new Hospital("Super tooth");
//		Hospital hospital2 = new Hospital("A Dental Clinic");
//
//		hospitalRepository.save(hospital1);
//		hospitalRepository.save(hospital2);
//
//		Employee employee1 = new Employee("user2","pass2","Bold","Bat",99881122, LocalDate.now(),hospital1);
//		Employee employee2 = new Employee("user3","pass3","Enkhtur","Boloro",99881122, LocalDate.now(),hospital2);
//
//
//
//
//		List<Employee> employees = Arrays.asList(employee1,employee2);
//
//		employee1.setEmployeeRole(role1);
//		employee1.setEmployeeRole(role2);
//		employee2.setEmployeeRole(role3);
//		employee2.setEmployeeRole(role1);
//
//		employeeRepository.saveAll(employees);
//
//
//
//		OrderType orderType1 = new OrderType("Цэвэрлэгээ","cleaning",180,hospital1);
//		OrderType orderType2 = new OrderType("Имплант","dental_implant",180,hospital1);
//
//		orderTypeRepository.save(orderType1);
//		orderTypeRepository.save(orderType2);
//
//		Order newOrder = new Order(
//				"Хангай",
//				"HUD 10-3-58",
//				99903716,
//				LocalDateTime.now(),
//				LocalDateTime.now(),
//				0,
//				employee1,
//				orderType1);
//
//		Order newOrder1 = new Order(
//				"Туяа",
//				"HUD 10-3-58",
//				80309414,
//				LocalDateTime.now(),
//				LocalDateTime.now(),
//				0,
//				employee2,
//				orderType2);
//
//		orderRepository.save(newOrder);
//		orderRepository.save(newOrder1);

//	 List<Role> employeeList = employeeRepository.findUserRolesByEmployeeId(1);
//	 employeeList.forEach(e->System.out.println(e.getRoleName() + " " + e.getRoleCode()));
//		Order order = orderRepository.findByOrderId(100);
//		System.out.println(order.getEmployee().getOrders());

	}
}
