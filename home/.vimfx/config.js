let {
  commands
} = vimfx.modes.normal;

vimfx.addCommand({
  name: 'tab_new_and_focus_search_bar',
  description: 'Open new tab and focus Search Bar',
  category: 'tabs',
  order: commands.tab_new.order + 1,
}, args => {
  commands.tab_new.run(args);
  commands.focus_search_bar.run(args);
});

vimfx.set('custom.mode.normal.tab_new_and_focus_search_bar', '!');

vimfx.addCommand({
  name: 'goto_tabs',
  description: 'Search tabs',
  category: 'location',
  order: commands.focus_location_bar.order + 1,
}, (args) => {
  commands.focus_location_bar.run(args);
  args.vim.window.gURLBar.value = '% ';
});

vimfx.set('custom.mode.normal.goto_tabs', 'b');
