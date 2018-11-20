<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- Sidebar -->
			<div class="sidebar">
				<div class="sidebar-dropdown"><a href="#">Navigation</a></div>
				<div class="sidebar-inner">
					<!-- Search form -->
					<div class="sidebar-widget">
						<form >
							<input type="text" class="form-control" placeholder="Search">
						</form>
					</div>
					<!--- Sidebar navigation -->
					<!-- If the main navigation has sub navigation, then add the class "has_submenu" to "li" of main navigation. -->
					<ul class="navi">
						<!-- Use the class nred, ngreen, nblue, nlightblue, nviolet or norange to add background color. You need to use this in <li> tag. -->

						<li  class="nred"><a href="javascript:frmSubmit('main');"><i class="fa fa-desktop"></i> Dashboard</a></li>
						<!-- Menu with sub menu -->
						<li id="target2" class="has_submenu nlightblue">
							<a href="#">
								<!-- Menu name with icon -->
								<i class="fa fa-th"></i> Widgets
								<!-- Icon for dropdown -->
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							<ul>
								<li><a href="javascript:frmSubmit('widget1');">Widgets #1</a></li>
								<li><a href="javascript:frmSubmit('widget2');">Widgets #2</a></li>
							</ul>
						</li>
						<li class="has_submenu ngreen">
							<a href="#">
								<i class="fa fa-bar-chart-o"></i> 게시판
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							<ul>
								<li><a href="/manage/mngFaq.do">FAQ</a></li>
								<li><a href="/manage/mngNotice.do">공지사항</a></li>
								<li><a href="/manage/mngPs.do">1:1문의</a></li>
							</ul>
						</li>
						<li class="norange"><a href="javascript:frmSubmit('uiElements');"><i class="fa fa-sitemap"></i> UI Elements</a></li>
						<li class="has_submenu nviolet">
							<a href="#">
								<i class="fa fa-file-o"></i> 쇼핑몰 관리
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							<ul>
								<li><a href="javascript:frmSubmit('/manage/category/index');">카테고리 관리</a></li>
								<li><a href="javascript:frmSubmit('/manage/product/index');">상품 관리</a></li>
							
							</ul>
						</li> 
						<li class="has_submenu nblue">
							<a href="#">
								<i class="fa fa-file-o"></i> Pages #2
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							<ul>
								<li><a href="error.html">Error</a></li>
								<li><a href="gallery.html">Gallery</a></li>
								<li><a href="grid.html">Grid</a></li>
								<li><a href="invoice.html">Invoice</a></li>
								<li><a href="media.html">Media</a></li>
								<li><a href="profile.html">Profile</a></li>
							</ul>
						</li> 
						<li class="nred"><a href="forms.html"><i class="fa fa-list"></i> Forms</a></li>
						<li class="nlightblue"><a href="tables.html"><i class="fa fa-table"></i> Tables</a></li>
					</ul>
					<!--/ Sidebar navigation -->

					<!-- Date -->
					<div class="sidebar-widget">
						<div id="todaydate"></div>
					</div>
				</div>
			</div>
			<!-- Sidebar ends -->