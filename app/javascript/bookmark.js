function addNewForm() {
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "/bookmarks/new", true);
  xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");

  xhr.onload = function () {
    if (xhr.status === 200) {
      var response = xhr.responseText;
      var newForm = document.createElement("div");
      newForm.innerHTML = response;

      var additionalItems = document.querySelector(".additional-items");
      additionalItems.appendChild(newForm.querySelector(".input-field"));
    }
  };

  xhr.send();
}

function sendFormData(formData) {
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/save-form-data", true);
  xhr.setRequestHeader("Content-Type", "application/json");
  xhr.setRequestHeader("X-CSRF-Token", getCSRFToken());

  function getCSRFToken() {
    var tokenElement = document.querySelector('meta[name="csrf-token"]');
    if (tokenElement) {
      return tokenElement.getAttribute("content");
    }
    return "";
  }

  xhr.onload = function () {
    if (xhr.status === 200) {
      // 保存が成功した場合の処理
      console.log("保存が成功しました");
      window.location.href = "/";
    } else {
      // 保存が失敗した場合の処理
      console.error("保存が失敗しました");
    }
  };

  console.log(JSON.stringify(formData));
  xhr.send(JSON.stringify(formData));
}

// 保存ボタンをクリックしたときのイベントを監視します
document.addEventListener("click", function (event) {
  if (event.target.classList.contains("save-btn")) {
    event.preventDefault();
    saveForm();
  }
});

// フォームの入力値を保存する配列
var formValues = [];

// 保存ボタンをクリックした時の処理
function saveForm() {
  // フォームの入力値を収集し、オブジェクトとして保存
  var formElements = document.querySelectorAll(".input-field");
  var formData = Array.from(formElements).map(function (formElement) {
    var dayInput = formElement.querySelector(
      "[name='bookmark_detail_attributes[day]']"
    );
    var timeInput = formElement.querySelector(
      "[name='bookmark_detail_attributes[time]']"
    );
    var locationInput = formElement.querySelector(
      "[name='bookmark_detail_attributes[location]']"
    );
    var descriptionInput = formElement.querySelector(
      "[name='bookmark_detail_attributes[description]']"
    );

    var bookmarkData = {
      day: dayInput ? dayInput.value : "",
      time: timeInput ? timeInput.value : "",
      location: locationInput ? locationInput.value : "",
      description: descriptionInput ? descriptionInput.value : "",
    };

    console.log("dayInput value:", dayInput ? dayInput.value : "");
    console.log("timeInput value:", timeInput ? timeInput.value : "");
    console.log(
      "locationInput value:",
      locationInput ? locationInput.value : ""
    );
    console.log(
      "descriptionInput value:",
      descriptionInput ? descriptionInput.value : ""
    );

    return {
      bookmark: bookmarkData,
    };
  });

  // 配列に入力値を追加
  formValues = formValues.concat(formData);

  // Ajax リクエストを送信する処理を実装
  sendFormData(formValues);
}

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

function deleteForm(deleteButton) {
  var form = deleteButton.closest(".input-field");
  form.remove();
}
