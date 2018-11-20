module MTranslator
  class Baidu
    def initialize(from,to,text)
      @url = "https://fanyi.baidu.com/v2transapi"
      @from = from
      @to = to
      @text = text
    end

    def translator
      rep = RestClient.post @url,req_params,req_headers
      JSON.parse(rep.body)
    end

    private

    def token(text,gtk)
      f_path = File.join(File.dirname(__FILE__), '../tk/Baidu.js' )
      f = File.read(f_path)
      context = ExecJS.compile(f)
      context.call('token', text,gtk)
    end

    def req_params
      params = {}
      params["from"] = @from
      params["to"] = @to
      params["query"] = @text
      params["transtype"] = "translang"
      params["simple_means_flag"] = "3"
      params["sign"] = token(@text,"320305.131321201")
      params["token"] = "7b35624ba7fe34e692ea909140d9582d"
      params
    end

    def req_headers
      headers = {}
      headers["Cookie"] = "BAIDUID=16FFA1EAAF1A387C647A22DB9FC81DAE:FG=1; BIDUPSID=16FFA1EAAF1A387C647A22DB9FC81DAE; PSTM=1514024118; __cfduid=d2f7fd3a024d1ee90b8a817ddd866d9bc1514812370; REALTIME_TRANS_SWITCH=1; FANYI_WORD_SWITCH=1; HISTORY_SWITCH=1; SOUND_SPD_SWITCH=1; SOUND_PREFER_SWITCH=1; BDUSS=E83bFplYnBRen5hV3FKNDZCM3ZSZldWMVBjV1ZGbW9uTTVwcjFYVDQzTGVFTlJhQVFBQUFBJCQAAAAAAAAAAAEAAADnIjgkcG9obG9ndTQxNTA3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAN6DrFreg6xaS; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; H_PS_PSSID=1429_21103_18559_22075; PSINO=3; locale=zh; Hm_lvt_64ecd82404c51e03dc91cb9e8c025574=1525654866,1525657996,1525658015,1525671031; Hm_lpvt_64ecd82404c51e03dc91cb9e8c025574=1525671031; to_lang_often=%5B%7B%22value%22%3A%22en%22%2C%22text%22%3A%22%u82F1%u8BED%22%7D%2C%7B%22value%22%3A%22zh%22%2C%22text%22%3A%22%u4E2D%u6587%22%7D%5D; from_lang_often=%5B%7B%22value%22%3A%22zh%22%2C%22text%22%3A%22%u4E2D%u6587%22%7D%2C%7B%22value%22%3A%22en%22%2C%22text%22%3A%22%u82F1%u8BED%22%7D%5D"
      headers["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36"
      headers
    end

  end
end