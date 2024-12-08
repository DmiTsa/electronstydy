const infoNode = document.querySelector('.info')
const btnNode = document.querySelector('#btn')
const inputNode = document.querySelector('#input')


infoNode.textContent = `INFO: chrome version: ${myAPI.chromeVersion()}`

console.log(inputNode);


btnNode.addEventListener('click', () => {
    const val = inputNode.value
    console.log(val);

    wordAPI.print(val)
})