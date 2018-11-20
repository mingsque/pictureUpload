<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	$(document).ready(function(){
		$("#noticeTable a").click(function(){
			var seqNo = $(this).data("view");
			//var selectBtn = $(this).attr("id");
			
			$('#noticeForm').attr("action","/manage/mngNoticeView.do");			
			$('#seqNo').val(seqNo);
			
			$('#noticeForm').submit(); 
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
							<div class="pull-left">공지사항 관리</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<div class="table-responsive">
								<table class="table table-bordered " id="noticeTable">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>조회수</th>
											<th>관리</th>
										</tr>
									</thead> 
									<tbody>
									
									<c:forEach items="${allNoticeList}" var="allNoticeList">
									
										<tr>
											<td><c:out value="${allNoticeList.seqNo}"></c:out></td>
											<td><c:out value="${allNoticeList.title}"></c:out></td>
											<td><c:out value="${allNoticeList.viewCnt}"></c:out></td>
											<td>												
												<a href="#" data-view = "<c:out value="${allNoticeList.seqNo}"/>">	
													<button class="btn btn-sm btn-warning">
														<i class="fa fa-pencil"></i>
													</button>
												</a>	
											
												<button class="btn btn-sm btn-danger">
													<i class="fa fa-times"></i>
												</button>
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
								<li><a href="#">글추가하기</a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						
						
						<!-- form 태그 -->
						<form action="#" method="post" id="noticeForm">
							<input type="hidden" value="" name="seqNo" id="seqNo">
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
