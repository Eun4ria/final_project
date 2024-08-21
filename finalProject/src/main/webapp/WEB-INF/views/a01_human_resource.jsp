<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
    <meta name="author" content="AdminKit">
    <meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

    <!-- Material Icons -->
    <link rel="apple-touch-icon" sizes="85x85" href="/material-dashboard-2/assets/img/HPM-icon.png">
    <link rel="icon" sizes="85x85" type="image/png" href="/material-dashboard-2/assets/img/HPM-icon.png">
    <link href="/material-dashboard-2/assets/css/nucleo-icons.css" rel="stylesheet">
    <link href="/material-dashboard-2/assets/css/nucleo-svg.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link id="pagestyle" href="/material-dashboard-2/assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet">

    <!-- AdminKit -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="shortcut icon" href="/adminkit-3.1.0/img/icons/icon-48x48.png">
    <link rel="canonical" href="https://demo-basic.adminkit.io/">
    <title>HPM-Project Manager System</title>
    <link href="/adminkit-3.1.0/static/css/app.css" rel="stylesheet">
    <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>
    <style>
        .userList:hover {
            cursor: pointer;
            background-color: lightgray;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }
    </style>
    
 <c:if test="${not empty alertMessage}">
    <script>
        alert("${alertMessage}");
        location.href = '${path}/signinFrm';
    </script>
</c:if>   
</head>
<body>


    <div id="app" class="wrapper">
        <jsp:include page="a00_main_side.jsp"/>

        <div class="main">
            <jsp:include page="a00_top.jsp"/>

            <main class="content">
                <h1 class="h3 mb-3"><strong>Human Resources</strong> Management</h1>

                <div class="row mb-4">
                    <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
                        <div class="card">
                            <div class="card-header">
                                <div class="row d-flex justify-content-end">
                                    <div class="col-lg-5 col-7">
                                        <div class="input-group">
                                            <form class="input-group" @submit.prevent="searchUsers">
											    <input v-model="searchTerm" class="form-control" type="text" placeholder="Search..." 
											           @keyup="searchUsers" />
											    <input type="hidden" v-model="currentPage" />
											</form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body px-0 pb-2">
                                <div class="table-responsive">
                                    <table class="table align-items-center mb-0">
                                        <thead>
                                            <tr>
                                                <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7 px-2">no</th>
                                                <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">user</th>
                                                <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">ID</th>
                                                <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">email</th>
                                                <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">department</th>
                                                <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">company ID</th>
                                                <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">is Active</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="user in users" :key="user.user_id" class="userList" @click="getUser(user.user_id)">
                                                <td class="align-middle text-center text-sm">
                                                    <span class="amount text-s">{{ user.cnt }}</span>
                                                </td>
                                                <td>
                                                    <div class="d-flex px-2 py-1">
                                                        <div>
                                                            <img :src="user.image" class="avatar avatar-sm me-3" :alt="user.user_name + 's image'">
                                                        </div>
                                                        <div class="d-flex flex-column justify-content-center">
                                                            <h6 class="mb-0 text-sm font-weight-bold">{{ user.user_name }}</h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <span class="text-center text-s">{{ user.user_id }}</span>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <span class="text-center text-s">{{ user.email }}</span>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <span class="text-center text-s">{{ user.dname }}</span>
                                                </td>
                                                <td class="text-center text-sm">
                                                    <span class="text-center text-s">{{ user.company_id }}</span>
                                                </td>
                                                <td class="align-middle text-center text-sm">
                                                    <span class="text-center text-s">{{ user.project_status ? 'Active' : 'Inactive' }}</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <ul class="pagination justify-content-center mb-5">
                <li class="page-item">
                    <a class="page-link" href="javascript:void(0)" @click="changePage(currentPage - 1)" style="width:5rem">Previous</a>
                </li>
                <li v-for="page in pageNumbers" :key="page" :class="['page-item', { active: currentPage === page }]">
                    <a class="page-link" href="javascript:void(0)" @click="changePage(page)">{{ page }}</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript:void(0)" @click="changePage(currentPage + 1)" style="width:5rem">Next</a>
                </li>
            </ul>

<!-- Modal -->
<div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">User Info</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="modalFrm" class="form">
                    <div class="row">
                        <div class="col">
                            <span>ID</span>
                            <input v-model="currentUser.user_id" type="text" class="form-control" readonly />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <span>Name</span>
                            <input v-model="currentUser.user_name" type="text" class="form-control" readonly />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <span>Email</span>
                            <input v-model="currentUser.email" type="text" class="form-control" readonly />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <span>Company ID</span>
                            <input v-model="currentUser.company_id" type="text" class="form-control" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <span>Department</span>
                            <select v-model="currentUser.deptno" class="form-control">
                                <option value="0">N/A</option>
                                <option value="10">PM</option>
                                <option value="20">HR</option>
                                <option value="30">Finance</option>
                                <option value="40">Marketing</option>
                                <option value="50">Development</option>
                                <option value="60">Maintenance</option>
                                <option value="70">Quality Assurance</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success" @click="updateUser">Update</button>
                        <button type="button" class="btn btn-danger" @click="deleteUser">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


        </div>

        <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
        new Vue({
            el: '#app',
            data: {
                users: [],
                currentUser: {},
                currentPage: 1,
                pageSize: 5,
                pageCount: 0,
                pageNumbers: [],
                searchTerm: ''
            },
            methods: {
            	searchUsers() {
                    // Ensure searchTerm is not null
                    if (this.searchTerm === null || this.searchTerm.trim() === '') {
                        this.searchTerm = '';
                    }
                    // Set page to 1 for new searches
                    this.currentPage = 1;
                    // Fetch users with updated searchTerm
                    this.fetchUsers();
                },
                fetchUsers() {
                    axios.post('/HR', {
                        sch: this.searchTerm,
                        pageSize: this.pageSize,
                        curPage: this.currentPage
                    })
                    .then(response => {
                        this.users = response.data.userList;
                        this.pageCount = response.data.sch.pageCount;
                        this.pageNumbers = Array.from({ length: this.pageCount }, (_, i) => i + 1);
                    })
                    .catch(error => {
                        console.error(error);
                    });
                },
                getUser(user_id) {
                    axios.post('/getUser', null, { params: { user_id } })
                        .then(response => {
                            this.currentUser = response.data;
                            const modal = new bootstrap.Modal(document.getElementById('ModalCenter'));
                            modal.show();
                        })
                        .catch(error => {
                            console.error(error);
                        });
                },
                updateUser() {
                    if (confirm('수정하시겠습니까?')) {
                        axios.post('/updateUser', this.currentUser)
                            .then(response => {
                                alert('수정 완료');
                                this.fetchUsers();
                            })
                            .catch(error => {
                                console.error(error);
                            });
                    }
                },
                deleteUser() {
                    if (confirm('삭제하시겠습니까?')) {
                        axios.post('/deleteUser', null, { params: { user_id: this.currentUser.user_id } })
                            .then(response => {
                                alert('삭제 완료');
                                this.fetchUsers();
                                const modal = bootstrap.Modal.getInstance(document.getElementById('ModalCenter'));
                                modal.hide();
                            })
                            .catch(error => {
                                console.error(error);
                            });
                    }
                },
                changePage(page) {
                    if (page < 1 || page > this.pageNumbers.length) return;
                    this.currentPage = page;
                    this.fetchUsers();
                },
                resetCurrentUser() {
                    this.currentUser = {};  // currentUser를 초기화
                }
            },
            mounted() {
                this.fetchUsers();

            }
        });
        </script>
        
    </div>
</body>
</html>