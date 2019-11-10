<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>forgot password</title>
    <%@include file="parts/links.html" %>
</head>
<body style="background-color: #f6f6f6">

<div class="container forgot-password">
    <div class="row justify-content-center">
        <div class="col-md-8 mt-5 p-5 border rounded content">

            <div>
                <h3>Forget your password ?</h3>
                <hr>
                <c:choose>
                    <c:when test="${emailSent}">
                        <div class="alert alert-success" role="alert">email has been sent successfully</div>
                    </c:when>
                    <c:when test="${failed}">
                        <div class="alert alert-danger" role="alert">failed to find user or send email</div>
                    </c:when>
                </c:choose>
                <h5 class="mt-5">1. Enter you email adress</h5>
            </div>

            <form action="/user/account/forgot-password" method="post">
                <div class="form-group mb-4">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input name="email" type="email" class="form-control" value="${email}" required="required"/>
                </div>
                <button type="submit" class="btn btn-primary">send</button>
            </form>
            <div class="mt-3">
                <h5>2. Go to your email and follow the link</h5>
                After clicking the button above, an email will be sent to you with a link that will take you to the
                Scholarship password reset page.
            </div>
        </div>
    </div>
</div>
<%@include file="parts/footer.html" %>
</body>
</html>