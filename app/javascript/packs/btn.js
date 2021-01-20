window.addEventListener('load', function(){

  const shareLinkTwitter = document.getElementById("share_link_twitter")

  shareLinkTwitter.addEventListener('mouseover', function(){
    shareLinkTwitter.setAttribute("style", "background-color:#668ad8")
  })

  shareLinkTwitter.addEventListener('mouseout', function(){
    shareLinkTwitter.removeAttribute("style", "background-color:#FFBEDA;")
  })

  const inputBtn = document.getElementById("input-btn")

  inputBtn.addEventListener('mouseover', function(){
    inputBtn.setAttribute("style", "background-color:#fac9c9")
  })

  inputBtn.addEventListener('mouseout', function(){
    inputBtn.removeAttribute("style", "background-color:#FFBEDA;")
  })

  const searchBtn = document.getElementById("search-btn")

  searchBtn.addEventListener('mouseover', function(){
    searchBtn.setAttribute("style", "background-color:#fac9c9;")
  })

  searchBtn.addEventListener('mouseout', function(){
    searchBtn.removeAttribute("style", "background-color:#FFBEDA;")
  })

})