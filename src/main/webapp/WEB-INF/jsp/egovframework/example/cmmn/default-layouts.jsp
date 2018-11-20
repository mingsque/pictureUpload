<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
    <head>
		<tiles:insertAttribute name="header"/>      
    </head>
    <body>
      
        <!--  Loader  -->
        <div id="myloader">
            <div class="loader">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!--  END Loader  -->
        

        <!--  Main Wrap  -->
        <div id="main-wrap">
            <!--  Header & Menu  -->
	  		<tiles:insertAttribute name="nav"/>	
            <!--  END Header & Menu  -->

            <!--  Page Content  -->            
			<tiles:insertAttribute name="content"/>  
            <!--  END Page Content -->
        </div>
        <!--  Main Wrap  -->
        

        <!--  Footer  -->
		<tiles:insertAttribute name="footer"/>            
        <!--  END Footer. Class fixed for fixed footer  -->
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- All js library -->
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/jquery.flexslider-min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=false"></script>
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/smooth.scroll.min.js"></script>
        <script src="js/jquery.appear.js"></script>
        <script src="js/jquery.countTo.js"></script>
        <script src="js/jquery.scrolly.js"></script>
        <script src="js/plugins-scroll.js"></script>
        <script src="js/imagesloaded.min.js"></script>
        <script src="js/pace.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>