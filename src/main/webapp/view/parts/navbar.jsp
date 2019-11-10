<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<sec:authorize access="hasAuthority('student')">
    <jsp:include page="student-navbar.jsp"/>
</sec:authorize>

<sec:authorize access="hasAuthority('advertiser')">
    <jsp:include page="student-navbar.jsp"/>
</sec:authorize>


