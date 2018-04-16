<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="userCardModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">个人信息卡</h4>
			</div>
			<div class="modal-body" id="userCard-body">
				<div class="col-sm-4">
					<div class="text-center">
						<img alt="default-img" class="img-circle m-t-xs img-responsive"
							src="${basePath}upload/${userCard.username}.jpg?t=<%=new Date() %>" id="userCard-photo">
						<div class="m-t-xs font-bold">officer</div>
					</div>
				</div>
				<div class="col-sm-8" id="userCard-info">
					<h3>
						<strong id="userCard-username">default-name</strong>
					</h3>
					<p id="userCard-address">
						<i class="fa fa-map-marker"></i>
					</p>
					<address>
						<strong>Company, Inc.</strong><br> 
						E-mail:default-email<br> 
						Weibo:default-Weibo<br>
						<abbr title="Phone">Tel:default-tel</abbr>
					</address>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>