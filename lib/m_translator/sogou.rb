module MTranslator
  class Sogou
    def initialize(from,to,text)
      @url = "http://fanyi.sogou.com/reventondc/translate"
      @from = from
      @to = to
      @text = text
    end

    def translator
      rep = RestClient.post @url,req_params
      JSON.parse(rep.body)
    end

    private

    def token
      f_path = File.join(File.dirname(__FILE__), '../tk/Sogou.js' )
      f = File.read(f_path)
      context = ExecJS.compile(f)
      context.call('token')
    end

    def req_params
      params = {}
      params["from"] = @from
      params["to"] = @to
      params["client"] = "pc"
      params["fr"] = "browser_pc"
      params["text"] = @text
      params["useDetect"] = "on"
      params["useDetectResult"] = "on"
      params["needQc"] = "1"
      params["uuid"] = token
      params["oxford"] = "on"
      params["isReturnSugg"] = "off"
      params
    end
    
  end
end