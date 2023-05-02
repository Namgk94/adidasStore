const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);
function HandleStoreUserInfo() {
    const inputCheckbox = $(".input-check #store-information");
    inputCheckbox.onclick = () => {
        if (inputCheckbox.checked) {
            inputCheckbox.value = "true";
        } else {
            inputCheckbox.value = "false";
        }
    }
}
HandleStoreUserInfo();
