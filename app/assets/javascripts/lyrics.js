// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// I know, I know, this code is ugly. Can't do anything with it now. No effin
// clue what to do!

$(document).ready(function() {
	$('html').click(function() {
		var selectedWords = $('.selected_word');
		selectedWords.removeClass('selected_word');
		selectedWords.removeAttr('id');
	});

	$('span.lyric_word').click(function(e) {
		e.stopPropagation();

		var $this = $(this),
		    $allWords = $('#lyric p span.lyric_word'),
		    $openWord = $('#open_word'),
		    $closeWord = $('#close_word'),
		    thisIndex = $allWords.index($this),
		    openWordIndex = $allWords.index($openWord),
		    closeWordIndex = $allWords.index($closeWord);

		if ($this.hasClass('selected_word')) {
			var $selectedWords = $('.selected_word'),
			    $lyric = $('#lyric'),
			    lyric_id = $lyric.data('lyric-id');

			var text = $selectedWords.map(function() {
				return $(this).text();
			}).toArray().join(' ');

			var params = $.param({
				text: text,
				lyric_id: lyric_id
			});

			// appendTo is needed for dumb Firefox. Otherwise the
			// click() won't affect.
			$('<a>', { href: 'foo' }).appendTo($('body'))[0].click();
			//$('<a>', { href: '/lines/new?'+params }).appendTo($('body'))[0].click();
		}
		else {
			if ($openWord.length) {
				var selectedWords;
				// Left to right or right to left selection?
				var ltrSelection = thisIndex > openWordIndex;
				// Left to right or right to left selection expansion?
				var ltrExpansion = closeWordIndex > openWordIndex;

				if (ltrSelection) {
					selectedWords = $allWords.slice(openWordIndex, thisIndex + 1);

					if (ltrExpansion) {
						$closeWord.removeAttr('id');
						$this.attr('id', 'close_word');
					}
					else {
						if ($closeWord.length) {
							$openWord.removeAttr('id');
							$this.attr('id', 'open_word');
						}
						else {
							$this.attr('id', 'close_word');
						}
					}
				}
				else {
					selectedWords = $allWords.slice(thisIndex, openWordIndex + 1);

					if (ltrExpansion) {
						$openWord.removeAttr('id');
						$this.attr('id', 'open_word');
					}
					else {
						$closeWord.removeAttr('id');
						$this.attr('id', 'close_word');
					}
				}

				selectedWords.addClass('selected_word');
			}
			else {
				$this.addClass('selected_word');
				$this.attr('id', 'open_word');
			}

		}
	});
});
