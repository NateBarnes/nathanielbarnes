module PostsHelper
  def diff_last_word_class to_parse, first_class, second_class
    str_ar = to_parse.split
    last = str_ar.pop
    return %{<em class="#{first_class}">#{str_ar.join(" ")}</em> <strong class="#{second_class}">#{last}</strong>}
  end
end
