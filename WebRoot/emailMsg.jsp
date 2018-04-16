<!DOCTYPE html>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html lang="zh-CN">
<div class="modal fade" id="emailMsg" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">New message</h4>
			</div>
			<div class="modal-body">
					<input type="hidden" id="emailMsg-excuseId"> <input
						type="hidden" id="emailMsg-name">
					<div class="form-group">
						<label for="emailMsg-reason" class="control-label">Reject Reason:</label>
						<textarea class="form-control" id="emailMsg-reason"></textarea>
					</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="sendAndDelete()">Send & Delete</button>
			</div>
		</div>
	</div>
</div>