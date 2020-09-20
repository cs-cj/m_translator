module MTranslator
  class Baidu
    def initialize(from,to,text)
      @url = "https://fanyi.baidu.com/v2transapi"
      @from = from
      @to = to
      p @text = CGI::unescape(text)
    end

    def translator
      rep = RestClient.post @url,req_params,req_headers
      JSON.parse(rep.body)
    end

    private

    def get_sign(text)
      f_path = File.join(File.dirname(__FILE__), '../tk/Baidu.js' )
      f = File.read(f_path)
      context = ExecJS.compile(f)
      context.call('e', text)
    end

    def req_params
      params = {}
      params["from"] = @from
      params["to"] = @to
      params["query"] = @text
      params["transtype"] = "translang"
      params["simple_means_flag"] = "3"
      params["sign"] = get_sign(@text)
      params["token"] = "372a653a84ba137c63c4d87461d5736e"
      params
    end

    def req_headers
      headers = {}
      # headers["Cookie"] = "BAIDUID=16FFA1EAAF1A387C647A22DB9FC81DAE:FG=1; BIDUPSID=16FFA1EAAF1A387C647A22DB9FC81DAE; PSTM=1514024118; __cfduid=d2f7fd3a024d1ee90b8a817ddd866d9bc1514812370; REALTIME_TRANS_SWITCH=1; FANYI_WORD_SWITCH=1; HISTORY_SWITCH=1; SOUND_SPD_SWITCH=1; SOUND_PREFER_SWITCH=1; BDUSS=E83bFplYnBRen5hV3FKNDZCM3ZSZldWMVBjV1ZGbW9uTTVwcjFYVDQzTGVFTlJhQVFBQUFBJCQAAAAAAAAAAAEAAADnIjgkcG9obG9ndTQxNTA3AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAN6DrFreg6xaS; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; H_PS_PSSID=1429_21103_18559_22075; PSINO=3; locale=zh; Hm_lvt_64ecd82404c51e03dc91cb9e8c025574=1525654866,1525657996,1525658015,1525671031; Hm_lpvt_64ecd82404c51e03dc91cb9e8c025574=1525671031; to_lang_often=%5B%7B%22value%22%3A%22en%22%2C%22text%22%3A%22%u82F1%u8BED%22%7D%2C%7B%22value%22%3A%22zh%22%2C%22text%22%3A%22%u4E2D%u6587%22%7D%5D; from_lang_often=%5B%7B%22value%22%3A%22zh%22%2C%22text%22%3A%22%u4E2D%u6587%22%7D%2C%7B%22value%22%3A%22en%22%2C%22text%22%3A%22%u82F1%u8BED%22%7D%5D"
      headers["Cookie"] = "BIDUPSID=D3290C65C03AEF0E98D97B8641DFFB15; PSTM=1570785944; REALTIME_TRANS_SWITCH=1; FANYI_WORD_SWITCH=1; HISTORY_SWITCH=1; SOUND_SPD_SWITCH=1; SOUND_PREFER_SWITCH=1; BAIDUID=0CC6F13854E81A68D3C564D36E7C8A03:FG=1; APPGUIDE_8_2_2=1; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; BDSFRCVID=wt_OJeC626EDLgju-c_JbHce7gSxbKcTH6aoxbIy4_AgXmAxrp74EG0PJf8g0Ku-dWitogKKBmOTHg-F_2uxOjjg8UtVJeC6EG0Ptf8g0M5; H_BDCLCKID_SF=JJkO_D_atKvjDbTnMITHh-F-5fIX5-RLf5TuLPOF5lOTJh0RbtOkjnQD-UL82bT2fRcQ0tJLb4DaStJbLjbke6cbDa_fJ5Fs-I5O0R4854QqqR5R5bOq-PvHhxoJqbbJX2OZ0l8KtDQpshRTMR_V-p4p-472K6bML5baabOmWIQHDPnPyJuMBU_sWMcChnjjJbn4KKJxWJLWeIJo5Dcf3PF3hUJiBMjLBan7056IXKohJh7FM4tW3J0ZyxomtfQxtNRJ0DnjtpChbRO4-TF-D5jXeMK; delPer=0; PSINO=2; H_PS_PSSID=1435_21104_18560_26350; Hm_lvt_64ecd82404c51e03dc91cb9e8c025574=1580216234,1580216243,1580458514,1580458537; Hm_lpvt_64ecd82404c51e03dc91cb9e8c025574=1580458539; __yjsv5_shitong=1.0_7_ed303110bee0e644d4985049ba8a5cd1f28d_300_1580458537306_120.10.109.208_66a3b40c; yjs_js_security_passport=630340c0505f771135167fa6df3e5215699dcf0b_1580458538_js; to_lang_often=%5B%7B%22value%22%3A%22zh%22%2C%22text%22%3A%22%u4E2D%u6587%22%7D%2C%7B%22value%22%3A%22en%22%2C%22text%22%3A%22%u82F1%u8BED%22%7D%5D; from_lang_often=%5B%7B%22value%22%3A%22vie%22%2C%22text%22%3A%22%u8D8A%u5357%u8BED%22%7D%2C%7B%22value%22%3A%22en%22%2C%22text%22%3A%22%u82F1%u8BED%22%7D%2C%7B%22value%22%3A%22zh%22%2C%22text%22%3A%22%u4E2D%u6587%22%7D%5D"
      headers["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36"
      headers
    end

  end
end