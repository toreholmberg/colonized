class App.Main extends Spine.Stack

  controllers:
    groups: App.Groups

  routes:
    '/groups': 'groups'

  default: 'groups'
  className: 'stack main'