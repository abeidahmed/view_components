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

  def test_renders_component_class_based_on_avatar_count
    render_inline(Primer::AvatarStackComponent.new(count: 2)) do |c|
      c.body {}
      c.avatar(src: "foo", alt: "bar")
      c.avatar(src: "foo", alt: "bar")
    end

    assert_selector("div.AvatarStack.AvatarStack--two")

    render_inline(Primer::AvatarStackComponent.new(count: 4)) do |c|
      c.body {}
      c.avatar(src: "foo", alt: "bar")
      c.avatar(src: "foo", alt: "bar")
      c.avatar(src: "foo", alt: "bar")
      c.avatar(src: "foo", alt: "bar")
    end

    assert_selector("div.AvatarStack.AvatarStack--three-plus")
  end

  def test_renders_avatar_more_class
    render_inline(Primer::AvatarStackComponent.new(count: 4)) do |c|
      c.body {}
      c.avatar(src: "foo", alt: "bar")
      c.avatar(src: "foo", alt: "bar")
      c.avatar(src: "foo", alt: "bar")
      c.avatar(src: "foo", alt: "bar")
    end

    assert_selector("div.avatar.avatar-more")
  end

  def test_does_not_render_avatar_more_class
    render_inline(Primer::AvatarStackComponent.new(count: 2)) do |c|
      c.body {}
      c.avatar(src: "foo", alt: "bar")
      c.avatar(src: "foo", alt: "bar")
    end

    refute_selector("div.avatar.avatar-more")
  end
end
