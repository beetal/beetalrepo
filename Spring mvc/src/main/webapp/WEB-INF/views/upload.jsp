
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

    <h2>Spring MVC file upload example</h2>
    <form:form method="post" action="upload" modelAttribute="uploadForm" enctype="multipart/form-data">
        Please select a file to upload : <input type="file" name="file" />
        <input type="submit" value="upload" />
        <span><form:errors path="file" cssClass="error" /></span>
    </form:form>

