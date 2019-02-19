<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<script>


$(document).ready(function(){
	
	$('#saveBtn').hide();
	$('#cancelBtn').hide();
	
	$('#addBtn').click(function(){
		$('#categoryTable').children().append("<tr><td><input type='text'/></td></tr>");
		$('#saveBtn').show();
		$('#cancelBtn').show();
		$('#addBtn').hide();
	});
	
	$('#saveBtn').click(function(){
		$('#saveBtn').hide();
		$('#cancelBtn').hide();
		$('#addBtn').show();
		//submit
	});
	
	$('#cancelBtn').click(function(){
		$('#saveBtn').hide();
		$('#cancelBtn').hide();
		$('#addBtn').show();
		
 		$('#categoryTable').children().children().last().remove();
	});
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
		<div class="clearfix"></div>
	</div> <!--/ Page heading ends -->

	<!-- Matter -->
	<table class="table table-borded" id ="categoryTable">
		<tbody>
			<c:forEach items="${bikeCategoryList}" var="bikeCategoryList">
				<tr>
					<td><c:out value="${bikeCategoryList.name}" /></td>
					<td><c:out value="${bikeCategoryList.useYn}" /></td>
				</tr>
			</c:forEach>
			
			
		</tbody>
	</table>
	<button id="addBtn" class="btn btn-primary">추가</button>
	<button id="saveBtn" class="btn btn-primary">저장</button>
	<button id="cancelBtn" class="btn btn-primary">취소</button>
	
	<div class="matter">
		<div class="container">
			<div class="row">
				<div class="col-md-12">	
					<div class="widget wblack">
						<div class="widget-head">
						  <div class="pull-left">상품정보</div>
						  <div class="widget-icons pull-right"></div>
						  <div class="clearfix"></div>
						</div>
						
						
						<div class="widget-content">
							<div class="table-responsive">
								<form id="frm" action="insert.do" method="post" enctype="multipart/form-data">
									<table class="table table-bordered ">
										<tbody>
											<tr> 
												<th>대분류</th>
												<th><input type="text" name="" class="form-control"/></th> 
											</tr>
											<tr> 
												<th>소분류</th>
												<th><input type="text" name="" class="form-control"/></th> 
											</tr>
											<tr> 
												<th>상품명</th> 
												<th><input type="text" name="product_Name" class="form-control"/></th>
											</tr>
											<tr> 
												<th>색상</th> 
												<th><input type="text" name="product_Color" class="form-control"/></th>
											</tr>
											<tr> 
												<th>수량</th> 
												<th><input type="text" name="product_Cnt" class="form-control"/></th>
											</tr>
											<tr> 
												<th>사이즈</th> 
												<th><input type="text" name="product_Size" class="form-control"/></th>
											</tr> 
											<tr> 
												<th>상품 이미지</th> 
												<th><input type="file" name="imagefile" class="form-control"/></th>
											</tr>
										</tbody>
									</table>
								</form>
							</div>
						</div>
						<div class="widget-foot" align="right"> 
							<button class="btn" type="button" name="insert" >저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!--/ Matter ends -->
</div><!--/ Mainbar ends -->	    	

 