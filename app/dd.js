async function createFinanceChargesDiary(executionDate) {
    var myHeaders = {
        "Content-type": "application/json;charset=UTF-8",
        Authorization: "API Key",
        "api-key": "06f8a8bb-fa7f-49bd-b664-08c29073730a"
    };

    var requestOptions = {
        method: "POST",
        headers: myHeaders,
        redirect: "follow"
    };

    const year = executionDate.getFullYear();
    const month = String(executionDate.getMonth() + 1).padStart(2, "0");
    const day = String(executionDate.getDate()).padStart(2, "0");
    const formattedDate = `${year}-${month}-${day}`;

    await fetch(+formattedDate, requestOptions)
        .then((response) => response.text())
        .then((result) => console.log(result))
        .catch((error) => console.log("error", error));
}