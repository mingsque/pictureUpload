<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>

var ajaxFunc = {
	trDelete : function(no){
		$.ajax({
		  method: "POST",
		  url: "categoryDelete.do",
		  data: { seq_No : no }
		})
		.done(function( msg ) {
		   $(".mainbar").html(msg);
		}); 
	},
	
	trSmallDelete : function(no){
		$.ajax({
		  method: "POST",
		  url: "smallCategoryDelete.do",
		  data: { seq_No : no }
		})
		.done(function( msg ) {
		   $(".mainbar").html(msg);
		}); 
	},
	
	trEdit : function(that){  
		$(that).parent().find(".btn-success").removeAttr("style");
		$(that).hide();
		
		var $tr 	   = $(that).parent().parent(); 
		var isSelected = "";
		
		$tr.find("td:eq(1)").html("<input type='text' name='category_Name' value='"+$tr.find("td:eq(1)").text()+"' />"); 
		$tr.find("td:eq(2)").html("<input type='text' name='sno' value='"+$tr.find("td:eq(2)").text()+"' />"); 
		if($tr.find("td:eq(3)").text().indexOf("InActive") > 0){
			isSelected ="selected";
		}
		$tr.find("td:eq(3)").html("<select name='is_Used'>"+
									"<option value='Y'>Active</option>"+
									"<option value='N' "+isSelected+">InActive</option>"+ 
								  "</select>"); 
	},
	
	trSmallEdit : function(that){  
		$(that).parent().find(".btn-success").removeAttr("style");
		$(that).hide();
		
		var $tr 	   = $(that).parent().parent(); 
		var isSelected = "";
		
		$.ajax({
		  method: "POST",
		  url	: "parentCate.do"  
		})
		.done(function( data ) {
		   $tr.find("td:eq(1)").html("<select name='category_Fk'></select>");
		   $tr.find("td:eq(1)").find("select").append(data);
		});   
		
		$tr.find("td:eq(2)").html("<input type='text' name='category_Name' value='"+$tr.find("td:eq(2)").text()+"' />"); 
		$tr.find("td:eq(3)").html("<input type='text' name='sno' value='"+$tr.find("td:eq(3)").text()+"' />"); 
		
		if($tr.find("td:eq(4)").text().indexOf("InActive") > 0){
			isSelected ="selected";
		}
		$tr.find("td:eq(4)").html("<select name='is_Used'>"+
									"<option value='Y'>Active</option>"+
									"<option value='N' "+isSelected+">InActive</option>"+ 
								  "</select>"); 
	},
	
	trSave : function(no, that){
		var $tr = $(that).parent().parent(); 
		
		var _category_Name = $tr.find("td:eq(1)").find("input[name=category_Name]").val(),
		 	_sno 		   = $tr.find("td:eq(2)").find("input[name=sno]").val(),
		 	_is_Used 	   = $tr.find("td:eq(3)").find("select[name=is_Used]").val(); 
		
		$.ajax({
		  method: "POST",
		  url: "categoryUpdate.do", 
		  data: { seq_No 		: no, 
			  	  category_Name : _category_Name, 
			  	  sno 			: _sno, 
			  	  is_Used 		: _is_Used
			  	}
		})
		.done(function( msg ) {
		   $(".mainbar").html(msg);
		}); 
	}, 
	
	trSmallSave : function(no, that){
		var $tr = $(that).parent().parent(); 
		
		var _category_Fk   = $tr.find("td:eq(1)").find("select[name=category_Fk]").val(); 
			_category_Name = $tr.find("td:eq(2)").find("input[name=category_Name]").val(),
		 	_sno 		   = $tr.find("td:eq(3)").find("input[name=sno]").val(),
		 	_is_Used 	   = $tr.find("td:eq(4)").find("select[name=is_Used]").val(); 
		
		$.ajax({
		  method: "POST",
		  url: "smallCategoryUpdate.do", 
		  data: { seq_No 		: no, 
			  	  category_Name : _category_Name, 
			  	  sno 			: _sno, 
			  	  is_Used 		: _is_Used,
			  	  category_Fk   : _category_Fk
			  	}
		})
		.done(function( msg ) {
		   $(".mainbar").html(msg);
		}); 
	}, 
	
	makeParentCate : function(){
		$.ajax({
		  method: "POST",
		  url	: "parentCate.do"  
		})
		.done(function( data ) {
		   $("#category_Fk").append(data);
		});  
	}
	
}
$(document).ready(function(){
	ajaxFunc.makeParentCate();
})
</script>
<div class="mainbar">
      
				<!-- Page heading -->
				<div class="page-head">
					<!-- Page heading -->
					<h2 class="pull-left">Category Manage 
					<!-- page meta -->
					<span class="page-meta">카테고리 관리</span>
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
									  <div class="pull-left">상위 카테고리</div>
									  <div class="widget-icons pull-right">
										<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
									  </div>
									  <div class="clearfix"></div>
									</div>
									<div class="widget-content">
										<div class="table-responsive">
											<table class="table table-bordered ">
												<thead>
													<tr>
													  <th>#</th>
													  <th>카테고리 이름</th>
													  <th>정렬순서</th>
													  <th>사용여부</th>
													  <th>관리</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${list}" var="list" varStatus="status">
														<tr>
														  <td>${status.count}</td>
														  <td>${list.category_Name}</td>
														  <td>${list.sno}</td>
														  <td> 
														  		<c:if test="${list.is_Used eq 'Y' }">
														  			<span class="label label-success">Active</span>
														  		</c:if>
														  		<c:if test="${list.is_Used eq 'N' }"> 
														  			<span class="label label-important">InActive</span>
														  		</c:if>
														  </td> 
														  <td> 
															  <button class="btn btn-sm btn-success" style="display:none;" onclick="ajaxFunc.trSave(${list.seq_No}, this)">
															  <i class="fa fa-check"></i> </button>
															  <button class="btn btn-sm btn-warning" onclick="ajaxFunc.trEdit(this)">
															  <i class="fa fa-pencil"></i> 
															  </button>
															  <button class="btn btn-sm btn-danger" onclick="ajaxFunc.trDelete(${list.seq_No})">
															  <i class="fa fa-times"></i> </button> 
														  </td>  
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
									<div class="widget-foot"> 
										<form action="insert.do" method="post" id="frm">
											카테고리 이름  <input type="text" name="category_Name" class="form-control" style="width:10%;display:inline-block;"/>
											정렬 순서  <input type="text" name="sno" class="form-control" style="width:10%;display:inline-block;"/>
											사용 여부   
											<select name="is_Used" class="form-control" style="width:10%;display:inline-block;">
												<option value="Y">Active</option>
												<option value="N">InActive</option>
											</select>
											<button type="button" class="form-control" style="width:10%;display:inline-block;" onclick="$('#frm').submit()">저장</button>
									
										</form>
									</div>
								</div>

								<div class="widget wviolet">
									<div class="widget-head">
										<div class="pull-left">하위 카테고리</div>
										<div class="widget-icons pull-right">
											<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="widget-content">
										<div class="table-responsive">
											<table class="table table-bordered ">
												<thead>
													<tr>
													  <th>#</th>
													  <th>상위 카테고리</th>
													  <th>카테고리 이름</th>
													  <th>정렬순서</th>
													  <th>사용여부</th>
													  <th>관리</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${smallList}" var="list" varStatus="status">
														<tr>
														  <td>${status.count}</td>
														  <td>${list.parent_Name}</td>
														  <td>${list.category_Name}</td>
														  <td>${list.sno}</td>
														  <td> 
														  		<c:if test="${list.is_Used eq 'Y' }">
														  			<span class="label label-success">Active</span>
														  		</c:if>
														  		<c:if test="${list.is_Used eq 'N' }"> 
														  			<span class="label label-important">InActive</span>
														  		</c:if>
														  </td> 
														  <td> 
															  <button class="btn btn-sm btn-success" style="display:none;" onclick="ajaxFunc.trSmallSave(${list.seq_No}, this)">
															  <i class="fa fa-check"></i> </button>
															  <button class="btn btn-sm btn-warning" onclick="ajaxFunc.trSmallEdit(this)">
															  <i class="fa fa-pencil"></i> 
															  </button>
															  <button class="btn btn-sm btn-danger" onclick="ajaxFunc.trSmallDelete(${list.seq_No})">
															  <i class="fa fa-times"></i> </button> 
														  </td>  
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
									<div class="widget-foot">
										<form action="smallInsert.do" method="post" id="frm2">
											상위 카테고리 : <select name="category_Fk" id="category_Fk">
											
													  </select>
											카테고리 이름 : <input type="text" name="category_Name" />
											정렬 순서 : <input type="text" name="sno" />
											사용 여부 : 
											<select name="is_Used">
												<option value="Y">Active</option>
												<option value="N">InActive</option>
											</select>
											<button type="button" class="form-control" style="width:10%;display:inline-block;" onclick="$('#frm2').submit()">저장</button>
										</form> 
									</div>
								</div>
								
								
							</div>
						</div>
						
						</div>
				</div><!--/ Matter ends -->
			</div>