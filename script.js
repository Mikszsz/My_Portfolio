document.addEventListener("DOMContentLoaded", function(){

const midtermTasks=[

{
title:"Midterm Lab Task 1",
description:"Data Cleaning and Preparation using Excel",
link:"midterm_task1.html"
},

{
title:"Midterm Lab Task 2",
description:"Data Analysis using Pivot Table",
link:"midterm_task2.html"
},

{
title:"Midterm Lab Task 3",
description:"Data Prep and Cleaning and Modeling w Power Query",
link:"midterm_task3.html"
}

];

const projectGrid=document.getElementById("projectGrid");


function createCard(task){

const card=document.createElement("div");

card.classList.add("card");

card.innerHTML=`

<h3>${task.title}</h3>

<p>${task.description}</p>

<a href="${task.link}" target="_blank">

View Uploaded Task

</a>

`;

projectGrid.appendChild(card);

}


midtermTasks.forEach(createCard);


});