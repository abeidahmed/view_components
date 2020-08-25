# frozen_string_literal: true

require "test_helper"

class Primer::ProgressBarComponentTest < Minitest::Test
  include Primer::ComponentTestHelpers

  def test_does_not_render_if_no_items_provided
    render_inline(Primer::ProgressBarComponent.new)

    refute_component_rendered
  end

  def test_renders_empty_bar_if_percentage_is_not_provided
    render_inline(Primer::ProgressBarComponent.new) do |component|
      component.slot(:item)
    end

    assert_selector("span.Progress .Progress-item")
  end

  def test_renders_large_option
    render_inline(Primer::ProgressBarComponent.new(size: :large)) do |component|
      component.slot(:item, percentage: 80)
    end

    assert_selector("span.Progress--large.Progress")
  end

  def test_renders_default_when_invalid_size_arg_passed
    without_fetch_or_fallback_raises do
      render_inline(Primer::ProgressBarComponent.new(size: "kittens")) do |component|
        component.slot(:item)
      end

      assert_selector("span.Progress")
    end
  end

  def test_renders_percent_completed_progress
    render_inline(Primer::ProgressBarComponent.new) do |component|
      component.slot(:item, percentage: 80)
    end

    assert_selector("[style='width: 80%;']")
  end

  def test_renders_background_colors
    render_inline(Primer::ProgressBarComponent.new) do |component|
      component.slot(:item, bg: :red)
    end

    assert_selector("span.Progress .Progress-item.bg-red")
  end

  def test_renders_non_standard_background_colors
    render_inline(Primer::ProgressBarComponent.new) do |component|
      component.slot(:item, bg: :yellow_8)
    end

    assert_selector("span.Progress .Progress-item.bg-yellow-8")
  end

  def test_allows_inline_styles_on_slots
    render_inline(Primer::ProgressBarComponent.new) do |component|
      component.slot(:item, bg: :blue, style: "transition: width .2s ease-out;")
    end
    assert_selector("[style='transition: width .2s ease-out;']")
  end
end
