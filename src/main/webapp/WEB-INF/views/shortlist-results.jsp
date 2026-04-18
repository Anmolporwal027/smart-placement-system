<%@ include file="includes/header.jsp" %>
<div class="container">
    <div class="card glass-card p-4 mb-4">
        <div class="d-flex justify-content-between align-items-center">
            <h4 class="fw-bold text-primary mb-0">Filtering: ${company.name}</h4>
            <a href="${pageContext.request.contextPath}/po/dashboard" class="btn btn-secondary btn-sm">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
        <form action="" method="get" class="row g-2 mt-3">
            <div class="col-md-9">
                <input type="text" name="skill" class="form-control" placeholder="Search by skill (e.g. React, Java)...">
            </div>
            <div class="col-md-3">
                <button class="btn btn-dark w-100">Filter Talent</button>
            </div>
        </form>
    </div>
		
	<c:if test="${param.emailSent == 'true'}">
	    <div class="alert alert-success alert-dismissible fade show">
	        <i class="fas fa-paper-plane me-2"></i> Student shortlisted and Notification Email sent successfully!
	        
	    </div>
	</c:if>
    <div class="card glass-card overflow-hidden">
        <table class="table table-hover align-middle mb-0">
            <thead class="table-primary text-white">
                <tr><th>Student (Enrollment)</th><th>Degree</th><th>Resume</th><th>Eligibility</th><th>Action</th></tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${students}">
                    <tr>
                        <td class="fw-bold">
                            ${s.name} <br>
                            <small class="text-muted">${s.enrollmentNumber}</small>
                            <c:if test="${ps.getStatusForStudent(s.id, company.id) == 'Shortlisted'}">
                                <span class="badge bg-success ms-2 small">Selected</span>
                            </c:if>
                        </td>
                        <td>${s.degree} <br> <small>${s.branch}</small></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/student/viewResume/${s.id}" 
							   target="_blank" class="btn btn-outline-danger btn-sm rounded-pill">
							    <i class="fas fa-file-pdf"></i> Resume
							</a>
                        </td>
                        <td>
                            <span class="text-success fw-bold">CGPA: ${s.cgpa}</span><br>
                            <small class="text-muted">Skills: ${s.skills}</small>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${ps.getStatusForStudent(s.id, company.id) == 'Shortlisted'}">
                                    <button class="btn btn-secondary btn-sm disabled px-3">Approved</button>
                                </c:when>
                                <c:otherwise>
                                    <form action="${pageContext.request.contextPath}/po/select" method="post" class="d-inline">
                                        <input type="hidden" name="sid" value="${s.id}">
                                        <input type="hidden" name="cid" value="${company.id}">
                                        <button type="submit" class="btn btn-primary btn-sm rounded-pill shadow-sm">Approve</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body></html>