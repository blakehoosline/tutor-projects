function validateDate(dateString, formatString) {
    // Split the date string into its component parts based on the format string
    let formatParts = formatString.split(/[-\/\.]/);
    let dateParts = dateString.split(/[-\/\.]/);
    
    // Check if the format string and date string have the same number of parts
    if (formatParts.length !== dateParts.length) {
        return false;
    }
    
    let month, day, year;
    for (let i = 0; i < formatParts.length; i++) {
        let formatPart = formatParts[i];
        let datePart = dateParts[i];
        
        // Check if the date part is a valid number
        if (isNaN(datePart)) {
        return false;
        }
        
        switch (formatPart) {
        case 'M':
            month = parseInt(datePart);
            break;
        case 'D':
            day = parseInt(datePart);
            break;
        case 'Y':
            year = parseInt(datePart);
            break;
        default:
            // If the format part is not one of the valid options, return false
            return false;
        }
    }
    
    // Check if the year has 2 or 4 digits
    if (year.toString().length === 2) {
        if (year < 50) {
        year += 2000;
        } else {
        year += 1900;
        }
    } else if (year.toString().length !== 4) {
        // If the year has neither 2 nor 4 digits, return false
        return false;
    }
    
    // Check if the date is valid
    if (month < 1 || month > 12 || day < 1 || day > 31) {
        return false;
    }
    
    // If all checks have passed, return true
    return true;
}
