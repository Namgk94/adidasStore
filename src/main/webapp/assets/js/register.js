function HandleInputRadioGender() {
    const radioGender = document.querySelectorAll('.gender input[name="gender"]');
    const valueGender = document.querySelector('.gender input[name="valueGender_user"]');
    radioGender.forEach((item) => {
        item.onchange = () => {
            valueGender.value = item.value;
            console.log(valueGender.value);

        };
    });
}
HandleInputRadioGender();

