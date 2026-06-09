<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>My Profile - Propify</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<jsp:include page="include/header.jsp"/>

<section class="profile-hero">

    <div class="container">

        <span class="profile-badge">
            My Account
        </span>

        <h1>
            Manage Your Profile
        </h1>

        <p>
            Update your personal details, profile image and password securely.
        </p>

    </div>

</section>

<section class="profile-section">

    <div class="container">

        <div class="profile-layout">

            <div class="profile-overview-card">

                <div class="profile-avatar-box">

                    <img src="<c:url value='${empty userProfile.profileImage ? "/images/default-profile.png" : "/uploads/".concat(userProfile.profileImage)}' />"
                         alt="Profile Picture"
                         id="profileImagePreview">

                </div>

                <h2>
                    ${userProfile.firstName} ${userProfile.lastName}
                </h2>

                <p>
                    ${userProfile.email}
                </p>

                <div class="profile-info-list">

                    <div>
                        <i class="fas fa-phone"></i>
                        <span>${userProfile.phone}</span>
                    </div>

                    <div>
                        <i class="fas fa-user-check"></i>
                        <span>Verified Propify User</span>
                    </div>

                    <div>
                        <i class="fas fa-shield-alt"></i>
                        <span>Secure Account</span>
                    </div>

                </div>

            </div>

            <div class="profile-content">

                <div class="profile-card">

                    <div class="profile-card-heading">

                        <div>
                            <span>Personal Details</span>
                            <h2>Profile Information</h2>
                        </div>

                        <button type="button" class="profile-edit-btn" id="editProfileBtn">
                            <i class="fas fa-edit"></i>
                            Edit
                        </button>

                    </div>

                    <form:form method="post"
                               modelAttribute="userProfile"
                               id="userProfileForm"
                               enctype="multipart/form-data"
                               action="${pageContext.request.contextPath}/auth/profile">

                        <input type="file"
                               id="profileImageInput"
                               name="profileImageFile"
                               class="d-none"
                               accept="image/*">

                        <button type="button"
                                class="upload-profile-btn d-none"
                                id="uploadImageBtn">
                            <i class="fas fa-upload"></i>
                            Upload New Image
                        </button>

                        <div class="row g-3 mt-2">

                            <div class="col-md-6">

                                <label class="premium-label">
                                    First Name
                                </label>

                                <div class="premium-input">
                                    <i class="fas fa-user"></i>
                                    <form:input path="firstName" id="firstName" readonly="true"/>
                                </div>

                            </div>

                            <div class="col-md-6">

                                <label class="premium-label">
                                    Last Name
                                </label>

                                <div class="premium-input">
                                    <i class="fas fa-user"></i>
                                    <form:input path="lastName" id="lastName" readonly="true"/>
                                </div>

                            </div>

                            <div class="col-md-12">

                                <label class="premium-label">
                                    Email
                                </label>

                                <div class="premium-input">
                                    <i class="fas fa-envelope"></i>
                                    <form:input path="email" id="email" readonly="true"/>
                                </div>

                            </div>

                            <div class="col-md-12">

                                <label class="premium-label">
                                    Phone
                                </label>

                                <div class="premium-input">
                                    <i class="fas fa-phone"></i>
                                    <form:input path="phone" id="phone" readonly="true"/>
                                </div>

                            </div>

                            <div class="col-12">

                                <div class="profile-actions">

                                    <button type="submit"
                                            class="profile-save-btn d-none"
                                            id="saveProfileBtn">
                                        <i class="fas fa-save"></i>
                                        Save Changes
                                    </button>

                                    <button type="button"
                                            class="profile-cancel-btn d-none"
                                            id="cancelEditBtn">
                                        <i class="fas fa-times"></i>
                                        Cancel
                                    </button>

                                </div>

                            </div>

                        </div>

                    </form:form>

                </div>

                <div class="profile-card mt-4">

                    <div class="profile-card-heading">

                        <div>
                            <span>Security</span>
                            <h2>Change Password</h2>
                        </div>

                    </div>

                    <form action="${pageContext.request.contextPath}/auth/change-password"
                          method="post"
                          id="changePasswordForm">

                        <div class="row g-3">

                            <div class="col-md-12">

                                <label class="premium-label">
                                    Current Password
                                </label>

                                <div class="premium-input">
                                    <i class="fas fa-lock"></i>
                                    <input type="password"
                                           name="currentPassword"
                                           id="currentPassword"
                                           required>
                                </div>

                            </div>

                            <div class="col-md-6">

                                <label class="premium-label">
                                    New Password
                                </label>

                                <div class="premium-input">
                                    <i class="fas fa-lock-open"></i>
                                    <input type="password"
                                           name="newPassword"
                                           id="newPassword"
                                           required>
                                </div>

                            </div>

                            <div class="col-md-6">

                                <label class="premium-label">
                                    Confirm Password
                                </label>

                                <div class="premium-input">
                                    <i class="fas fa-check-circle"></i>
                                    <input type="password"
                                           name="confirmNewPassword"
                                           id="confirmNewPassword"
                                           required>
                                </div>

                            </div>

                            <div class="col-12">

                                <div class="profile-actions">

                                    <button type="submit" class="profile-password-btn">
                                        <i class="fas fa-key"></i>
                                        Change Password
                                    </button>

                                </div>


                            </div>


                        </div>

                    </form>
                    

                </div>

                <div class="profile-card mt-4 delete-account-card">

                    <div class="profile-card-heading">
                        <div>
                            <span>Danger Zone</span>
                            <h2>Delete Account</h2>
                        </div>
                    </div>

                    <p class="delete-warning">
                        Once you delete your account, your profile data will be permanently removed.
                    </p>

                    <form action="${pageContext.request.contextPath}/auth/delete-account"
                          method="post"
                          onsubmit="return confirm('Are you sure you want to delete your account permanently?');">

                        <button type="submit" class="delete-account-btn">
                            <i class="fas fa-trash"></i>
                            Delete My Account
                        </button>

                    </form>

                </div>

                </div>

            </div>

        </div>

    </div>

</section>

<jsp:include page="include/footer.jsp"/>

<script src="https://unpkg.com/jquery@3.7.1/dist/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>

<script>
    $(function () {
        const fields = $('#firstName, #lastName, #email, #phone');
        const editBtn = $('#editProfileBtn');
        const saveBtn = $('#saveProfileBtn');
        const cancelBtn = $('#cancelEditBtn');
        const profileImageInput = $('#profileImageInput');
        const profileImagePreview = $('#profileImagePreview');
        const uploadImageBtn = $('#uploadImageBtn');

        function toggleEdit(editMode) {
            fields.prop('readonly', !editMode);
            editBtn.toggleClass('d-none', editMode);
            saveBtn.toggleClass('d-none', !editMode);
            cancelBtn.toggleClass('d-none', !editMode);
            uploadImageBtn.toggleClass('d-none', !editMode);
        }

        toggleEdit(false);

        editBtn.on('click', () => toggleEdit(true));

        cancelBtn.on('click', () => {
            location.reload();
        });

        uploadImageBtn.on('click', () => profileImageInput.click());

        profileImageInput.on('change', function () {
            const file = this.files[0];

            if (file) {
                const reader = new FileReader();

                reader.onload = (e) => profileImagePreview.attr('src', e.target.result);

                reader.readAsDataURL(file);
            }
        });

        <c:if test="${not empty successMessage}">
        $.notify("${successMessage}", {
            position: "top center",
            className: "success"
        });
        </c:if>

        <c:if test="${not empty errorMessage}">
        $.notify("${errorMessage}", {
            position: "top center",
            className: "error"
        });
        </c:if>

        $('#changePasswordForm').on('submit', function (e) {
            const newPass = $('#newPassword').val();
            const confirmPass = $('#confirmNewPassword').val();

            if (newPass !== confirmPass) {
                e.preventDefault();

                $.notify("New passwords do not match.", {
                    position: "top center",
                    className: "error"
                });
            }
        });
    });
</script>

</body>

</html>