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
			var seqNo = "<c:out value="${checkFaqList.seqNo}"/>";
			
			
			$("#title").val(title);
			$("#content").val(content);
			$("#seqNo").val(seqNo);
			
			$("#faqViewForm").attr("action","/manage/mngFaqModify.do");	
				
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
													<input type="text" class="form-control" id="textTitle" value="<c:out value="${checkFaqList.title}"/>">
												  </div>
												</div>
												<div class="form-group">
												  <label class="col-md-2 control-label"> 내용 </label>
												  <div class="col-md-8">
													<textarea class="form-control" rows="15" id="textAreaContent"> <c:out value="${checkFaqList.content}"/></textarea>
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
													<button type="button" class="btn btn-success">수정하기</button>
<!-- 												<button type="button" class="btn btn-default">Default</button>
													<button type="button" class="btn btn-primary">Primary</button>
													<button type="button" class="btn btn-info">Info</button>
													<button type="button" class="btn btn-warning">Warning</button>
													<button type="button" class="btn btn-danger">Danger</button>
 -->												  </div>
												</div>
											</form>
					
										 	<form action="#" method="post" id="faqViewForm">
										 		<input type="hidden" id="title" name="title">
										 		<input type="hidden" id="content" name="content">
										 		<input type="hidden" id="seqNo" name="seqNo">
										 	</form>
					
									  </div>
									</div>
								</div>  
							</div>
						</div>
					</div>
				</div>
			</div>