
txt_passage = "Were you in love with her?

The question is in a way meaningless, she knows, but one must ask.
Love in such situations is rarely real.
Sex is the engine, exalting and ruining people, sex and frustration.
Love is what people believe is worth the path of devastation.
"

module Txt_filter
  def txt
    if @country == "usa"
      puts txt_passage
    end
    if @country == "the uk"
      puts txt_passage.gsub('o', 'ou')
    end
  end
end
