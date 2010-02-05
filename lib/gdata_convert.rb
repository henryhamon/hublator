require 'gdata'
require 'yaml'
require 'redcloth'

#not done yet
#TODO
#improve page parser

module GDataConvert
  class Document

    def initialize(file_name, file, mime_type)
      @file = file
      @mime_type = mime_type
      @feed = 'http://docs.google.com/feeds/documents/private/full'
@entry = <<EOF
<?xml version='1.0' encoding='UTF-8'?>
<atom:entry xmlns:atom="http://www.w3.org/2005/Atom">
<atom:category scheme="http://schemas.google.com/g/2005#kind"
term="http://schemas.google.com/docs/2007#document" label="document"/>
<atom:title>hublator</atom:title>
</atom:entry>
EOF
    end

    def pages
      auth = authenticate
      xml = auth.post_file(@feed, @file, @mime_type, @entry).to_xml
      doc = get_text(xml.elements['content'].attribute('src'), auth)
      doc
    end

    private
    def get_text(url, doc)
      file = doc.get("#{url}&exportFormat=txt")

      pages = []
      page = ''
      word_count = 0

      file.body.each_line do |l|
        word_count += l.scan(/\w+/).size
        page += RedCloth.new(l).to_html
        if word_count > 250
          pages << page
          page = ''
          word_count = 0
        end
      end
      pages << page
    end

    def authenticate
      config = account_config
      auth = GData::Client::DocList.new
      auth.source = 'hublator'
      auth.clientlogin(config['user'], config['pass'])
      auth
    end

    def account_config

      YAML.load(File.read(RAILS_ROOT + "/config/gdata.yml"))
    end

  end
end

