export default async function (url, payload = null, action = "GET", target) {
  const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
  let request = {
    method: action,
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": csrfToken,
    },
  };

  if (action !== "GET") {
    request.body = JSON.stringify(payload);
  }

  fetch(url, request)
    .then((response) => response.text())
    .then((data) => {
      target.innerHTML = data;
    })
    .catch((error) => {
      console.error("Error fetching:", error);
    });
}
