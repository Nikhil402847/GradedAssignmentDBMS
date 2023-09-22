package com.gl.client;


import com.gl.model.Employee;

import com.gl.service.EmployeeServiceImpl;

public class ClientMain {

	public static void main(String[] args) {
		EmployeeServiceImpl employeeService=new EmployeeServiceImpl();
		
		//inserting 5 records
		Employee e1=new Employee(1, "Nikhil", "Nikhil@gmail.com", "7385373587");
		Employee e2=new Employee(2, "Raja", "Raja@gmail.com", "8333752519");
		Employee e3=new Employee(3, "deepthi", "deepthi@gmail.com", "9608062322");
		Employee e4=new Employee(4, "Ranga", "ranga@gmail.com", "9953413641");
		Employee e5=new Employee(5, "kumar", "kumar@gmail.com", "8953849171");
		employeeService.insertRecords(e1);
		employeeService.insertRecords(e2);
		employeeService.insertRecords(e3);
		employeeService.insertRecords(e4);
		employeeService.insertRecords(e5);
		//modifying email column
		employeeService.modifyEmailColumn();
		//adding two records and checking 
		Employee e6=new Employee(6, "rama", "rama@gmail.com", "6281345487");
		Employee e7=new Employee(2, "vamshi", "vamshi@gmail.com", "9440457829");
		employeeService.insertRecords(e6);
		employeeService.insertRecords(e7);
		employeeService.display();
		//updating the name of the employee and phone_number of given id
		employeeService.updateEmployee(3, "karthik", "1234567890");
		//deleting a particular employee id 
		employeeService.deleteEmployee();
		//removing all the records
		employeeService.removeAllRecords();
		
	}

}
