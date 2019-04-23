<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="kr.or.bit.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Member member = new Member();
// String jsonstr="{"+username:" +member.getName()....
	JSONObject obj = JSONObject.fromObject(member);
//{"address":"경기도 성남시","admin":"1","password":"1004","username":"bituser"}

%>
<%=obj%>
<%
List<Member>memberlist=new ArrayList<>();
memberlist.add(new Member("hong","1004","서울시 강남구","0"));
memberlist.add(new Member("kim","1023","서울시 용산구","1"));
memberlist.add(new Member("park","1034","서울시 서대문구","1"));

//[{},{},{}]
	JSONArray objarray=JSONArray.fromObject(memberlist);


%>
<%=objarray%>