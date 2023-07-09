document.addEventListener("DOMContentLoaded", function () {
  // 追加ボタンをクリックしたときのイベントを監視します
  document.addEventListener("click", function (event) {
    if (event.target.classList.contains("add-btn")) {
      event.preventDefault();
      addNewForm();
    }
  });

  // 削除ボタンをクリックしたときのイベントを監視します
  document.addEventListener("click", function (event) {
    if (event.target.classList.contains("delete-btn")) {
      event.preventDefault();
      deleteForm(event.target);
    }
  });
});

var formValues = {}; // 入力フォームの値を保持するオブジェクト

function addNewForm() {
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "/bookmarks/new", true);
  xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");

  xhr.onload = function () {
    if (xhr.status === 200) {
      var response = xhr.responseText;
      var newForm = document.createElement("div");
      newForm.innerHTML = response;

      // 入力フォームの値を設定する
      setFormValues(newForm);

      var additionalItems = document.querySelector(".additional-items");
      additionalItems.appendChild(newForm.querySelector(".input-field"));
    }
  };

  xhr.send();
}

function deleteForm(deleteButton) {
  var form = deleteButton.closest(".input-field");
  form.remove();
}

function setFormValues(form) {
  // 入力フォームの各要素を取得し、値を設定する
  var dayInput = form.querySelector("#bookmark_day");
  var currentDate = new Date();
  var year = currentDate.getFullYear();
  var month = (currentDate.getMonth() + 1).toString().padStart(2, "0");
  var day = currentDate.getDate().toString().padStart(2, "0");
  var formattedDate = year + "-" + month + "-" + day;
  dayInput.value = formattedDate;
}

// 初期状態で入力フォームの値を保持する
setFormValues(document);
