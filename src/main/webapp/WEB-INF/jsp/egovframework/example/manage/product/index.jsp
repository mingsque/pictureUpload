<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <script>
 $(document).ready(function(){
	$("button[name=write]").click(function(){ 
		location.href="write.do"; 		
	}) 
 });
 
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
						  <div class="pull-left">상품 목록</div>
						  <div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						  </div>
						  <div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<div class="table-responsive">
								<table class="table table-bordered ">
									<thead>
										<tr>
										  <th>#</th>
										  <th>상품명</th>
										  <th>대분류</th>
										  <th>소분류</th>
										  <th>관리</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${productList}" varStatus="status" var="productList">
											<tr>
												<td>${status.count}</td>
												<td><a href="read.do?no=${productList.seq_No}">${productList.product_Name}</a></td>
												<td>${productList.category_Name}</td>
												<td>${productList.small_Category_Name}</td>
												<td></td>
											</tr>
										</c:forEach>                                                            
									</tbody>
								</table>
							</div>
						</div>
						<div class="widget-foot">
							<ul class="pagination pull-right">
							  <li><a href="#">Prev</a></li>
							  <li><a href="#">1</a></li>
							  <li><a href="#">2</a></li>
							  <li><a href="#">3</a></li>
							  <li><a href="#">4</a></li>
							  <li><a href="#">Next</a></li>
							</ul>
							<div class="clearfix"></div> 
						</div>
						<div class="widget-foot" align="right"> 
							<button class="btn btn-primary" type="button" name="write" >글작성</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!--/ Matter ends -->
</div><!--/ Mainbar ends -->	    	

 