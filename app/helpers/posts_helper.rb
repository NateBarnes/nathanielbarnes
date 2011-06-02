module PostsHelper
  def diff_last_word_class to_parse, first_class, second_class
    str_ar = to_parse.split
    last = str_ar.pop
    return %{<strong class="#{first_class}">#{str_ar.join(" ")}</strong> <strong class="#{second_class}">#{last}</strong>}
  end
end
