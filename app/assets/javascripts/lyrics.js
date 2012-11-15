// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function toggleExplainPopup()
{
	var explainPopup = $('#explain_popup')

	if (explainPopup.length == 0) {
		showExplainPopup();
	} else {
		hideExplainPopup(explainPopup);
	}
}

function showExplainPopup()
{
	var selection = rangy.getSelection(),
	    selectionString = $.trim(selection.toString());

	if (selectionString === '') {
		return true;
	}

	if (selection.rangeCount > 0) {
		var range = selection.getRangeAt(0).cloneRange(),
		    explainPopup = $('<span>', { id: 'explain_popup', text: 'Объяснить'})[0];

		range.collapse(false);
		range.insertNode(document.createDocumentFragment().appendChild(explainPopup));
	}
}

function hideExplainPopup(popup)
{
	popup.remove();
}

function hideExplainPopupOrDoNothing()
{
	var explainPopup = $('#explain_popup');

	if (explainPopup) {
		hideExplainPopup(explainPopup);
	}
}

$(function() {
	$('html').click(function (e) {
		hideExplainPopupOrDoNothing();
	});

	$('#lyric').on({
		click: function(e) {
			e.stopPropagation();
		},
		mouseup: toggleExplainPopup
	});
});
