<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<script>
	
	$(document).ready(function(){
		$("#btnTag button").click(function(){
			var title = $("#textTitle").val();
			var content = $("#textAreaContent").val();
			
			
			$("#title").val(title);
			$("#content").val(content);
			
			$("#faqViewForm").attr("action","/manage/mngFaqInsert.do");	
				
			$("#faqViewForm").submit();
		})	
		
	})
	
	
</script>    
    
		    <div class="mainbar">
				<div class="matter">
					<div class="container" style="margin-top: 3%">
						<div class="row">
							<div class="col-md-12">
								<div class="widget wgreen">
              						<div class="widget-head">
									  <div class="pull-left">Forms</div>
									  <div class="widget-icons pull-right">
										<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
										<a href="#" class="wclose"><i class="fa fa-times"></i></a>
									  </div>
									  <div class="clearfix"></div>
									</div>
									<div class="widget-content">
									  <div class="padd">

										<h6>Input Boxs</h6>
										<hr />
										<!-- Form starts.  -->
											<form class="form-horizontal" role="form">
												<div class="form-group">
												  <label class="col-md-2 control-label"> 제목 </label>
												  <div class="col-md-8">
													<input type="text" class="form-control" id="textTitle" >
												  </div>
												</div>
												<div class="form-group">
												  <label class="col-md-2 control-label"> 내용 </label>
												  <div class="col-md-8">
													<textarea class="form-control" rows="15" id="textAreaContent"></textarea>
												  </div>
												</div>    
												
												<div class="form-group">
												  <label class="col-md-2 control-label">Select Box</label>
												  <div class="col-md-8">
													<select class="form-control">
													  <option>1</option>
													  <option>2</option>
													  <option>3</option>
													  <option>4</option>
													  <option>5</option>
													</select>
												  </div>
												</div>     
												<div class="form-group" id="btnTag">
												  <div class="col-md-offset-2 col-md-8">
													<button type="button" class="btn btn-success">작성하기</button>
											  	</div>
												</div>
											</form>
					
										 	<form action="#" method="post" id="faqViewForm">
										 		<input type="hidden" id="title" name="title">
										 		<input type="hidden" id="content" name="content">
										 	</form>
					
									  </div>
									</div>
								</div>  
							</div>
						</div>
					</div>
				</div>
			</div>