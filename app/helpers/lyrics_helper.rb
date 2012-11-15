module LyricsHelper
  # Every word in +lyric+ gets its own HTML element.
  def build_granular_lyric_for(lyric)
    clickable_lyric = with_each_line_in lyric do |line|
      with_each_word_in(line) { |word|
        content_tag('span', word, class: 'lyric_word')
      }
    end

    simple_format(clickable_lyric)
  end

  # @param [String] text
  # @return [String]
  def with_each_line_in(text)
    return text unless block_given?
    text.each_line.map { |line| yield line }.join("\n")
  end

  # @param [String] line
  # @return [String]
  def with_each_word_in(line)
    return line unless block_given?
    line.split(' ').map { |word| yield word }.join(' ')
  end
end
