function post (){
  const submit = document.getElementById("myid");
  submit.addEventListener("click", (e) => { 
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", form.action, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const list = document.getElementById("list");
      const formText = document.getElementById("text");
      const item = XHR.response.comment;     
      const html = `
         <p>
         <strong><a href=/user/user_id>${item.user.nickname}</a></strong> ：
         ${item.comment.text}
         </p>`;
      list.insertAdjacentHTML("beforeend", html);
      formText.value = "";
    };
  });
};

window.addEventListener('load', post);
