<%@ include file="includes/header.jsp" %>
<div class="container pb-5">
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 gap-3">
        <h3 class="fw-bold mb-0">Company Management</h3>
        <div class="d-flex gap-2 flex-wrap">
            <a href="${pageContext.request.contextPath}/po/addCompany" class="btn btn-primary btn-sm rounded-pill px-3 shadow-sm">
                <i class="fas fa-plus me-1"></i> Post New Drive
            </a>
            <a href="viewShortlisted" class="btn btn-success btn-sm rounded-pill px-3 shadow-sm">
                <i class="fas fa-list me-1"></i> View Categories
            </a>
        </div>
    </div>
    
    <div class="row g-4">
        <c:forEach var="c" items="${companies}">
            <div class="col-12 col-md-6 col-lg-4">
                <div class="card h-100 glass-card border-0 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-3">
                            <div class="bg-primary text-white rounded p-2 me-3"><i class="fas fa-building fa-lg"></i></div>
                            <h5 class="fw-bold mb-0 text-truncate">${c.name}</h5>
                        </div>
                        <p class="text-muted small mb-3">${c.role}</p>
                        <div class="row text-center bg-light rounded py-2 g-0">
                            <div class="col-6 border-end small">Min CGPA<br><b>${c.minCgpa}</b></div>
                            <div class="col-6 small">Max Backlogs<br><b>${c.maxBacklogs}</b></div>
                        </div>
                    </div>
                    <div class="card-footer bg-transparent border-0 pb-3">
                       <a href="${pageContext.request.contextPath}/po/shortlist/${c.id}" class="btn btn-primary btn-sm w-100 rounded-pill">Run Shortlisting</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body></html>