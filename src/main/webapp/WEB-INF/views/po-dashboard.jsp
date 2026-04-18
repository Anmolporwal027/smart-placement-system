<%@ include file="includes/header.jsp" %>
<div class="container">
    <!-- Find this button in po-dashboard.jsp and replace it -->
<div class="d-flex justify-content-between align-items-center mb-4">
    <h3 class="fw-bold">Company Management</h3>
    <a href="${pageContext.request.contextPath}/po/addCompany" class="btn btn-primary">
        <i class="fas fa-plus me-2"></i>Post New Drive
    </a>
    <a href="viewShortlisted" class="btn btn-success">View Shortlisted Categories</a>
</div>
    
    <div class="row">
        <c:forEach var="c" items="${companies}">
            <div class="col-md-4 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-3">
                            <div class="bg-primary text-white rounded p-2 me-3"><i class="fas fa-building fa-lg"></i></div>
                            <h5 class="fw-bold mb-0">${c.name}</h5>
                        </div>
                        <p class="text-muted small">${c.role}</p>
                        <hr>
                        <div class="row text-center">
                            <div class="col-6 border-end small">Min CGPA<br><b>${c.minCgpa}</b></div>
                            <div class="col-6 small">Max Backlogs<br><b>${c.maxBacklogs}</b></div>
                        </div>
                    </div>
                    <div class="card-footer bg-white border-top-0 pb-3">
                       <a href="${pageContext.request.contextPath}/po/shortlist/${c.id}" class="btn btn-primary btn-sm w-100">Run Shortlisting</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body></html>