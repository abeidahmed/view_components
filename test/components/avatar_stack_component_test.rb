# frozen_string_literal: true

require "test_helper"

class PrimerAvatarStackComponentTest < Minitest::Test
  include Primer::ComponentTestHelpers

  def test_does_not_render_empty_component
    render_inline(Primer::AvatarStackComponent.new)

    refute_selector("div.AvatarStack")
    refute_selector("div.AvatarStack-body")
    refute_selector("img.avatar")
  end

  def test_renders_avatars
    render_inline(Primer::AvatarStackComponent.new) do |c|
      c.body {}
      c.avatar(src: "foo", alt: "bar")
    end

    assert_selector("div.AvatarStack-body") do
      assert_selector("img.avatar[src=\"foo\"][alt=\"bar\"]")
    end
  end
end
