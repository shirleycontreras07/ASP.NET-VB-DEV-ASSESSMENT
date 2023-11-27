function FormValidation(button) {
    let valid = false;
    let validName = false;
    let validPhoneNumber = true;
    let validEmployeeType = false;

    let regName = /^[a-zA-Z]+$/;
    let regPhone = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
    let firstName = document.getElementById('MainContent_TextBoxFirstName').value ?? alert('Required first name.');
    let secondName = document.getElementById('MainContent_TextBoxSecondName').value ?? alert('Required second name.');
    let phoneNumber = document.getElementById('MainContent_TextBoxPhoneNumber').value ?? "";
    let employeeType = document.getElementById('MainContent_DropDownEmployeeType').value;

    if (!regName.test(firstName) || !regName.test(secondName)) {
        alert('Invalid name given.');
        validName = false;
    } else {
        validName = true;
    }

    if (phoneNumber.length > 0) {
        if (!regPhone.test(phoneNumber)) {
            alert('Invalid phonenumber given.');
            validPhoneNumber = false;
        } else {
            validPhoneNumber = true;
        }
    }
    if (employeeType == '0') {
        alert('Invalid employee type given.');
        validEmployeeType = false;
    } else {
        validEmployeeType = true;
    }

    valid = validName && validPhoneNumber && validEmployeeType;

    if (valid) {
        __doPostBack(button, true);
    }
}