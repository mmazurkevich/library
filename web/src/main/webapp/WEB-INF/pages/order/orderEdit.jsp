<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="locale" />
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="Order"/>
</jsp:include>
<jsp:include page="../leftMenu.jsp">
    <jsp:param name="book" value=""/>
    <jsp:param name="author" value=""/>
    <jsp:param name="genre" value=""/>
    <jsp:param name="order" value="active z-depth-2"/>
    <jsp:param name="user" value=""/>
</jsp:include>
<div class="row col s6 z-depth-2  offset-s4" style="margin-top:50px;">
    <form class="col s12" action="/orders/change" method="post">
        <div class="row" style="margin-top:20px;">
            <div class="input-field col s12">
                <input type="hidden" name="number" value="<c:out value="${bookOrder.id}"/>">
                <input disabled id="number" name="number" type="text" class="validate" value="<c:out value="${bookOrder.id}"/>">
                <label for="number"><fmt:message key="NUMBER"/></label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input disabled id="user" name="user" type="text" class="validate" value="<c:out value="${user.email}"/>">
                <label for="user"><fmt:message key="USER"/></label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input disabled id="bookName" name="bookName" type="text" class="validate" value="<c:out value="${book.name}"/>">
                <label for="bookName"><fmt:message key="BOOKNAME"/></label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <select name="status">
                    <option value="<c:out value="${currentStatus.name}"/>"><c:out value="${currentStatus.name}"/></option>
                    <c:forEach var="status" items="${status}">
                        <c:if test="${status.name ne currentStatus.name}">
                            <option value="<c:out value="${status.name}"/>"><c:out value="${status.name}"/></option>
                        </c:if>
                    </c:forEach>
                </select>
                <label><fmt:message key="STATUS"/></label>
            </div>
        </div>
        <div class="row right-align">
            <button class="btn waves-effect waves-light" type="submit" name="action"><fmt:message key="SUBMIT"/>
                <i class="material-icons right">send</i>
            </button>
        </div>
    </form>
</div>
<jsp:include page="../footer.jsp"/>
