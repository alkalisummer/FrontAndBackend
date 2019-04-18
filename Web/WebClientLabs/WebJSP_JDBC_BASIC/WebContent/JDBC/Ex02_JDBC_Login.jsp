<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Insert title here</title>
    <jsp:include page="common/Head.jsp" />
  </head>
  <body>
    <div class="d-flex" id="wrapper">
      <div class="bg-light border-right" id="sidebar-wrapper">
        <jsp:include page="common/Left.jsp" />
      </div>
      <div id="page-content-wrapper">
        <jsp:include page="common/Top.jsp" />

        <div class="container">
				<form
              action="Ex02_JDBC_JoinOK.jsp"
              method="post"
              name="joinForm"
              id="joinForm"
      >
        <div>
          <form class="form-horizontal" role="form">
            <h2>로그인</h2>
            <div class="form-group">
              <label for="id" class="col-sm-3 control-label">ID</label>
              <div class="col-sm-9">
                <input
                        type="text"
                        id="id"
                        placeholder="아이디"
                        class="form-control"
                        autofocus
                />
              </div>
            </div>
            <div class="form-group">
              <label for="password" class="col-sm-3 control-label"
              >Password</label
              >
              <div class="col-sm-9">
                <input
                        type="password"
                        id="password"
                        placeholder="비밀번호"
                        class="form-control"
                />
              </div>
            </div>
            <!-- /.form-group -->
            <button
                    type="submit"
                    class="btn btn-primary btn-block col-sm-9"
            >
              Login
            </button>
          </form>
        </div>
      </form>
        </div>
      </div>
    </div>

    <div class="footer">
      <jsp:include page="common/Bottom.jsp" />
    </div>

    <script>
      $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
      });
    </script>
  </body>
</html>
