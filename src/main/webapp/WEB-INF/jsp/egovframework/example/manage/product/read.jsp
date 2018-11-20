<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <script>
 $(document).ready(function(){
	 $("button[name=list]").click(function(){
		location.href="/manage/product/index.do"; 
	 });
 })
 </script>
 <!-- Main bar -->
<div class="mainbar">
   
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">Product Manage 
		<!-- page meta -->
		<span class="page-meta">상품 관리</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right">
			<a href="index.html"><i class="fa fa-home"></i> Home</a> 
			<!-- Divider -->
			<span class="divider">/</span> 
			<a href="#" class="bread-current">Tables</a>
		</div>
		<div class="clearfix"></div>
	</div> <!--/ Page heading ends -->

	<!-- Matter -->

	<div class="matter">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="widget wred">
						<div class="widget-head">
						  <div class="pull-left">상품정보</div>
						  <div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						  </div>
						  <div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<div class="table-responsive">
								<form id="frm" action="insert.do" method="post"  enctype="multipart/form-data">
								<table class="table table-bordered ">
									<tbody>
										<tr> 
											<th>대분류</th> 
											<th>
												<c:out value="${productVO.category_Name}"/>
											</th>
										</tr>
										<tr> 
											<th>소분류</th> 
											<th>
												<c:out value="${productVO.small_Category_Name}"/>
											</th>
										</tr>
										<tr> 
											<th>상품명</th> 
											<th>
												<c:out value="${productVO.product_Name}"/>
											</th>
										</tr>
										<tr> 
											<th>색상</th> 
											<th>
												<c:out value="${productVO.product_Color}"/>
											</th>
										</tr>
										<tr> 
											<th>수량</th> 
											<th><c:out value="${productVO.product_Cnt}"/></th>
										</tr>
										<tr> 
											<th>사이즈</th> 
											<th><c:out value="${productVO.product_Size}"/></th>
										</tr> 
										<tr> 
											<th>상품 이미지</th> 
											<th><img src="/upload/product/<c:out value="${productVO.imagefile}"/>"/></th>
										</tr>
									</tbody>
								</table>
								</form>
							</div>
						</div>
						<div class="widget-foot" align="right"> 
							<button class="btn btn-primary" type="button" name="list" >목록으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!--/ Matter ends -->
</div><!--/ Mainbar ends -->	    	

 