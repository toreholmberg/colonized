class App.Session extends Spine.Controller
  @extend Spine.Events

  @SESSION_FAILURE = 'App.Session.Failure'
  @SESSION_SUCCESS = 'App.Session.Success'

  @ajaxProperties =
    xhrFields:
      withCredentials: true
    contentType: 'application/json'
    dataType: 'json'
    processData: false
    headers: {'X-Requested-With': 'XMLHttpRequest'}
    type: "POST"
    error: @ajaxError
    success: @ajaxSuccess
    statusCode:
      401: => @trigger 'change', @SESSION_FAILURE

  @checkSession: =>

    opts = $.extend {}, @ajaxProperties,
      success: @sessionSuccess
      url: "/current_user"

    $.ajax opts

  @login: (email, password) =>
    
    data =
      user:
        email: email
        password: password

    opts = $.extend {}, @ajaxProperties,
      success: @loginSuccess
      url: "/users/sign_in"
      data: JSON.stringify data

    $.ajax opts

  @logout: =>

    opts = $.extend {}, @ajaxProperties,
      complete: @logoutComplete
      type: "DELETE"
      url: "/users/sign_out"

    $.ajax opts

  @sessionSuccess: (data, status, xhr) =>
    @trigger 'change', if data.error then @SESSION_FAILURE else @SESSION_SUCCESS
    App.User.currentUserId = data.user.id unless data.error

  @loginSuccess: (data, status, xhr) =>
    @trigger 'change', @SESSION_SUCCESS

  @logoutComplete: (jqXHR, textStatus) =>
    @trigger 'change', @SESSION_FAILURE

  @ajaxError: (xhr, statusText, error) =>
    console.log "Error: #{statusText} #{error}"

  className: 'session'

  elements:
    '#email': 'email'
    '#password': 'password'

  events:
    'submit form': 'submit'

  constructor: ->
    super
    @render()

  render: =>
    @html @view('login')()

  submit: (e) =>
    e.stopPropagation()
    e.preventDefault()
    App.Session.login @email.val(), @password.val()