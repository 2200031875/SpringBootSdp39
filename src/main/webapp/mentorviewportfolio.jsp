<div class="main-content">
        <h2>Student Portfolios</h2>
        <c:if test="${not empty error}">
            <p style="color: red;"><c:out value="${error}" /></p>
        </c:if>
        <table>
            <thead>
                <tr>
                    <th>Portfolio ID</th>
                    <th>Student Name</th>
                    <th>Achievement Title</th>
                    <th>Article Title</th>
                    <th>Skills</th>
                    <th>Project Title</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="port" items="${portlist}">
                    <tr>
                        <td><c:out value="${port.id}" /></td>
                        <td><c:out value="${port.student.name}" /></td>
                        <td>
                            <c:if test="${not empty port.achievements}">
                                <c:out value="${port.achievements[0].title}" />
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty port.articles}">
                                <c:out value="${port.articles[0].title}" />
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty port.skills}">
                                <c:out value="${port.skills[0].skillName}" />
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty port.projectPortfolios}">
                                <c:out value="${port.projectPortfolios[0].title}" />
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>