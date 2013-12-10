jQuery.extend
  put: (url, data) ->
    this._ujs_ajax('put', url, data)

  delete: (url, data) ->
    this._ujs_ajax('delete', url, data)

  _ujs_ajax: (method, url, data) ->
    if typeof data == "string"
      data += "&_method=#{method}"
    else if typeof data == "object"
      data['_method'] = method

    $.ajax
      url: url
      type: 'post'
      data: data
      dataType: 'script'
