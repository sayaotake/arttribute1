require "test_helper"
require "rack/http_streaming_response"

class HttpStreamingResponseTest < Test::Unit::TestCase

  def setup
    host, req = "example.com", Net::HTTP::Get.new("/")
    @response = Rack::HttpStreamingResponse.new(req, host, 443)
    @response.use_ssl = true
  end

  def test_streaming
    # Response status
    assert_equal 200, @response.status
    assert_equal 200, @response.status

    # Headers
    headers = @response.headers

    assert headers.size.positive?

    assert_match %r{text/html; ?charset=utf-8}, headers["content-type"].first.downcase
    assert_equal headers["content-type"], headers["CoNtEnT-TyPe"]
    assert headers["content-length"].first.to_i.positive?

    # Body
    chunks = []
    @response.body.each do |chunk|
      chunks << chunk
    end

    assert chunks.size.positive?
    chunks.each do |chunk|
      assert chunk.is_a?(String)
    end

  end

  def test_to_s
    assert_equal @response.headers["Content-Length"].first.to_i, @response.body.to_s.bytesize
  end

  def test_to_s_called_twice
    body = @response.body
    assert_equal body.to_s, body.to_s
  end

end
