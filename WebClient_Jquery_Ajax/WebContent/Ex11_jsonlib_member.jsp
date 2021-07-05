<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="kr.or.bit.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--  	
		<json객체로 변환하는 작업>
		 1. 데이터 1건인   경우 : JSONObject 사용하면 json객체하나를 생성 {}
		 2. 데이터 여러건인 경우 : JSONArray  사용하면 json객체배열을 생성 [{}, {}, {}]
	-->
    
<%
	Member member = new Member();
	 
	//객체 1건일 경우
	JSONObject objmember = JSONObject.fromObject(member);	
%>
<%=objmember%>

<hr>

<%
	//객체 여러개일 경우
	List<Member> memberlist = new ArrayList<>();
	memberlist.add(new Member("hong", "1004", "서울시 강남구", "0"));
	memberlist.add(new Member("kim", "1004", "서울시 강남구", "1"));
	memberlist.add(new Member("park", "1004", "서울시 강남구", "0"));
	
	JSONArray memberarray = JSONArray.fromObject(memberlist);
%>
<%=memberarray%>