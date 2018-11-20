<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	$(document).ready(function(){
		$("#faqTable a").click(function(){
			
			var btnId = $(this).attr("id");
			var seqNo = $(this).data("view");
			//var selectBtn = $(this).attr("id");
			
			if (btnId =="modifyBtn"){
				$('#faqForm').attr("action","/manage/mngFaqView.do");			
			} else if(btnId =="deleteBtn"){
				$('#faqForm').attr("action","/manage/mngFaqDelete.do");
			}
			
			$('#seqNo').val(seqNo);
			$('#faqForm').submit(); 
		})
	})
		

</script>

<div class="mainbar">
	<div class="matter">
		<div class="container" style="margin-top: 3%;">
			<div class="row">
				<div class="col-md-12">
					<div class="widget wviolet">
						<div class="widget-head">
							<div class="pull-left">FAQ 관리</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<div class="table-responsive">
								<table class="table table-bordered " id="faqTable">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>조회수</th>
											<th>관리</th>
										</tr>
									</thead> 
									<tbody>
									
									<c:forEach items="${allFaqList}" var="allFaqList">
									
										<tr>
											<td><c:out value="${allFaqList.seqNo}"></c:out></td>
											<td><c:out value="${allFaqList.title}"></c:out></td>
											<td><c:out value="${allFaqList.view}"></c:out></td>
											<td>
												<%-- <button class="btn btn-sm btn-success" id="<c:out value="${allFaqList.seqNo}"></c:out>">
													<i class="fa fa-check"></i>
												</button> --%>
												
												<!-- 수정 버튼   -->
												<a href="#" id="modifyBtn" data-view = "<c:out value="${allFaqList.seqNo}"/>">	
													<button class="btn btn-sm btn-warning">
														<i class="fa fa-pencil"></i>
													</button>
												</a>	
												
												<!-- 삭제 버튼  -->
												<a href="#" id="deleteBtn" data-view = "<c:out value="${allFaqList.seqNo}"/>">	
													<button class="btn btn-sm btn-danger">
														<i class="fa fa-times"></i>
													</button>
												</a>
												
											</td>
										</tr>

									</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
						
						<!-- 페이지 수 조정 -->
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
						
						<!-- 글추가 버튼 -->
						<div class="widget-foot">
							<ul class="pagination pull-right">
								<li><a href="/manage/mngFaqWrite.do">글추가하기</a></li>
								
								
							</ul>
							<div class="clearfix"></div>
						</div>
						
						
						<!-- form 태그 -->
						<form action="#" method="post" id="faqForm">
							<input type="hidden" value="" name="seqNo" id="seqNo">
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
