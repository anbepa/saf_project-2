import fetch from "node-fetch";
import https from "https"; // Importa el módulo https

const agent = new https.Agent({
  rejectUnauthorized: false, // Ignora los certificados autofirmados
});

const initialDate = new Date(2026, 0, 20);
const finalDate = new Date(2026, 0, 20);
const paramObligationId = "610234"; // opcional 
const clientId = ""; // opcional
const ambiente = "qa"; //local, dev, qa
const type = ""

for (
  let currentDate = initialDate;
  currentDate <= finalDate;
  currentDate.setDate(currentDate.getDate() + 1)
) {
  await createFinanceChargesDiary(currentDate);
}

async function createFinanceChargesDiary(executionDate) {
  var myHeaders;
  var url;

  if (ambiente === "qa") {
    myHeaders = {
      "Content-type": "application/json;charset=UTF-8",
      "Authorization": "API Key",
      "api-key": "e19554b1-8c29-4e36-97b2-c3410e0ef573",
      "Postman-Token": "<calculated when request is sent>",
      "User-Agent": "PostmanRuntime/7.34.0",
    };
    if (type === "lt") {
      url = "https://financiacion-int-qa.apps.ambientesbc.com/saf/finance-charge/api/finance-charges/daily/invoice-lt?";
    } else {
      url = "https://financiacion-int-qa.apps.ambientesbc.com/saf/finance-charge/api/finance-charges/daily?";
    }
  } else if (ambiente === "dev") {
    myHeaders = {
      "Content-type": "application/json;charset=UTF-8",
      Authorization: "API Key",
      "api-key": "06f8a8bb-fa7f-49bd-b664-08c29073730a",
    };
    url = "http://financiacion-int-dev.apps.ambientesbc.com/saf/obligation/api/finance-charges?";
  } else if (ambiente === "local") {
    myHeaders = {
      "Content-type": "application/json;charset=UTF-8",
      Authorization: "API Key",
      "api-key": "06f8a8bb-fa7f-49bd-b664-08c29073730a",
    };
    url = "http://localhost:8082/api/finance-charges?";
  } else {
    throw new Error("Ambiente incorrecto");
  }

  const year = executionDate.getFullYear();
  const month = String(executionDate.getMonth() + 1).padStart(2, "0");
  const day = String(executionDate.getDate()).padStart(2, "0");
  const formattedDate = `${year}-${month}-${day}`;

  if (paramObligationId.trim().length > 0) {
    url = url + "id=" + paramObligationId + "&";
  }

  if (clientId.trim().length > 0) {
    url = url + "client=" + clientId + "&";
  }

  url = url + "executionDate=" + formattedDate;

  var requestOptions = {
    method: "POST",
    headers: myHeaders,
    redirect: "follow",
    agent, // Añade el agente a la configuración de la solicitud
  };

  console.log(url);

  // Implementa un bucle de reintentos
  const maxRetries = 3; // Número máximo de reintentos
  let attempts = 0;
  let success = false;

  while (attempts < maxRetries && !success) {
    try {
      const response = await fetch(url, requestOptions);
      if (response.status === 500) {
        throw new Error("Error 500: Internal Server Error");
      }
      const result = await response.text();
      console.log(result);
      success = true; // Marca la operación como exitosa
    } catch (error) {
      console.log(`Intento ${attempts + 1} fallido: ${error.message}`);
      attempts++;
      if (attempts < maxRetries) {
        console.log("Reintentando...");
        await new Promise((resolve) => setTimeout(resolve, 2000)); // Espera 2 segundos antes de reintentar
      } else {
        console.log("Máximo de reintentos alcanzado. Abortando.");
      }
    }
  }
}
