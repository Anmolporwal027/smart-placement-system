<%@ include file="includes/header.jsp" %>
<div class="container mb-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold mb-0">Final Shortlisted Categories</h3>
        <a href="dashboard" class="btn btn-secondary btn-sm rounded-pill"><i class="fas fa-arrow-left"></i> Back</a>
    </div>
    
    <div class="row">
        <c:forEach var="c" items="${companies}">
            <div class="col-12 mb-4">
                <div class="card glass-card overflow-hidden shadow-sm">
                    <div class="card-header bg-dark text-white fw-bold d-flex justify-content-between align-items-center py-3">
                        <span>${c.name} - Final List</span>
                        <span class="badge bg-primary rounded-pill">${shortlistedMap[c.id].size()} Students</span>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th>Student Name</th>
                                        <th class="d-none d-md-table-cell">Email</th>
                                        <th>Branch</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="shortlistedList" value="${shortlistedMap[c.id]}" />
                                    <c:choose>
                                        <c:when test="${not empty shortlistedList}">
                                            <c:forEach var="record" items="${shortlistedList}">
                                                <tr>
                                                    <td>
                                                        <div class="fw-bold"><i class="fas fa-user-check text-success me-2"></i>${record.student.name}</div>
                                                        <div class="d-md-none x-small text-muted">${record.student.email}</div>
                                                    </td>
                                                    <td class="d-none d-md-table-cell small">${record.student.email}</td>
                                                    <td><span class="badge bg-light text-dark border">${record.student.branch}</span></td>
                                                    <td class="text-center">
                                                        <a href="${pageContext.request.contextPath}/student/viewResume/${record.student.id}" 
                                                           target="_blank" class="btn btn-outline-danger btn-sm rounded-pill">
                                                            <i class="fas fa-file-pdf"></i> <span class="d-none d-sm-inline">Resume</span>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="4" class="text-center text-muted py-4">No students shortlisted yet.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body></html>