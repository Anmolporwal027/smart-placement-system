<%@ include file="includes/header.jsp" %>
<div class="container">
    <div class="row justify-content-center align-items-center" style="min-height: 80vh;">
        <div class="col-12 col-sm-10 col-md-8 col-lg-5">
            <div class="card glass-card p-4 p-md-5 shadow-lg">
                <div class="text-center mb-4">
                    <h2 class="fw-bold text-primary">Portal Login</h2>
                    <p class="text-muted small">Enter credentials to access the system</p>
                </div>
                <form action="login" method="post">
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope text-muted"></i></span>
                            <input type="email" name="email" class="form-control" placeholder="Enter your email" required autocomplete="off">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock text-muted"></i></span>
                            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label small fw-bold">Account Type</label>
                        <select name="role" class="form-select">
                            <option value="STUDENT">Student</option>
                            <option value="PO">Placement Officer (Admin)</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 fw-bold py-2 shadow">Login to Account</button>
                </form>
                <div class="text-center mt-4 border-top pt-3">
                    <p class="mb-0 small">New Student? <a href="register" class="text-primary fw-bold text-decoration-none">Create Profile</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body></html>