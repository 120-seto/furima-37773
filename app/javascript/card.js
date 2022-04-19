const pay = () => {
  Payjp.setPublicKey("pk_test_fb40e5095e827106e084327c"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("charge-form");
  submit.addEventListener("submit", (e) => {
    e.preventDefault();

const formResult = document.getElementById("charge-form");
const formData = new FormData(formResult);

const card = {
  number: formData.get("card[number]"),
  cvc: formData.get("card[cvc]"),
  exp_month: formData.get("card[exp_month]"),
  exp_year: `20${formData.get("card[exp_year]")}`,
};

Payjp.createToken(card, (status, response) => {
  if (status == 200) {
    const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
  }
  document.getElementById("card_number").removeAttribute("name");
  document.getElementById("card_cvc").removeAttribute("name");
  document.getElementById("card_exp_month").removeAttribute("name");
  document.getElementById("card_exp_year").removeAttribute("name");

  document.getElementById("charge-form").submit();
});
});
};

window.addEventListener("load", pay);