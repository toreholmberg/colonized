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
    $.ajax($.extend({success: @sessionSuccess}, @ajaxProperties, {url: "/current_user"}))

  @login: (email, password) =>
    data = 
      user: 
        email: email
        password: password

    $.ajax($.extend({success: @loginSuccess}, @ajaxProperties, {url: "/users/sign_in", data: JSON.stringify(data)}))

  @sessionSuccess: (data, status, xhr) =>
    @trigger 'change', if data.error then @SESSION_FAILURE else @SESSION_SUCCESS

  @loginSuccess: (data, status, xhr) =>
    @trigger 'change', @SESSION_SUCCESS

  @ajaxError: (xhr, statusText, error) =>
    console.log "Error: #{statusText} #{error}"