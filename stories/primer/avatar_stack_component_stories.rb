# frozen_string_literal: true

class Primer::AvatarStackComponentStories < ViewComponent::Storybook::Stories
  layout "storybook_preview"

  story(:avatar_stack_1) do
    content do |component|
      component.body {}
      component.avatar(src: "https://github.com/github.png", alt: "github")
    end
  end

  story(:avatar_stack_2) do
    content do |component|
      component.body {}
      component.avatar(src: "https://github.com/github.png", alt: "github")
      component.avatar(src: "https://github.com/github.png", alt: "github")
    end
  end

  story(:avatar_stack_3) do
    content do |component|
      component.body {}
      component.avatar(src: "https://github.com/github.png", alt: "github")
      component.avatar(src: "https://github.com/github.png", alt: "github")
      component.avatar(src: "https://github.com/github.png", alt: "github")
    end
  end

  story(:avatar_stack_more) do
    content do |component|
      component.body {}
      component.avatar(src: "https://github.com/github.png", alt: "github")
      component.avatar(src: "https://github.com/github.png", alt: "github")
      component.avatar(src: "https://github.com/github.png", alt: "github")
      component.avatar(src: "https://github.com/github.png", alt: "github")
      component.avatar(src: "https://github.com/github.png", alt: "github")
      component.avatar(src: "https://github.com/github.png", alt: "github")
    end
  end
end
