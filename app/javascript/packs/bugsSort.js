// Get the bugs table & headers
let bugsTable = document.getElementById("bugs-table");
let tableHeaders = bugsTable.getElementsByTagName("th");

for(let i = 0; i < tableHeaders.length; i++) {
    tableHeaders[i].addEventListener('click', (e) => {
        let tbody = bugsTable.getElementsByTagName('tbody')[0];
        let tableRows = tbody.getElementsByTagName('tr');

        // Copy current table rows to array, then remove them from the table
        let tableRowsCopy = [];
        for(let tr of tableRows) {
            tableRowsCopy.push(tr);
        }
        for(let tr of tableRows) {
            tbody.removeChild(tr);
        }
        
        // Sort the table rows by the column's value and add them back to the table
        tableRowsCopy.sort((a, b) => {
            return a.cells[i].textContent.localeCompare(b.cells[i].textContent);
        })
        tableRowsCopy.forEach((element) => {
            tbody.appendChild(element);
        });
    });
}
