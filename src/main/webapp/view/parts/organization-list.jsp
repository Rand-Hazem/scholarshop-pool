<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="item" items="${orgList}">
    <option value="${item.name}">
            ${item.name}<br>
        <small class="text-secondary ">${item.location}</small>
    </option>

</c:forEach>
<option id="organizattionOtherOption" value="other">Other</option>