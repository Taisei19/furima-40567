window.addEventListener('DOMContentLoaded', (event) => {
  const priceInput = document.getElementById("item-price");
  const addTaxPriceOutput = document.getElementById('add-tax-price'); 
  const profitOutput = document.getElementById('profit'); 

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxPrice = Math.floor(inputValue * 0.1); 
    const profit = Math.floor(inputValue * 0.9); 

    addTaxPriceOutput.innerHTML = addTaxPrice; 
    profitOutput.innerHTML = profit; 
  });
});