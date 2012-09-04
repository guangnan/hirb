# Creates a markdown table for github
class Hirb::Helpers::MarkdownTable < Hirb::Helpers::Table
  CHARS = {
    :top => {:left => '', :center => '', :right => '', :horizontal => '',
      :vertical => {:outside => '|', :inside => ' | '} },
    :middle => {:left => '|', :center => ' | ', :right => ' |', :horizontal => '-'},
    :bottom => {:left => '', :center => '', :right => '', :horizontal => '',
      :vertical => {:outside => '|', :inside => ' | '} }
  }

  def self.render(rows, options={})
    new(rows, options).render
  end

  def render_border(which)
    chars[which][:left] + chars[which][:horizontal] +
      @fields.map {|f| 
        if which == :middle and @options[:align_right] and @options[:align_right].include?(f)
          chars[which][:horizontal] * @field_lengths[f] + ':'
        else
          chars[which][:horizontal] * @field_lengths[f]
        end
      }.
      join(chars[which][:horizontal] + chars[which][:center] + chars[which][:horizontal]) + chars[which][:right]
  end

end
