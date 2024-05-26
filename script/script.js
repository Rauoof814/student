// Fetch the student and advisor data from the PHP script
function fetchStudentList() {
    fetch('index.php?fetch=true')
        .then(response => response.json())
        .then(data => {
            // Ensure the response has the correct structure
            if (data.students && data.advisors) {
                // Populate student list
                const list = document.getElementById('studentList');
                list.innerHTML = '';
                data.students.forEach(student => {
                    const listItem = document.createElement('li');
                    listItem.textContent = `${student.last}, ${student.first}`;
                    list.appendChild(listItem);
                });

                // Populate advisor dropdown
                const advisorSelect = document.getElementById('advisor');
                advisorSelect.innerHTML = '';
                data.advisors.forEach(advisor => {
                    const option = document.createElement('option');
                    option.value = advisor.advisor_id;
                    option.textContent = `${advisor.advisor_first} ${advisor.advisor_last}`;
                    advisorSelect.appendChild(option);
                });
            } else {
                console.error('Unexpected data structure:', data);
            }
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}

// Fetch the student list on page load
fetchStudentList();

// Handle form submission to add a new student
document.getElementById('addStudentForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const formData = new FormData(this);
    fetch('index.php', {
        method: 'POST',
        body: formData
    })
        .then(response => response.text())
        .then(message => {
            alert(message);
            fetchStudentList();
            this.reset();
        })
        .catch(error => {
            console.error('Error adding student:', error);
        });
});
