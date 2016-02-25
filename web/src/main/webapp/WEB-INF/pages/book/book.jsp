<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp">
    <jsp:param name="title" value="Book"/>
</jsp:include>
<jsp:include page="../leftMenu.jsp">
    <jsp:param name="book" value="active z-depth-2"/>
    <jsp:param name="author" value=""/>
    <jsp:param name="genre" value=""/>
    <jsp:param name="order" value=""/>
</jsp:include>
<div class="row col s6 offset-s4" style="margin-top:30px;">
    <form method="post" action="/books/search">
        <div class="input-field col s4">
            <input id="value" name="value" type="text" class="validate">
            <label for="value">Search Value</label>
        </div>
        <div class="input-field col s4">
            <select name="type">
                <option value="name">Name</option>
                <option value="genre">Genre</option>
                <option value="author">Author</option>
            </select>
            <label>Search Type</label>
        </div>
        <div class="col s4">
            <button class="btn waves-effect waves-light" type="submit" name="action" style="margin-top:20px;">Search
                <i class="material-icons right">send</i>
            </button>
        </div>
    </form>
</div>
<p></p>
<table style="margin-top:50px;" class="bordered centered z-depth-2 col s6 offset-s4">
    <thead>
    <tr>
        <th data-field="id">Number</th>
        <th data-field="name">Name</th>
        <th data-field="year">Year</th>
        <th data-field="count">Count</th>
        <th data-field="genre">Genre</th>
        <th data-field="author">Author</th>
        <th data-field="change"></th>
        <th data-field="delete"></th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="book" items="${books}">
        <tr>
            <td><c:out value="${book.id}"/>
            </td>
            <td><c:out value="${book.name}"/>
            </td>
            <td><c:out value="${book.year}"/>
            </td>
            <td><c:out value="${book.count}"/>
            </td>
            <td><c:out value="${mapGenres[book.genreId].name}"/>
            </td>
            <td><c:out value="${mapAuthor[book.authorId].alias}"/>
            </td>
            <td>
                <a href="/books/<c:out value="${book.id}"/>/edit" class="secondary-content">
                    <i class="material-icons">create</i>
                </a>
            </td>
            <td>
                <form action="/books/delete" method="post">
                    <input type="hidden" name="number" value="<c:out value="${book.id}"/>">
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
    <a href="/books/add" class="right btn-floating btn-large waves-effect waves-light blue lighten-2 ">
        <i class="material-icons">add</i></a>
</div>
<jsp:include page="../footer.jsp"/>