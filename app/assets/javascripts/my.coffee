# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Info
  APPURL = "http://localhost:3000"

  jQuery ->
    $.get(APPURL + "/api/myinfo", null, (data)=>
      userinfo = $("#userinfo")
      line = "<table><tbody>" +
        "<tr><td>username:</td><td>" + data.username + "</td></tr>" +
        "<tr><td>email:</td><td>" + data.email + "</td></tr>" +
        "</tbody></table>"

      userinfo.append(line)
    )
