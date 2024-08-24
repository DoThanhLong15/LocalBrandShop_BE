/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


const input = document.getElementById('files');
const imageArea = document.getElementById('image-preview');

input.addEventListener('change', (e) => {
    if (e.target.files.length) {
        for(let file of e.target.files)
        {
            const src = URL.createObjectURL(file);

            imageArea.innerHTML += `
                <img width="120" src=${src} class="p-1"/>
            `;    
        };
    }
});