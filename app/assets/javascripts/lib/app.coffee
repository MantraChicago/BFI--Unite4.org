class Application.App extends Backbone.Events
  constructor: (@options={})->
    _.extend(@, @options)

    @setupViewport()

  setupViewport: ()->
    metaQuery.onBreakpointChange 'small', @onSmallBreakpoint

    metaQuery.onBreakpointChange 'medium', @onMediumBreakpoint

    metaQuery.onBreakpointChange 'large', @onLargeBreakpoint

    @viewport =
      isLarge: ()->
        Modernizr.mq('(min-width: 768px)')

      isMedium: ()->
        Modernizr.mq('(max-width: 768px)')

      isSmall: ()->
        Modernizr.mq('(max-width: 420px)')

  # Use the controller name, and action name properties
  # stored on the body element, to delegate to a specific
  # controller / action function on the Application object.
  #
  # e.g.
  #
  # Will run on the causes show action only:
  #
  # Application.causes.show = ()->
  #
  # Will run on every causes controller page:
  #
  # Application.causes = ()->
  initializePage: ()->
    controllerSpecific = Application[@controller]
    actionSpecific = Application[@controller]?[@action]

    controllerSpecific?.call(window)
    actionSpecific?.call(window)

  onSmallBreakpoint: (match)->

  onLargeBreakpoint: (match)->

  onMediumBreakpoint: (match)->
