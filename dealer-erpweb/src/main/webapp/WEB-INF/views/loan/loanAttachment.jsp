<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
    <c:forEach items="${loanInfoAttachments}" var="loanInfoAttachment">
        <li class="li-box">
            <a href="${basePath}${loanInfoAttachment.attachmentPath}" target="_blank">
                <img src="${basePath}${loanInfoAttachment.attachmentThumb}"
                     alt="${loanInfoAttachment.attachmentTitle}" />
            </a>

            <div class="tips-box"><input type="checkbox" value="${loanInfoAttachment.id}"
                                         name="attachmentId">${loanInfoAttachment.attachmentTitle}
            </div>
            <input type="hidden" id="${loanInfoAttachment.attachmentType}"
                   value="${loanInfoAttachment.attachmentPath}">
        </li>
    </c:forEach>
</ul>
