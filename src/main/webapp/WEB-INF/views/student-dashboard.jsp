<%@ include file="includes/header.jsp" %>
<div class="container">
    <div class="row">
        <!-- Profile Column -->
        <div class="col-md-4">
            <div class="card glass-card p-4 mb-4">
                <h5 class="fw-bold mb-3"><i class="fas fa-user-shield text-primary me-2"></i>My Profile</h5>
                
                <div class="mb-3">
                    <label class="small text-muted fw-bold">Enrollment & Name</label>
                    <p class="mb-0 fw-bold border-bottom pb-1">${user.enrollmentNumber} | ${user.name}</p>
                </div>
                <div class="mb-3">
                    <label class="small text-muted fw-bold">Degree & Batch</label>
                    <p class="mb-0 fw-bold border-bottom pb-1">${user.degree} (${user.passoutYear})</p>
                </div>

                <hr>
                <h6 class="fw-bold text-secondary mb-3">Change Password</h6>
                
                <c:if test="${param.error == 'wrongOldPassword'}">
                    <div class="alert alert-danger py-1 small">Incorrect old password!</div>
                </c:if>

                <form action="updatePassword" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="mb-2">
                        <input type="password" name="oldPassword" class="form-control form-control-sm" placeholder="Old Password" required>
                    </div>
                    <div class="mb-2">
                        <input type="password" name="newPassword" class="form-control form-control-sm" placeholder="New Password" required>
                    </div>
                    <button type="submit" class="btn btn-dark btn-sm w-100 shadow-sm">Update Security</button>
                </form>

                <div class="mt-4 p-3 bg-light rounded text-center border">
                   <a href="viewResume/${user.id}" target="_blank" class="text-decoration-none fw-bold">
					    <i class="fas fa-file-pdf text-danger me-2"></i>View My Resume
					</a>
                </div>
            </div>
        </div>

        <!-- Opportunities Column -->
        <div class="col-md-8">
            <h4 class="fw-bold mb-4">Placement Opportunities</h4>
            <c:forEach var="c" items="${companies}">
                <div class="card glass-card mb-4 p-3 border-0 shadow-sm">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <h5 class="fw-bold text-primary mb-1">${c.name}</h5>
                            <p class="text-muted small mb-0">${c.role} | Posted: ${c.postingDate}</p>
                            <span class="badge bg-secondary mb-2">${c.targetDegree} - Batch ${c.targetPassoutYear}</span>
                        </div>
                        <c:set var="currentStatus" value="${statusMap[c.id]}" />
                        <c:choose>
                            <c:when test="${currentStatus == 'Shortlisted'}">
                                <span class="badge bg-success p-2"><i class="fas fa-check-circle"></i> Shortlisted</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-warning text-dark p-2">Under PO Review</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="ai-card p-3 rounded mt-2 shadow-sm">
                        <h6 class="small fw-bold"><i class="fas fa-robot text-primary me-2"></i>Gemini AI Mentorship:</h6>
                        <p class="small mb-0 text-secondary italic">${aiMap[c.id]}</p>
                    </div>
                    
                    <div class="mt-2 p-3 bg-white rounded border-start border-warning border-4">
                        <h6 class="small fw-bold text-warning"><i class="fas fa-lightbulb me-2"></i>Career advice:</h6>
                        <p class="small mb-0 text-dark italic">${adviceMap[c.id]}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body></html>