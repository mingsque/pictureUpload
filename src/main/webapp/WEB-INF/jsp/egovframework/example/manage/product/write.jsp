<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <script>

 var selectControl = {
	list      : {},
	smallList : {},
	
	init : function(list, smallList){
		this.list 	   = list;
		this.smallList = smallList;
		
		$cate = $("select[name=category_Fk]");
		
		for(var i = 0; i < this.list.length; i++) {
			$cate.append("<option value='"+this.list[i].seq_No+"'>"+this.list[i].category_Name+"</option>");
		}
		
		this.change();	
	},
	
	change : function(){
		var that   = this,
			$sCate = $("select[name=small_Category_Fk]");
		
		$("select[name=category_Fk]").change(function(){
			var cateFk = $(this).val(); 
			var proCnt = 0;
			$sCate.children().remove();
			
			
			for(var i = 0; i < that.smallList.length; i++) {
				if(that.smallList[i].category_Fk == cateFk) {
					$sCate.append("<option value='"+that.smallList[i].seq_No+"'>"+that.smallList[i].category_Name+"</option>");
					proCnt += 1;
				}
			}
			if(proCnt > 0) {
				$sCate.prepend("<option selected>선택해주세요</option>");
			} else {
				$sCate.prepend("<option selected>사용할 카테고리가 없습니다.</option>");
			}
		})
	}
 }
		 
 
 $(document).ready(function(){
	$("button[name=insert]").click(function(){ 

		if($("input[name=product_Name]").val() === "") {
			alert("상품명을 입력해주세요.");
			return;
		}
		
		if($("input[name=product_Cnt]").val() === "") {
			$("input[name=product_Cnt]").val("0");
		}
		
		$("#frm").submit();	
	}) 
	$.ajax({
		url : "/cateList.do",
		type : "post",
		contentType : "application/json",
		success : function(data) {
			var jObj = JSON.parse(data);
			selectControl.init(jObj.list, jObj.smallList);
		}
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
												<select name="category_Fk" class="form-control">
													<option value="">선택해주세요</option>
												</select>
											</th>
										</tr>
										<tr> 
											<th>소분류</th> 
											<th>
												<select name="small_Category_Fk" class="form-control">
												
												</select>
											</th>
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
											<th><input type="text" name="product_Cnt" class="form-control"  onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)'/></th>
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
							<button class="btn btn-primary" type="button" name="insert" >저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!--/ Matter ends -->
</div><!--/ Mainbar ends -->	    	

 