<%@ include file="includes/header.jsp" %>
<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card glass-card p-4 shadow-sm">
                <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                    <h3 class="fw-bold text-primary mb-0">Student Registration</h3>
                    <a href="${pageContext.request.contextPath}/" class="btn btn-outline-secondary btn-sm">
                        <i class="fas fa-arrow-left"></i> Back to Login
                    </a>
                </div>
                <form action="doRegister" method="post" enctype="multipart/form-data">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Enrollment Number</label>
                            <input type="text" name="enrollmentNumber" class="form-control" placeholder="Ex: EN12345" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Full Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-bold">Degree</label>
                            <select name="degree" class="form-select">
                                <option value="B.Tech">B.Tech</option>
                                <option value="M.Tech">M.Tech</option>
                                <option value="BCA">BCA</option>
                                <option value="MCA">MCA</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-bold">Branch</label>
                            <input type="text" name="branch" class="form-control" placeholder="CS, IT, etc." required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-bold">Passout Year</label>
                            <input type="number" name="passoutYear" class="form-control" placeholder="2025" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">CGPA</label>
                            <input type="number" step="0.01" name="cgpa" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Backlogs</label>
                            <input type="number" name="backlogs" class="form-control" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-bold">Skills</label>
                            <input type="text" name="skills" class="form-control" placeholder="Java, Python, SQL">
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-bold text-primary">Upload Resume (PDF only)</label>
                            <input type="file" name="resumeFile" class="form-control border-primary" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-4 w-100 fw-bold shadow">
                        <i class="fas fa-user-plus me-2"></i> Register Profile
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
</body></html>