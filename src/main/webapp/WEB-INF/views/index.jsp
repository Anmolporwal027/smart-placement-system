<%@ include file="includes/header.jsp" %>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card p-5 shadow-lg">
                <div class="text-center mb-4">
                    <h2 class="fw-bold text-primary">Portal Login</h2>
                    <p class="text-muted">Enter your credentials to access the system</p>
                </div>
                <form action="login" method="post">
                    <div class="mb-3">
                        <label class="form-label">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" name="email" class="form-control" placeholder="Enter your email" required autocomplete="off">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" name="password" class="form-control" placeholder="enter password" required>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Account Type</label>
                        <select name="role" class="form-select">
                            <option value="STUDENT">Student</option>
                            <option value="PO">Placement Officer (Admin)</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 fw-bold">Login to Account</button>
                </form>
                <div class="text-center mt-4">
                    <p>New Student? <a href="register" class="text-primary fw-bold">Create Profile</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body></html>