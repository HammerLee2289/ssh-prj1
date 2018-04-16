<!DOCTYPE html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html lang="zh-CN">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">Excuse form</h4>
			</div>
			<div class="modal-body">
				<form id="excuseForm" method="post">
					<input type="hidden" id="excuse-excuseId" name="excuse.excuseId">
					<input type="hidden" id="excuse-status" name="excuse.status">
					<div class="form-group">
						<label for="excuse-name" class="control-label">Name:</label> <input
							type="text" class="form-control" id="excuse-name"
							name="excuse.name">
					</div>
					<!-- Single button -->
					<div class="btn-group">
					
						<input type="hidden" name="excuse.type" value=""
							id="excuse-typein">
						<button type="button" class="btn btn-default" id="excuse-type">--请选择--</button>
						<button type="button" class="btn btn-default dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="caret"></span> <span class="sr-only">Toggle
								Dropdown</span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="chooseType(this)">type1</a></li>
							<li><a href="#" onclick="chooseType(this)">type2</a></li>
							<li><a href="#" onclick="chooseType(this)">type3</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#" onclick="chooseType(this)">overtime</a></li>
						</ul>
					</div>
					<div class="form-group">
						<label for="excuse-reason" class="control-label">Reason:</label>
						<textarea class="form-control" id="excuse-reason"
							name="excuse.reason"></textarea>
					</div>
					<!-- dateTime Picker div-->
					<div class="form-group">
						<label for="excuse-date" class="control-label">Date Time
							Picking:</label>
						<div class="input-group date form_date col-md-5" data-date=""
							data-date-format="yyyy-mm-dd">
							<input class="form-control" size="16" type="text" value=""
								readonly name="excuse.dateTime" id="excuse-date"> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
					</div>
					<div class="form-group">
						<label for="excuse-duration" class="control-label">Duration:</label> <input
							type="text" class="form-control" id="excuse-duration"
							name="excuse.duration">
					</div>
					<div class="form-group">
						<label for="exampleInputFile">File input</label> <input
							type="file" id="exampleInputFile">
						<p class="help-block">Example block-level help text here.</p>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="submitExcuse()">Save</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function chooseType(choice) {//excuse类型选择
		$('#excuse-typein').val($(choice).html());
		$('#excuse-type').html($(choice).html());
	}
</script>