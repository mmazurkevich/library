<%--
  Created by IntelliJ IDEA.
  User: infinity
  Date: 23.02.16
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="Author"/>
</jsp:include>
<jsp:include page="../leftMenu.jsp">
    <jsp:param name="book" value=""/>
    <jsp:param name="author" value="active z-depth-2"/>
    <jsp:param name="genre" value=""/>
    <jsp:param name="order" value=""/>
</jsp:include>
<p></p>
<table style="margin-top:50px;" class="bordered centered z-depth-2 col s6 offset-s4">
    <thead>
    <tr>
        <th data-field="id">Number</th>
        <th data-field="name">Name</th>
        <th data-field="change"></th>
        <th data-field="delete"></th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="author" items="${requestScope.authors}">
    <tr>
        <td><c:out value="${author.id}"/>
        </td>
        <td><c:out value="${author.alias}"/>
        </td>
        <td>
            <a href="/authors/<c:out value="${author.id}"/>/edit" class="secondary-content">
                <i class="material-icons">create</i>
            </a>
        </td>
        <td>
            <form action="/authors/delete" method="post">
                <input type="hidden" name="number" value="<c:out value="${author.id}"/>">
                <a class="secondary-content" style="margin-right:20px;" onclick="parentNode.submit();">
                    <i class="material-icons">clear</i>
                </a>
            </form>
        </td>
    </tr>
    </c:forEach>
    </tbody>

</table>
<div class="row col s6 offset-s4 right-align">
    <a href="/authors/add" class="right btn-floating btn-large waves-effect waves-light red ">
        <i class="material-icons">add</i></a>
</div>
<jsp:include page="../footer.jsp"/>