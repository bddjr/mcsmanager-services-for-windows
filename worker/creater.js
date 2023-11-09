console.log('creater.js started');

const mode = process.argv[2];
console.log(`mode: ${mode}`);

const node_windows = require('node-windows');
const Service = node_windows.Service;
const path = require('path');
const fs = require('fs');

function install(name){
    if (!['all', name].includes(mode)) return;
    console.log(`MCSManager-${name}`);

    let can_not_find = false;
    const workingDirectory = path.join(__dirname, `..\\..\\${name}\\`);
    if (!fs.existsSync(workingDirectory)){
        console.log(`Error: Can not find "${workingDirectory}"`);
        can_not_find = true;
    }
    const node_app_path = path.join(__dirname, `..\\..\\${name}\\node_app.exe`);
    if (!fs.existsSync(node_app_path)){
        console.log(`Error: Can not find "${node_app_path}"`);
        can_not_find = true;
    }
    const app_js_path = path.join(__dirname, `..\\..\\${name}\\app.js`);
    if (!fs.existsSync(app_js_path)){
        console.log(`Error: Can not find "${app_js_path}"`);
        can_not_find = true;
    }
    if (can_not_find) return;

    const svc = new Service({
        name: `MCSManager-${name}`,
        description: `MCSManager-${name}`,
        execPath: node_app_path,
        script: app_js_path,
        // @ts-ignore
        workingDirectory: workingDirectory,
    });
    svc.on('install',()=>{
        console.log(`MCSManager-${name} service on install`);
        if (svc.exists) console.log(`MCSManager-${name} service install success!`);
    });
    try{
        svc.install();
    } catch (e){
        console.error(e);
    }
}

install('daemon');
install('web');
