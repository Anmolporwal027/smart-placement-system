<%@ include file="includes/header.jsp" %>
<div class="container mt-2 mt-md-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-8">
            <div class="card glass-card p-3 p-md-4 shadow-lg border-0">
                <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                    <h4 class="fw-bold text-primary mb-0">New Placement Drive</h4>
                    <a href="dashboard" class="btn btn-outline-secondary btn-sm">
                        <i class="fas fa-times"></i> <span class="d-none d-sm-inline">Cancel</span>
                    </a>
                </div>
                
                <form action="${pageContext.request.contextPath}/po/saveCompany" method="post">
                    <div class="row g-3">
                        <div class="col-12">
                            <label class="form-label fw-bold small">Company Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-bold small">Job Role</label>
                            <input type="text" name="role" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold small">Target Degree</label>
                            <select name="targetDegree" class="form-select">
                                <option value="B.Tech">B.Tech</option>
                                <option value="M.Tech">M.Tech</option>
                                <option value="BCA">BCA</option>
                                <option value="MCA">MCA</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold small">Target Passout Year</label>
                            <input type="number" name="targetPassoutYear" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold text-primary small">Min CGPA</label>
                            <input type="number" step="0.1" name="minCgpa" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold text-danger small">Allowed Backlogs</label>
                            <input type="number" name="maxBacklogs" class="form-control" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-bold small">Required Skills</label>
                            <input type="text" name="requiredSkills" class="form-control" placeholder="Java, SQL, Python" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-bold small">Allowed Branches</label>
                            <input type="text" name="allowedBranches" class="form-control" placeholder="CSE, IT, ECE" required>
                        </div>
                        <div class="col-12 mt-4">
                            <button type="submit" class="btn btn-primary w-100 fw-bold shadow">
                                <i class="fas fa-paper-plane me-2"></i> Publish Placement Drive
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body></html>