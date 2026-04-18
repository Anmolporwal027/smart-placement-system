<%@ include file="includes/header.jsp" %>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card glass-card p-4 shadow-lg border-0">
                <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                    <h4 class="fw-bold text-primary mb-0">New Placement Drive</h4>
                    <a href="dashboard" class="btn btn-outline-secondary btn-sm">
                        <i class="fas fa-times"></i> Cancel
                    </a>
                </div>
                
                <form action="${pageContext.request.contextPath}/po/saveCompany" method="post">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Company Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Job Role</label>
                        <input type="text" name="role" class="form-control" required>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Target Degree</label>
                            <select name="targetDegree" class="form-select">
                                <option value="B.Tech">B.Tech</option>
                                <option value="M.Tech">M.Tech</option>
                                <option value="BCA">BCA</option>
                                <option value="MCA">MCA</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Target Passout Year</label>
                            <input type="number" name="targetPassoutYear" class="form-control" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold text-primary">Min CGPA</label>
                            <input type="number" step="0.1" name="minCgpa" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold text-danger">Allowed Backlogs</label>
                            <input type="number" name="maxBacklogs" class="form-control" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Required Skills (Comma Separated)</label>
                        <input type="text" name="requiredSkills" class="form-control" placeholder="Java, SQL, Python" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-bold">Allowed Branches</label>
                        <input type="text" name="allowedBranches" class="form-control" placeholder="CSE, IT, ECE" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 fw-bold shadow">
                        <i class="fas fa-paper-plane me-2"></i> Publish Placement Drive
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
</body></html>