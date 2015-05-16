# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Index
  APPURL = "http://127.0.0.1:3000"
  username = "pyar6329"

  $ ->
    $.get(APPURL + "/user/" + username + '/resumes.json', null, (data)=>

      resumeinfo = $("#resumeinfo")
      console.log(data)

      for i, original of data.original
        console.log("original = " + original.sentence + " i = " + i)
        line = "<h3>Original Resume</h3>" +
          "<table><tbody>" +
          "<tr><td>lang:</td><td>" + original.written_language.code + "</td></tr>" +
          "<tr><td>owner:</td><td>" + original.owner.username + "</td></tr>" +
#          "<tr><td>translator:</td><td>" + original.translator.username + "</td></tr>" +
          "<tr><td>sentence:</td><td>" + original.sentence + "</td></tr>" +
          "</tbody></table>"
        console.log(line)
        resumeinfo.append(line)

      for i, translated of data.translated
        console.log("translated = " + translated.sentence + " i = " + i)
        line = "<h3>Translated Resumes " + i + "</h3>" +
          "<table><tbody>" +
          "<tr><td>lang:</td><td>" + translated.written_language.code + "</td></tr>" +
#          "<tr><td>owner:</td><td>" + translated.owner.username + "</td></tr>" +
          "<tr><td>translator:</td><td>" + translated.translator.username + "</td></tr>" +
          "<tr><td>sentence:</td><td>" + translated.sentence + "</td></tr>" +
          "</tbody></table>"
        console.log(line)
        resumeinfo.append(line)
    )
