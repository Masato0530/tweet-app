function post (){
  const submit = document.getElementById("myid");
  submit.addEventListener("click", () => {
    const form = document.getElementById("comment_text");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/tweet_comments", true);
    XHR.responseType = "json";
    XHR.send(formData);
    console.log("ok")
  });
};

window.addEventListener('load', post);
