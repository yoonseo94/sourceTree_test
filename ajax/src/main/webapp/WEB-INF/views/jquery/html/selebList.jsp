<%@page import="com.kh.ajax.celeb.dto.CelebType"%>
<%@page import="com.kh.ajax.celeb.dto.Celeb"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Celeb> celebList = (List<Celeb>) request.getAttribute("celebList");
	for(Celeb celeb : celebList){
%>
	<tr>
		<td><%= celeb.getNo() %></td>
		<td><%= celeb.getName() %></td>
		<td>
			<select>
				<%-- ACTOR, SINGER, MODEL, COMEDIAN, ENTERTAINER --%>
				<option value="ACTOR" <%= celeb.getType() == CelebType.ACTOR ? "selected" : "" %>>ACTOR</option>
				<option value="SINGER" <%= celeb.getType() == CelebType.SINGER ? "selected" : "" %>>SINGER</option>
				<option value="MODEL" <%= celeb.getType() == CelebType.MODEL ? "selected" : "" %>>MODEL</option>
				<option value="COMEDIAN" <%= celeb.getType() == CelebType.COMEDIAN ? "selected" : "" %>>COMEDIAN</option>
				<option value="ENTERTAINER" <%= celeb.getType() == CelebType.ENTERTAINER ? "selected" : "" %>>ENTERTAINER</option>
			</select>
		</td>
		<td>
			<img src="<%= request.getContextPath() %>/images/<%= celeb.getProfile() %>" alt="" />
		</td>
	</tr>
<%
	}
%>