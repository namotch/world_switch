# -*- coding: utf-8 -*-

Plugin.create :world_switch do

  filter_command do |menu|
    Enumerator.new{|y|
      Plugin.filtering(:worlds, y)
    }.each do |world|
      slug = "switch_account_to_#{world.slug}".to_sym
      menu[slug] = {
        slug: slug,
        exec: -> options {},
        plugin: @name,
        name: _('%{title}(%{world}) に切り替える'.freeze) % {
          title: world.title,
          world: world.class.slug
        },
        condition: -> options {Plugin.call(:world_change_current, world)},
        visible: true,
        role: :window } end
    [menu] end

end
