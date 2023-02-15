function processOrder() {
    var name = document.getElementById("name").value.trim();
    var email = document.getElementById("email").value.trim();
    var creditCard = document.getElementById("credit-card").value.trim();
    var expiryMonth = document.getElementById("expiry-month").value.trim().toUpperCase();
    var expiryYear = document.getElementById("expiry-year").value.trim();
    var itemQuantities = [];
    var donationAmount = 0;
  
    // Validate name and email
    if (name === "" || email === "") {
      displayError("Name and email are required");
      return false;
    }
  
    // Validate credit card number
    if (!validateCreditCardNumber(creditCard)) {
      displayError("Invalid credit card number format (should be xxxx-xxxx-xxxx-xxxx)");
      return false;
    }
  
    // Validate expiry month
    if (!validateExpiryMonth(expiryMonth)) {
      displayError("Invalid expiry month format (should be MMM)");
      return false;
    }
  
    // Validate expiry year
    if (!validateExpiryYear(expiryYear)) {
      displayError("Invalid expiry year format (should be yyyy)");
      return false;
    }
  
    // Validate item quantities and calculate total cost
    var totalCost = 0;
    var atLeastOneItemBought = false;
    for (var i = 1; i <= 5; i++) {
      var itemQuantity = document.getElementById("item" + i + "-quantity").value.trim();
      if (itemQuantity !== "") {
        if (isNaN(itemQuantity)) {
          displayError("Item " + i + " quantity must be a number");
          return false;
        }
        itemQuantities.push(parseInt(itemQuantity));
        atLeastOneItemBought = true;
        totalCost += getItemPrice(i) * parseInt(itemQuantity);
      }
    }
    if (!atLeastOneItemBought) {
      displayError("At least one item must be bought");
      return false;
    }
  
    // Calculate donation amount
    var donationAmountFromCost = totalCost * 0.1;
    if (donationAmountFromCost < 10) {
      donationAmount = 10;
    } else {
      donationAmount = donationAmountFromCost;
    }
  
    // Generate receipt
    var lastFourDigits = creditCard.substring(creditCard.length - 4);
    var receipt = "<h2>Thank you for your purchase!</h2>" +
      "<p><strong>Name:</strong> " + name + "</p>" +
      "<p><strong>Email:</strong> " + email + "</p>" +
      "<p><strong>Credit Card:</strong> ****-****-****-" + lastFourDigits + "</p>" +
      "<p><strong>Items:</strong></p><ul>";
    for (var i = 0; i < itemQuantities.length; i++) {
      var itemNumber = i + 1;
      var itemName = document.getElementById("item" + itemNumber).value;
      var itemQuantity = itemQuantities[i];
      receipt += "<li>" + itemName + " x " + itemQuantity + "</li>";
    }
    receipt += "</ul><p><strong>Total Cost:</strong> $" + totalCost.toFixed(2) + "</p>" +
      "<p><strong>Donation Amount:</strong> $" + donationAmount.toFixed(2) + "</p>";
    document.getElementById("receipt").innerHTML = receipt;
    document.getElementById("receipt").style.display = "block";
  
    return false; // Prevent form submission
}
function validateCreditCardNumber(creditCard) {
    var regex = /^\d{4}-\d{4}-\d{4}-\d{4}$/;
    return regex.test(creditCard);
}
function validateExpiryMonth(expiryMonth) {
    var regex = /^[A-Z]{3}$/;
    return regex.test(expiryMonth);
  }
  
  function validateExpiryYear(expiryYear) {
    var regex = /^\d{4}$/;
    return regex.test(expiryYear);
  }
  
  function getItemPrice(itemNumber) {
    switch (itemNumber) {
      case 1:
        return 10.99;
      case 2:
        return 8.99;
      case 3:
        return 12.99;
      case 4:
        return 5.99;
      case 5:
        return 3.99;
      default:
        return 0;
    }
  }
  
  function displayError(errorMessage) {
    var errorDiv = document.getElementById("error");
    errorDiv.innerHTML += "<p>" + errorMessage + "</p>";
    errorDiv.style.display = "block";
}
