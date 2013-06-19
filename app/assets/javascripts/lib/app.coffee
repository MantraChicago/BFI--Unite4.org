class Application.App extends Backbone.Events
  constructor: (@options={})->
    _.extend(@, @options)

    @setupViewport()

  # Allows you to get a reference to a single collection
  # by saying App.collection('causes').  This will route
  # all requests through the collection manager, so you can
  # ensure you're getting access to the authoritative client side
  # collection for that resource.
  collection: (name, models, options)->
    Application.collection(name, models, options)

  setupViewport: ()->
    metaQuery.onBreakpointChange 'small', ()=>
      @onSmallBreakpoint?.apply(@, arguments)

    metaQuery.onBreakpointChange 'medium', ()=>
      @onMediumBreakpoint?.apply(@, arguments)

    metaQuery.onBreakpointChange 'large', ()=>
      @onLargeBreakpoint?.apply(@, arguments)

    metaQuery.onBreakpointChange 'portrait', ()=>
      @onOrientationChange?.apply(@, arguments)

    metaQuery.onBreakpointChange 'landscape', ()=>
      @onOrientationChange?.apply(@, arguments)

    @viewport =
      isPortrait: ()->
        $('html').is(".breakpoint-portrait")

      isLandscape: ()->
        $('html').is(".breakpoint-landscape")

      isLarge: ()->
        $('html').is(".breakpoint-large")

      isMedium: ()->
        $('html').is(".breakpoint-medium")

      isSmall: ()->
        $('html').is(".breakpoint-small")

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

  # Viewport Sizing Change Events
  #
  # Just to demonstrate where you can hook into changes like this.
  # It is a really bad sign if you need these, but they're good development helpers
  onOrientationChange: (match)->

  onSmallBreakpoint: (match)->

  onLargeBreakpoint: (match)->

  onMediumBreakpoint: (match)->
