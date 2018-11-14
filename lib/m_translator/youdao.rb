module MTranslator
  class Youdao
    # 初始化
    def initialize(from, to, text)
      @url = "http://fanyi.youdao.com/translate_o?smartresult=dict&smartresult=rule"
      @from = from
      @to = to
      @text = text
      @u = "fanyideskweb"
      @c = "ebSeFb%=XZ%T[KZ)c(sy!"
      @f = "#{ctime}"+"#{rand(10 + 1)}"
    end

    def translator
      rep = RestClient.post @url,req_params,req_headers
      JSON.parse(rep.body)
    end

    private

    def req_params
      params = {}
      params["i"] = @text
      params["from"] = @from
      params["to"] = @to
      params["smartresult"] = "dict"
      params["client"] = "fanyideskweb"
      params["salt"] = @f
      params["sign"] = sign
      params["doctype"] = "json"
      params["version"] = "2.1"
      params["keyfrom"] = "fanyi.web"
      params["action"] = "FY_BY_CLICKBUTTION"
      params["typoResult"] = "false"
      params
    end

    def req_headers
      headers = {}
      headers["Cookie"] = "OUTFOX_SEARCH_USER_ID_NCOO=1537643834.9570553; OUTFOX_SEARCH_USER_ID=1799185238@10.169.0.83; fanyi-ad-id=43155; fanyi-ad-closed=1; JSESSIONID=aaaBwRanNsqoobhgvaHmw; _ntes_nnid=07e771bc10603d984c2dc8045a293d30,1525267244050; ___rl__test__cookies=#{ctime}"
      headers["Referer"] = "http://fanyi.youdao.com/"
      headers["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36"
      headers
    end

    # 加密方法
    def sign
      Digest::MD5.hexdigest("#{@u}#{@text}#{@f}#{@c}".encode('utf-8'))
    end

    # 获取当前时间毫秒 保留13位
    def ctime
      (Time.now.to_f * 1000).to_i
    end
  end
end