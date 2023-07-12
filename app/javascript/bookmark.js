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

  xhr.send(JSON.stringify(formData));
}

// 保存ボタンをクリックしたときのイベントを監視します
document.addEventListener("click", function (event) {
  if (event.target.classList.contains("save-btn")) {
    event.preventDefault();
    saveForm();
  }
});

// 保存ボタンをクリックした時の処理
function saveForm() {
  // フォームの入力値を収集し、オブジェクトとして保存
  var formElements = document.querySelectorAll(".input-field");
  var formData = [];

  formElements.forEach(function (formElement) {
    var dayInput = formElement.querySelector(".day-input");
    var timeInput = formElement.querySelector(".time-input");
    var locationInput = formElement.querySelector(".location-input");
    var descriptionInput = formElement.querySelector(".description-input");
    var destinationInput = formElement.querySelector(".destination-input");
    var departureDateInput = formElement.querySelector(".departure-date-input");
    var returnDateInput = formElement.querySelector(".return-date-input");
    var membersInput = formElement.querySelector(".members-input");
    var nameInput = formElement.querySelector(".name-input");

    var bookmarkData = {
      day: dayInput ? dayInput.value : "",
      time: timeInput ? timeInput.value : "",
      location: locationInput ? locationInput.value : "",
      description: descriptionInput ? descriptionInput.value : "",
      destination: destinationInput ? destinationInput.value : "",
      departure_date: departureDateInput ? departureDateInput.value : "",
      return_date: returnDateInput ? returnDateInput.value : "",
      members: membersInput ? membersInput.value : "",
      name: nameInput ? nameInput.value : "",
    };

    formData.push(bookmarkData);
  });
  formData = [Object.assign({}, ...formData)];
  console.log("formData:", formData);

  // Ajax リクエストを送信する処理を実装
  sendFormData(formData);
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
