<%@ include file="includes/header.jsp" %>
<div class="container mb-5">
    <div class="card glass-card p-3 p-md-4 mb-4 shadow-sm">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
            <h4 class="fw-bold text-primary mb-0">Filtering: ${company.name}</h4>
            <a href="${pageContext.request.contextPath}/po/dashboard" class="btn btn-secondary btn-sm rounded-pill">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
        <form action="" method="get" class="row g-2 mt-3">
            <div class="col-12 col-md-9">
                <input type="text" name="skill" class="form-control" placeholder="Search by skill (e.g. React, Java)...">
            </div>
            <div class="col-12 col-md-3">
                <button class="btn btn-dark w-100 rounded-pill">Filter Talent</button>
            </div>
        </form>
    </div>
		
	<c:if test="${param.emailSent == 'true'}">
	    <div class="alert alert-success alert-dismissible fade show shadow-sm">
	        <i class="fas fa-paper-plane me-2"></i> Notification Email sent successfully!
	        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	    </div>
	</c:if>

    <div class="card glass-card overflow-hidden shadow-sm">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-primary text-white">
                    <tr>
                        <th>Student</th>
                        <th class="d-none d-md-table-cell">Resume</th>
                        <th>Status/Skills</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${students}">
                        <tr>
                            <td>
                                <div class="fw-bold">${s.name}</div>
                                <small class="text-muted d-block">${s.enrollmentNumber}</small>
                                <div class="d-md-none mt-1">
                                     <a href="${pageContext.request.contextPath}/student/viewResume/${s.id}" target="_blank" class="small text-danger text-decoration-none">
                                        <i class="fas fa-file-pdf"></i> View Resume
                                     </a>
                                </div>
                            </td>
                            <td class="d-none d-md-table-cell">
                                <a href="${pageContext.request.contextPath}/student/viewResume/${s.id}" 
                                   target="_blank" class="btn btn-outline-danger btn-sm rounded-pill px-3">
                                    <i class="fas fa-file-pdf"></i> PDF
                                </a>
                            </td>
                            <td>
                                <div class="text-success fw-bold small">CGPA: ${s.cgpa}</div>
                                <div class="text-muted x-small text-truncate" style="max-width: 150px;">${s.skills}</div>
                                <c:if test="${ps.getStatusForStudent(s.id, company.id) == 'Shortlisted'}">
                                    <span class="badge bg-success x-small mt-1">Selected</span>
                                </c:if>
                            </td>
                            <td class="text-center">
                                <c:choose>
                                    <c:when test="${ps.getStatusForStudent(s.id, company.id) == 'Shortlisted'}">
                                        <button class="btn btn-secondary btn-sm disabled rounded-pill px-3">Approved</button>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="${pageContext.request.contextPath}/po/select" method="post" class="d-inline">
                                            <input type="hidden" name="sid" value="${s.id}">
                                            <input type="hidden" name="cid" value="${company.id}">
                                            <button type="submit" class="btn btn-primary btn-sm rounded-pill shadow-sm px-3">Approve</button>
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
</div>
</body></html>