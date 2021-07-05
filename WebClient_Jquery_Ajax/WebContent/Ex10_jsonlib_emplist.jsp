<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//Access-Control-Allow-Origin 에러는 서버가 모든 요청을 허락한다는 코드가 들어와야한다! 
	response.addHeader("Access-Control-Allow-Origin", "*");


	Class.forName("oracle.jdbc.OracleDriver");

	Connection conn = null; 
	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.218:1521:xe","bituser","1004");
	
	Statement  stmt = conn.createStatement(); 
	String sql = "select empno , ename , sal , job ,comm  from emp";
	ResultSet rs = stmt.executeQuery(sql); 
	
	
	//POINT
	//DTO 객체를 생성해서 데이터를 담아야 변환작업을 할 수 있다.
	//데이터가 여러건이면 ArrayList에 add하면된다.
	List<Emp> list = new ArrayList<>();
	
	while(rs.next()){
		Emp emp = new Emp();
		emp.setEmpno(rs.getInt("empno"));
		emp.setEname(rs.getString("ename"));
		emp.setSal(rs.getInt("sal"));
		emp.setJob(rs.getString("job"));
		emp.setComm(rs.getInt("comm"));
		
		list.add(emp);
	}
	
	/*
	데이터가 잘들어왔는지 확인!
	
	for(Emp e : list){
		System.out.println(e.toString());
	}
	*/
	
	//[{},{},[],,,,,, 14개 객체] --> 데이터를 JSON객체로 자동으로 만들어준다!!!!!!!!!!!!!!
	JSONArray jsonlist = JSONArray.fromObject(list);
	
	stmt.close();
	rs.close();
	conn.close();
	
%>    

<%=jsonlist %>
