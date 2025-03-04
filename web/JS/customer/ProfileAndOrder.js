/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.addEventListener("DOMContentLoaded", function () {
    $('.nav-link').on('click', function () {
        $('.nav-link').removeClass('active');
        $(this).addClass('active');

        $('.tab-pane').removeClass('show active');
        $($(this).attr('href')).addClass('show active');
    });
});

function changeType(button) {
    var inputElements = document.querySelectorAll(".input_type");
    if (button.id === "edit") {
        button.textContent = "Save";
        button.id = "save";
        inputElements.forEach(x => {
            if (x.name !== "txtUserName" && x.name !== "txtEmail" && x.name !== "password") {
                x.readOnly = false;
                x.classList.add("default_input");
            }
        });
    } else {
        document.getElementById("form-1").submit();
        button.textContent = "Edit";
        button.id = "edit";
        inputElements.forEach(x => {
            x.readOnly = true;
            x.classList.remove("default_input");
        });
    }
}
function loadOrders() {
    fetch('Order')  // Gửi request GET đến OrderServlet
            .then(response => response.text())
            .then(data => {
                document.querySelector('#orders').innerHTML = data;
            })
            .catch(error => console.error('Error:', error));
}

