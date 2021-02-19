// for phoenix_html support, including form and button helpers
// copy the following scripts into your javascript bundle:
// * deps/phoenix_html/priv/static/phoenix_html.js


function enable_inputs() {
    let elems = document.getElementsByClassName("account-input");
    for (let i = 0; i < elems.length; ++i)
        elems[i].removeAttribute("disabled");
    document.getElementById("btn-save").removeAttribute("disabled");
    document.getElementById("btn-edit").setAttribute("disabled");
}
function show_account(account) {
    document.querySelector('#account_id').setAttribute("value", account.id);
    document.querySelector('#account_url').setAttribute("value", account.url);
    document.querySelector('#account_title').setAttribute("value", account.title);
    document.querySelector('#account_user').setAttribute("value", account.username);
    document.querySelector('#account_id').setAttribute("value", account.id);
    document.querySelector('#account_password').setAttribute("value", account.password);
    document.querySelector('#account_notes').setAttribute("value", account.notes);
    document.querySelector('#account_other').setAttribute("value", account.other);
}

