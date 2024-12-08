const { contextBridge, ipcRenderer } = require('electron')
const generateDocx = require('generate-docx')

const { exec } = require('child_process')
// const ffi = require('ffi-napi')
// const ref = require('ref-napi')


contextBridge.exposeInMainWorld('myAPI', {
    nodeVersion: () => process.versions.node,
    chromeVersion: () => process.versions.chrome,
    electronVersion: () => process.versions.electron
    // ping: () => ipcRenderer.invoke('ping')

})

contextBridge.exposeInMainWorld('wordAPI', {
    print: (str) => {
        // const scriptPath = 'C:\\Users\\Dmitry\\Documents\\electronstydy\\wordReplace.ps1';
        const templatePath = 'C:\\Users\\Dmitry\\Documents\\electronstydy\\word.docx';
        const outputPath = 'C:\\Users\\Dmitry\\Documents\\electronstydy\\done.docx';

        const options = {
            template: {
                filePath: templatePath,
                data: {
                    title: str || "NA",
                    description: 'Протокол заседания комисии',
                    body: 'My body is my temple'
                }
            },
            save: {
                filePath: outputPath,
            }
        }

        generateDocx(options)
            .then(() => {
                const command = `start winword "${outputPath}"`;

                exec(command)
            })
            .catch(console.error)
    }
})