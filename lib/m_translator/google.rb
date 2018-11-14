module MTranslator
  class Google
    def initialize(from,to,text)
      @url = "https://translate.google.cn/translate_a/single"
      @from = from
      @to = to
      @text = text
    end

    def translator
      rep = RestClient.get "#{@url}?#{req_params}"
      JSON.parse(rep.body)
    end

    private
    def token(text)
      f_path = File.join(File.dirname(__FILE__), '../tk/Google.js' )
      f = File.read(f_path)
      context = ExecJS.compile(f)
      context.call('token', text)
    end

    def req_params
      params = {}
      params["client"] = "t"
      params["sl"] = @from
      params["tl"] = @to
      params["hl"] = "zh-CN"
      params["dt"] = "t"
      params["ie"] = "UTF-8"
      params["oe"] = "UTF-8"
      params["source"] = "btn"
      params["ssel"] = 0
      params["tsel"] = 0
      params["kc"] = 0
      params["tk"] = token(@text)
      params["q"] = @text
      params.to_query
    end
  end
end