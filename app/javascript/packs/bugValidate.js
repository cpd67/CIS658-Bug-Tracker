let form = document.getElementById("bugForm");
let errorMessages = document.getElementById("errorMessages");
form.addEventListener('submit', (event) => {
    errorMessages.textContent = '';

    let messages = '';
    let title = document.getElementsByName('bug[title]')[0].value;
    let description = document.getElementsByName('bug[description]')[0].value;

    if(title.length == 0) {
        messages += '<p class="text-danger">Title cannot be empty</p>'
        event.preventDefault();
    }
    if(description.length == 0) {
        messages += '<p class="text-danger">Description cannot be empty</p>'
        event.preventDefault();
    }

    errorMessages.innerHTML = messages;
});