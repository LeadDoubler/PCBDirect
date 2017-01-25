<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
            <c:when test="${param.type eq 'link'}">
                <a href="${pageContext.request.contextPath}${actionBean.part.linkTo}">${actionBean.part.content}</a>
            </c:when>
            <c:otherwise>
                ${actionBean.part.content}
            </c:otherwise>
        </c:choose>