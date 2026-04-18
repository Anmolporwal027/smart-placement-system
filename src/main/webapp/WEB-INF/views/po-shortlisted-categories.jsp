<%@ include file="includes/header.jsp" %>
<div class="container">
    <h3 class="fw-bold mb-4">Final Shortlisted Students by Company</h3>
    <div class="row">
        <c:forEach var="c" items="${companies}">
            <div class="col-md-12 mb-3">
                <div class="card glass-card">
                    <div class="card-header bg-dark text-white fw-bold">${c.name} - Final List</div>
                    <div class="card-body p-0">
                        <table class="table mb-0">
                            <thead class="table-light">
                                <tr><th>Student Name</th><th>Email</th><th>Branch</th><th>Resume</th></tr>
                            </thead>
                            <tbody>
                                <!-- Get the list of shortlisted students for the current company 'c' from our map -->
    <c:set var="shortlistedList" value="${shortlistedMap[c.id]}" />

    <c:choose>
        <c:when test="${not empty shortlistedList}">
            <c:forEach var="record" items="${shortlistedList}">
                <tr>
                    <td class="fw-bold text-dark">
                        <i class="fas fa-user-check text-success me-2"></i>
                        ${record.student.name}
                    </td>
                    <td>${record.student.email}</td>
                    <td><span class="badge bg-light text-dark border">${record.student.branch}</span></td>
                    <!-- Find this line in your po-shortlisted-categories.jsp and replace it -->
				<td>
				    <!-- Logic: Access the student object inside the record, then get the ID -->
				    <a href="${pageContext.request.contextPath}/student/viewResume/${record.student.id}" 
	                   target="_blank" class="btn btn-outline-danger btn-sm">
	                    <i class="fas fa-file-pdf"></i> View Resume
	                </a>
				</td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="4" class="text-center text-muted py-3">
                    <i class="fas fa-info-circle me-1"></i> No students shortlisted for this company yet.
                </td>
            </tr>
        </c:otherwise>
    </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>