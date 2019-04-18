<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Insert title here</title>
    <jsp:include page="common/Head.jsp" />
    <style>
		#page-content-wrapper {
			background-image: url("https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80");
			background-size : 100% 100%;
		}
		</style>
  </head>
  <body>
    <div class="d-flex" id="wrapper">
      <div class="bg-light border-right" id="sidebar-wrapper">
        <jsp:include page="common/Left.jsp" />
      </div>
      <div id="page-content-wrapper">
        <jsp:include page="common/Top.jsp" />

        <div class="container">
				&nbsp;
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
