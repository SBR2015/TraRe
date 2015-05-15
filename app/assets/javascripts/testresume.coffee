# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Index
  APPURL = "http://localhost:3000"
  username = "pyar6329"

  $ ->
#  jQuery ->
#    $.get(APPURL + "/user/" + username + '/resumes.json', null, (data)=>
    $.get('http://127.0.0.1:3000/user/pyar6329/resumes.json', null, (data)=>

      resumeinfo = $("#resumeinfo")
      line = "<table><tbody>" +
        "<tr><td>sentence:</td><td>" + original.sentence + "</td></tr>" +
        "<tr><td>language_id:</td><td>" + original.language_id + "</td></tr>" +
        "</tbody></table>"

      resumeinfo.append(line)
    )
