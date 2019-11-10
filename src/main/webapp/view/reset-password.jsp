<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>reset password</title>
    <%@include file="parts/links.html" %>
</head>
<body style="background-color: #f6f6f6">

<div class="container reset-password">
    <div class="row justify-content-center">
        <div class="col-md-8 mt-5 p-5 border rounded content">

            <div class="mb-5">
                <h3>Reset your password</h3>
                <hr>
                <c:choose>
                    <c:when test="${success}">
                        <div class="alert alert-success" role="alert">
                            password has been reset.
                            <a href="${contextPath}/login">login</a>
                        </div>
                    </c:when>
                    <c:when test="${failed}">
                        <div class="alert alert-danger" role="alert">failed to find user or send email</div>
                    </c:when>
                </c:choose>
            </div>

            <form action="/user/account/reset-password" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="token" value="${token}"/>
                <div class="form-group mb-5">
                    <label>New Password</label>
                    <input name="password" type="password" class="form-control" required="required"/>
                    <div class="text-danger">${error_password}</div>
                </div>
                <div class="form-group mb-5">
                    <label>Confirm Password</label>
                    <input name="confirmPass" type="password" class="form-control" required="required"/>
                    <div class="text-danger">${error_confirmPass}</div>
                </div>
                <button type="submit" class="btn btn-primary">send</button>
            </form>
        </div>
    </div>
</div>
<%@include file="parts/footer.html" %>
</body>
</html>