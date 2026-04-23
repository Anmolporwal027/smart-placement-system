<%@ include file="includes/header.jsp" %>
<div class="container pb-5">
    <div class="row g-4">
        <!-- Profile Column -->
        <div class="col-12 col-lg-4">
            <div class="card glass-card p-4 shadow-sm h-100">
                <h5 class="fw-bold mb-4 text-center text-md-start">
                    <i class="fas fa-user-shield text-primary me-2"></i>My Profile
                </h5>
                
                <div class="mb-3 bg-light p-2 rounded border-start border-primary border-4">
                    <label class="x-small text-muted fw-bold d-block uppercase">ENROLLMENT & NAME</label>
                    <span class="fw-bold text-dark">${user.enrollmentNumber} | ${user.name}</span>
                </div>
                <div class="mb-4 bg-light p-2 rounded border-start border-secondary border-4">
                    <label class="x-small text-muted fw-bold d-block uppercase">DEGREE & BATCH</label>
                    <span class="fw-bold text-dark">${user.degree} (${user.passoutYear})</span>
                </div>

                <div class="mt-2 mb-4 text-center">
                   <a href="viewResume/${user.id}" target="_blank" class="btn btn-outline-danger w-100 rounded-pill py-2 fw-bold">
					    <i class="fas fa-file-pdf me-2"></i>View Registered Resume
					</a>
                </div>

                <hr>
                <h6 class="fw-bold text-secondary mb-3 mt-4"><i class="fas fa-key me-2"></i>Change Password</h6>
                
                <c:if test="${param.error == 'wrongOldPassword'}">
                    <div class="alert alert-danger py-1 small">Incorrect old password!</div>
                </c:if>

                <form action="updatePassword" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="mb-3">
                        <input type="password" name="oldPassword" class="form-control" placeholder="Old Password" required>
                    </div>
                    <div class="mb-3">
                        <input type="password" name="newPassword" class="form-control" placeholder="New Password" required>
                    </div>
                    <button type="submit" class="btn btn-dark w-100 rounded-pill shadow-sm">Update Password</button>
                </form>
            </div>
        </div>

        <!-- Opportunities Column -->
        <div class="col-12 col-lg-8">
            <h4 class="fw-bold mb-4">Placement Opportunities</h4>
            <c:forEach var="c" items="${companies}">
                <div class="card glass-card mb-4 border-0 shadow-sm overflow-hidden">
                    <div class="card-body p-3 p-md-4">
                        <div class="d-flex flex-column flex-sm-row justify-content-between align-items-start gap-2 mb-3">
                            <div class="flex-grow-1">
                                <h5 class="fw-bold text-primary mb-1">${c.name}</h5>
                                <div class="d-flex flex-wrap gap-2 align-items-center">
                                    <span class="text-muted x-small"><i class="fas fa-briefcase me-1"></i>${c.role}</span>
                                    <span class="text-muted x-small"><i class="fas fa-calendar-alt me-1"></i>${c.postingDate}</span>
                                </div>
                                <span class="badge bg-secondary mt-2">${c.targetDegree} - ${c.targetPassoutYear}</span>
                            </div>
                            
                            <c:set var="currentStatus" value="${statusMap[c.id]}" />
                            <c:choose>
                                <c:when test="${currentStatus == 'Shortlisted'}">
                                    <span class="badge bg-success p-2 rounded-pill"><i class="fas fa-check-circle me-1"></i> Shortlisted</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-warning text-dark p-2 rounded-pill"><i class="fas fa-clock me-1"></i> PO Review</span>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <!-- AI Feedback Section -->
                        <div class="ai-card p-3 rounded mt-3 shadow-sm">
                            <h6 class="small fw-bold text-primary"><i class="fas fa-robot me-2"></i>AI Evaluation:</h6>
                            <p class="small mb-0 text-secondary" style="font-style: italic;">${aiMap[c.id]}</p>
                        </div>
                        
                        <!-- Career Advice Section -->
                        <div class="mt-3 p-3 bg-white rounded border-start border-warning border-4 shadow-sm">
                            <h6 class="small fw-bold text-warning"><i class="fas fa-lightbulb me-2"></i>Preparation Guide:</h6>
                            <p class="small mb-0 text-dark" style="font-style: italic;">${adviceMap[c.id]}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty companies}">
                <div class="text-center py-5">
                    <i class="fas fa-folder-open fa-3x text-muted mb-3"></i>
                    <p class="text-muted">No placement opportunities available right now.</p>
                </div>
            </c:if>
        </div>
    </div>
</div>
</body></html>