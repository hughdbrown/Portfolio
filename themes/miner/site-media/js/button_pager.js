function change_button(old_item, new_item) {
	if (old_item != new_item) {
		old_item.removeClass("current");
		new_item.addClass("current");
	}
	return false;
}
function find_first_button(project) {
	return project.find(".images-list li:first");
}
function find_last_button(project) {
	return project.find(".images-list li:last");
}
function find_next_button(current, project) {
	var nextimg = current.next();
	return (! nextimg.is("li")) ? find_first_button(project) : nextimg;
}
function find_prev_button(current, project) {
	var previmg = current.prev();
	return (! previmg.is("li")) ? find_last_button(project) : previmg;
}
function find_current_button(project) {
	return project.find(".images-list li.current");
}
function find_project(t) {
	return t.parents().filter(".project");
}
$(document).ready(function() {
	$(".button-list .next").click(function() {
		var project = find_project($(this));
		var currentimg = find_current_button(project);
		return change_button(currentimg, find_next_button(currentimg, project));
	});
	$(".button-list .prev").click(function() {
		var project = find_project($(this));
		var currentimg = find_current_button(project);
		return change_button(currentimg, find_prev_button(currentimg, project));
	});
});
